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

typealias TransferCodeResult = Result<[DecryptedCertificate], TransferError>

final class TransferManager {
    // MARK: - Singleton

    static let shared = TransferManager()

    private init() {
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { [weak self] _ in
            guard let strongSelf = self else { return }
            for (code, downloader) in strongSelf.downloaders {
                downloader.tryDownloadCertificate(withCode: code) { [weak strongSelf] result in
                    guard let strongSelf = strongSelf else { return }
                    strongSelf.updateCertificates(code: code, result: result)
                    strongSelf.updateObservers(for: code, state: result)
                }
            }
        }
    }

    // MARK: - Properties

    private var downloaders: [String: InAppDelivery] = [:]
    private var deleters: [String: InAppDelivery] = [:]

    // MARK: - State Observers

    private struct Observer {
        weak var object: AnyObject?
        var block: (TransferCodeResult) -> Void
    }

    private var observers: [String: [Observer]] = [:]

    private func updateObservers(for qrString: String, state: TransferCodeResult) {
        guard let list = observers[qrString] else { return }
        let newList = list.filter { $0.object != nil }

        guard !newList.isEmpty else {
            downloaders[qrString] = nil
            return
        }

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

        if let v = downloaders[code] {
            if let result = v.lastResult, !forceUpdate {
                // Return last cached result
                block(result)
            } else {
                v.tryDownloadCertificate(withCode: code) { [weak self] result in
                    guard let strongSelf = self else { return }
                    strongSelf.updateCertificates(code: code, result: result)
                    strongSelf.updateObservers(for: code, state: result)
                }
            }
        } else {
            let v = InAppDelivery()
            downloaders[code] = v

            v.tryDownloadCertificate(withCode: code) { [weak self] result in
                guard let strongSelf = self else { return }
                strongSelf.updateCertificates(code: code, result: result)
                strongSelf.updateObservers(for: code, state: result)
            }
        }
    }

    func download(code: String, completionBlock: ) {


    }

    func updateCertificates(code: String, result: TransferCodeResult) {
        switch result {
        case let .success(certificates):
            guard certificates.count > 0 else { break }

            Self.updateCertificateStorage(code: code, certificates: certificates)

            // certificates were inserted, can be deleted on backend (best effort)
            deleters[code] = InAppDelivery()
            deleters[code]?.tryDeleteCertificate(withCode: code, callback: { [weak self] _ in
                guard let strongSelf = self else { return }
                strongSelf.deleters[code] = nil
            })

        case .failure:
            break
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

    public func updateAllOpenCodes(completion: @escaping (_ downloadedCertificates: [String]) -> Void) {
        var downloadedCertificates: [String] = []

        for code in CertificateStorage.shared.openTransferCodes {
            let semaphore = DispatchSemaphore(value: 0)

            let delivery = InAppDelivery()
            delivery.tryDownloadCertificate(withCode: code) { result in
                switch result {
                case let .success(certificates):
                    guard certificates.count > 0 else { break }
                    Self.updateCertificateStorage(code: code, certificates: certificates)
                    delivery.tryDeleteCertificate(withCode: code, callback: { [weak self] _ in
                        guard let strongSelf = self else { return }
                        strongSelf.deleters[code] = nil
                    })
                    downloadedCertificates.append(code)
                case .failure:
                    Logger.log("tryDownloadCertificate failed: \(result)")
                }

                semaphore.signal()
            }

            _ = semaphore.wait(timeout: .distantFuture)
        }

        completion(downloadedCertificates)
    }
}
