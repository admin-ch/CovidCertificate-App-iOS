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
}
