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

final class TransferManager {
    // MARK: - Singleton

    static let shared = TransferManager()

    private init() {}

    // MARK: - Properties

    private var downloaders: [String: InAppDelivery] = [:]

    // MARK: - State Observers

    private struct Observer {
        weak var object: AnyObject?
        var block: (Result<[DecryptedCertificate], CryptoError>) -> Void
    }

    private var observers: [String: [Observer]] = [:]

    private func updateObservers(for qrString: String, state: Result<[DecryptedCertificate], CryptoError>) {
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

    func addObserver(_ object: AnyObject, for code: String, forceUpdate _: Bool = false, block: @escaping (Result<[DecryptedCertificate], CryptoError>) -> Void) {
        if observers[code] != nil {
            observers[code] = observers[code]!.filter { $0.object != nil && !$0.object!.isEqual(object) }
            observers[code]?.append(Observer(object: object, block: block))
        } else {
            observers[code] = [Observer(object: object, block: block)]
        }

        if let v = downloaders[code] {
            v.tryDownloadCertificate(withCode: code) { [weak self] result in
                guard let strongSelf = self else { return }
                strongSelf.updateObservers(for: code, state: result)
            }
        } else {
            let v = InAppDelivery()
            downloaders[code] = v

            v.tryDownloadCertificate(withCode: code) { [weak self] result in
                guard let strongSelf = self else { return }
                strongSelf.updateObservers(for: code, state: result)
            }
        }
    }
}
