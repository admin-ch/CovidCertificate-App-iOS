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

enum RelativeDateFormatter {
    static func string(from date: Date?) -> String? {
        guard let date = date else { return nil }
        let now = Date()
        let hours = Calendar.current.dateComponents([.hour], from: date, to: now).hour ?? 0
        if hours <= 1 {
            return UBLocalized.wallet_validity_since_hours_singular
        } else if hours <= 72 {
            return UBLocalized.wallet_validity_since_hours_plural.replacingOccurrences(of: "{HOURS}", with: "\(hours)")
        }
        let days = Calendar.current.dateComponents([.day], from: date, to: now).day ?? 0
        if days <= 1 {
            return UBLocalized.wallet_validity_since_days_singular
        }
        return UBLocalized.wallet_validity_since_days_plural.replacingOccurrences(of: "{DAYS}", with: "\(days)")
    }
}
