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

            let hasTransferCode = !CertificateStorage.shared.openTransferCodes.isEmpty
            UBPushManager.shared.queryPushPermissions { enabled in
                if enabled {
                    // disable push when there are no transfer codes
                    UBPushManager.shared.setActive(hasTransferCode)
                }
            }

            DispatchQueue.global().async {
                strongSelf.updateAllOpenCodes()
            }
        }
    }

    // MARK: - Properties

    // this queue protects cachedResult and cachedLastLoad from threading issues
    private let queue = DispatchQueue(label: "TransferManager")

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
        queue.sync {
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
    }

    func getCachedResult(code: String) -> TransferCodeResult? {
        queue.sync {
            cachedResult[safe: code]
        }
    }

    func getLastLoad(code: String) -> Date? {
        return cachedLastLoad.first(where: { $0.code == code })?.lastLoad
    }

    func hasKey(code: String) -> Bool {
        if case .success = Crypto.loadKey(name: code) {
            return true
        }
        return false
    }

    func download(code: String, result completion: ((TransferCodeResult) -> Void)? = nil) {
        #if DEBUG
            LocalPush.shared.showDebugNotification(title: "Debug", body: "Transfermanager download for code: \(code) called at \(Date().description)")
        #endif
        DispatchQueue.global().async {
            let result = InAppDelivery.shared.tryDownloadCertificate(withCode: code)
            self.queue.sync {
                self.cachedResult[code] = result

                var lastLoadCacheCopy = self.cachedLastLoad.filter { $0.code != code }
                lastLoadCacheCopy.append(LastLoad(code: code, lastLoad: .init()))
                self.cachedLastLoad = lastLoadCacheCopy

                switch result {
                case let .success(certificates):
                    guard certificates.count > 0 else { break }

                    // if a certificate was downloaded we schedule a local notification
                    LocalPush.shared.scheduleNotification(identifier: code)

                    Self.updateCertificateStorage(code: code, certificates: certificates, languageKey: UBLocalized.language_key)

                    // certificates were inserted, can be deleted on backend (best effort)
                    _ = InAppDelivery.shared.tryDeleteCertificate(withCode: code)

                    // delete caches
                    self.cachedResult = self.cachedResult.filter { $0.key != code }
                    self.cachedLastLoad = self.cachedLastLoad.filter { $0.code != code }
                case .failure:
                    break
                }

                self.updateObservers(for: code, state: result)
            }
            completion?(result)
        }
    }

    static func updateCertificateStorage(code: String, certificates: [DecryptedCertificate], languageKey: String) {
        // get created date of object with transfer-code equal to code
        let created: Date? = CertificateStorage.shared.userCertificates.first { $0.transferCode?.transferCode ?? "" == code }?.transferCode?.created

        // update card of transfer-code to have a certificate
        if let first = certificates.first {
            CertificateStorage.shared.updateCertificate(with: code, qrCode: first.cert, pdf: first.pdf, pdfLanguage: languageKey)
        }

        // add all additional codes
        let certs: [UserCertificate] = certificates
            .dropFirst()
            .map { UserCertificate(qrCode: $0.cert, transferCode: UserTransferCode(transferCode: code, created: created ?? Date()), pdf: $0.pdf, pdfLanguage: languageKey) }
        CertificateStorage.shared.insertCertificates(certificates: certs)
    }

    public func updateAllOpenCodes() {
        for code in CertificateStorage.shared.openTransferCodes {
            let semaphore = DispatchSemaphore(value: 0)

            download(code: code) { result in
                switch result {
                case .success:
                    Logger.log("updateAllOpenCodes succeeded")
                case .failure:
                    Logger.log("updateAllOpenCodes failed: \(result)")
                }

                semaphore.signal()
            }

            _ = semaphore.wait(timeout: .distantFuture)
        }
    }
}
