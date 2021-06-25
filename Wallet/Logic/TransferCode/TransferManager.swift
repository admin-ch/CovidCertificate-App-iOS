//
/*
 * Copyright (c) 2021 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

import Foundation

public typealias TransferCodeResult = Result<[DecryptedCertificate], TransferError>

final class TransferManager {
    // MARK: - Singleton

    static let shared = TransferManager()

    private init() {
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { [weak self] _ in
            guard let strongSelf = self else { return }
            DispatchQueue.global().async {
                strongSelf.updateAllOpenCodes()
            }
        }
    }

    // MARK: - Properties

    private var cachedResult: [String: TransferCodeResult] = [:]

    struct LastLoad: UBCodable {
        let code: String
        let lastLoad: Date
    }

    @UBUserDefault(key: "transfercode.cachedLastLoad", defaultValue: [])
    private var cachedLastLoad: [LastLoad]

    // MARK: - State Observers

    private struct Observer {
        weak var object: AnyObject?
        var block: (TransferCodeResult) -> Void
    }

    private var observers: [String: [Observer]] = [:]

    private func updateObservers(for qrString: String, state: TransferCodeResult) {
        guard let list = observers[qrString] else { return }
        let newList = list.filter { $0.object != nil }

        DispatchQueue.main.async {
            newList.forEach { $0.block(state) }
        }
    }

    // MARK: - Public API

    func addObserver(_ object: AnyObject, for code: String, forceUpdate: Bool = false, block: @escaping (TransferCodeResult) -> Void) {
        if observers[code] != nil {
            observers[code] = observers[code]!.filter { $0.object != nil && !$0.object!.isEqual(object) }
            observers[code]?.append(Observer(object: object, block: block))
        } else {
            observers[code] = [Observer(object: object, block: block)]
        }

        if let result = cachedResult[safe: code], !forceUpdate {
            // Return last cached result
            block(result)
        } else {
            download(code: code)
        }
    }

    func getLastLoad(code: String) -> Date? {
        return cachedLastLoad.first(where: { $0.code == code })?.lastLoad
    }

    func download(code: String, result completion: ((TransferCodeResult) -> Void)? = nil) {
        DispatchQueue.global().async {
            let result = InAppDelivery.shared.tryDownloadCertificate(withCode: code)
            self.cachedResult[code] = result

            var lastLoadCacheCopy = self.cachedLastLoad.filter { $0.code != code }
            lastLoadCacheCopy.append(LastLoad(code: code, lastLoad: .init()))
            self.cachedLastLoad = lastLoadCacheCopy

            switch result {
            case let .success(certificates):
                guard certificates.count > 0 else { break }

                Self.updateCertificateStorage(code: code, certificates: certificates)

                // certificates were inserted, can be deleted on backend (best effort)
                _ = InAppDelivery.shared.tryDeleteCertificate(withCode: code)

                // delete caches
                self.cachedResult = self.cachedResult.filter { $0.key != code }
                self.cachedLastLoad = self.cachedLastLoad.filter { $0.code != code }
            case .failure:
                break
            }

            self.updateObservers(for: code, state: result)

            completion?(result)
        }
    }

    static func updateCertificateStorage(code: String, certificates: [DecryptedCertificate]) {
        // get created date of object with transfer-code equal to code
        let created: Date? = CertificateStorage.shared.userCertificates.first { $0.transferCode?.transferCode ?? "" == code }?.transferCode?.created

        // update card of transfer-code to have a certificate
        if let first = certificates.first {
            CertificateStorage.shared.updateCertificate(with: code, qrCode: first.cert)
        }

        // add all additional codes
        let certs: [UserCertificate] = certificates.map { UserCertificate(qrCode: $0.cert, transferCode: UserTransferCode(transferCode: code, created: created ?? Date())) }
        CertificateStorage.shared.insertCertificates(certificates: certs)
    }

    @discardableResult
    public func updateAllOpenCodes() -> [String] {
        var downloadedCertificates: [String] = []

        for code in CertificateStorage.shared.openTransferCodes {
            let semaphore = DispatchSemaphore(value: 0)

            download(code: code) { result in
                switch result {
                case let .success(certificates):
                    guard certificates.count > 0 else { break }
                    downloadedCertificates.append(code)
                case .failure:
                    Logger.log("tryDownloadCertificate failed: \(result)")
                }

                semaphore.signal()
            }

            _ = semaphore.wait(timeout: .distantFuture)
        }

        return downloadedCertificates
    }
}
