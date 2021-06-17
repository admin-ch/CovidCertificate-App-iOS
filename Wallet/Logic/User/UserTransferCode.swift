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

struct UserTransferCode: Codable, Equatable {
    let transferCode: String
    let created: Date
}

extension UserTransferCode {
    var isValid: Bool {
        created.addingTimeInterval(60 * 60 * 24 * 7) >= Date()
    }

    var validDays: Int? {
        let day: TimeInterval = 60 * 60 * 24
        let validUntil = created.addingTimeInterval(day * 7).timeIntervalSince(Date()) // 7 days

        if validUntil < 0 {
            return nil
        } else if validUntil >= day * 6 {
            return 7
        } else {
            return Int((validUntil / day).rounded(.up))
        }
    }

    var validityIcon: UIImage? {
        switch validDays {
        case let .some(x) where x >= 1 && x <= 7:
            return UIImage(named: "ic-expire-\(x)")
        default:
            return nil
        }
    }

    var validDaysText: NSAttributedString? {
        switch validDays {
        case 1:
            return UBLocalized.wallet_transfer_code_expire_singular.formattingOccurrenceBold(UBLocalized.wallet_transfer_code_expire_singular_bold)
        case let .some(x) where x >= 2 && x <= 7:
            return UBLocalized.wallet_transfer_code_expire_plural.replacingOccurrences(of: "{DAYS}", with: "\(x)").formattingOccurrenceBold(UBLocalized.wallet_transfer_code_expire_plural_bold.replacingOccurrences(of: "{DAYS}", with: "\(x)"))
        default:
            return nil
        }
    }
}
