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

struct WalletScanCounter {
    private init() {}

    static func trackScan(date: Date) {
        // Add the latest scan date. We only ever consider the 10 latest scan dates
        var dates = WalletUserStorage.shared.lastScanDates.suffix(9) + [date]
        dates.sort()
        WalletUserStorage.shared.lastScanDates = Array(dates)
    }

    static func shouldShowTooManyScansWarning() -> Bool {
        let dates = WalletUserStorage.shared.lastScanDates
        // If there are less than 10 scan dates, don't show the warning
        if dates.count < 10 {
            return false
        }

        // If 10 scans have happened within 24 hours, show the warning
        return dates.last!.timeIntervalSince(dates.first!) < 60 * 60 * 24
    }

    static func resetScanCount() {
        WalletUserStorage.shared.lastScanDates = []
    }
}
