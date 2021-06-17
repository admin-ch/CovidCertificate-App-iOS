/*
 * Copyright (c) 2021 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

// simple user storage only for User Default values
class WalletUserStorage {
    static let shared = WalletUserStorage()

    @UBUserDefault(key: "wallet.user.hasCompletedOnboarding", defaultValue: false)
    var hasCompletedOnboarding: Bool {
        didSet {
            ConfigManager().startConfigRequest(window: UIApplication.shared.keyWindow?.window)
        }
    }
}

class CertificateStorage {
    static let shared = CertificateStorage()

    @KeychainPersisted(key: "wallet.user.certificates", defaultValue: [])
    var userCertificates: [UserCertificate] {
        didSet { UIStateManager.shared.stateChanged() }
    }

    func insertCertificate(userCertificate: UserCertificate) {
        if !userCertificates.contains(userCertificate) {
            userCertificates.insert(userCertificate, at: 0)
        }
    }

    func updateCertificate(with transferCode: String, qrCode: String?) {
        userCertificates = userCertificates.map { uc in
            if let t = uc.transferCode?.transferCode, t == transferCode {
                return UserCertificate(qrCode: qrCode, transferCode: uc.transferCode)
            }

            return uc
        }
    }
}
