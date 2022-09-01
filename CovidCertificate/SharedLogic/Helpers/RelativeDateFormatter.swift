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

import CovidCertificateSDK
import Foundation

enum RelativeDateFormatter {
    static func string(from date: Date?, certType: ImmunisationType) -> String? {
        guard let date = date else { return nil }
        let now = Date()
        let hours = Calendar.current.dateComponents([.hour], from: date, to: now).hour ?? 0
        let days = Calendar.current.dateComponents([.day], from: date, to: now).day ?? 0

        switch certType {
        case .test:
            if hours <= 1 {
                return UBLocalized.wallet_validity_since_hours_singular
            } else if hours <= 72 {
                return UBLocalized.wallet_validity_since_hours_plural.replacingOccurrences(of: "{HOURS}", with: "\(hours)")
            } else {
                return UBLocalized.wallet_validity_since_hours_plural.replacingOccurrences(of: "{HOURS}", with: "72")
            }
        default:
            if days == 0 {
                if hours <= 1 {
                    return UBLocalized.wallet_validity_since_hours_singular
                } else {
                    return UBLocalized.wallet_validity_since_hours_plural.replacingOccurrences(of: "{HOURS}", with: "\(hours)")
                }
            } else {
                if days <= 1 {
                    return UBLocalized.wallet_validity_since_days_singular
                } else {
                    return UBLocalized.wallet_validity_since_days_plural.replacingOccurrences(of: "{DAYS}", with: "\(days)")
                }
            }
        }
    }
}
