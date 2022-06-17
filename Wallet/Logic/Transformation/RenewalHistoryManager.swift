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

class RenewalHistoryManager {
    static let shared = RenewalHistoryManager()
    private init() {}

    func addRenewal(uvci: String) {
        removeRenewal(uvci: uvci)
        WalletUserStorage.shared.renewalDates.append(RenewalHistoryEntry(uvci: uvci, timestamp: Date()))
        UIStateManager.shared.stateChanged()
    }

    func removeRenewal(uvci: String) {
        let countBefore = WalletUserStorage.shared.renewalDates.count
        WalletUserStorage.shared.renewalDates = WalletUserStorage.shared.renewalDates.filter {
            $0.uvci != uvci
        }
        if countBefore != WalletUserStorage.shared.renewalDates.count {
            UIStateManager.shared.stateChanged()
        }
    }

    func removeAll() {
        WalletUserStorage.shared.renewalDates = []
    }

    func shouldShowWasRenewedBanner(for uvci: String) -> Bool {
        cleanupOldRenewals()
        return WalletUserStorage.shared.renewalDates.contains(where: { $0.uvci == uvci })
    }

    func cleanupOldRenewals() {
        let countBefore = WalletUserStorage.shared.renewalDates.count
        let now = Date()
        WalletUserStorage.shared.renewalDates = WalletUserStorage.shared.renewalDates.filter {
            now.timeIntervalSince($0.timestamp) < 60 * 60 * 24 * 14
        }
        if countBefore != WalletUserStorage.shared.renewalDates.count {
            UIStateManager.shared.stateChanged()
        }
    }
}
