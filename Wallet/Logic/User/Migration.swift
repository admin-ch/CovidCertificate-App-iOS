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

class Migration {
    // MARK: - Migration to SecureStorage

    static func migrateToSecureStorage() {
        guard !WalletUserStorage.shared.hasCompletedSecureStorageMigration else {
            return
        }

        // get keychain certificats
        let certificates = CertificateStorage.shared.keyChainUserCertificates

        // add them to new storage
        CertificateStorage.shared.userCertificates = certificates

        // remove certificates in keychain
        CertificateStorage.shared.keyChainUserCertificates = []

        WalletUserStorage.shared.hasCompletedSecureStorageMigration = true
    }
}
