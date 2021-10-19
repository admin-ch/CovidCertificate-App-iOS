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
    static let validPeriod: TimeInterval = 60 * 60 * 24 * 30 // 30 days
    static let expiredPeriod: TimeInterval = 60 * 60 * 24 * 33 // 33 days

    enum State: Equatable {
        case valid
        case expired
        case failed
    }

    var state: State {
        let interval = Date().timeIntervalSince(created)
        switch interval {
        case let x where x <= Self.validPeriod:
            #if Wallet
                if TransferManager.shared.hasKey(code: transferCode) {
                    return .valid
                } else {
                    return .failed
                }
            #else
                return .valid
            #endif
        case let x where x <= Self.expiredPeriod:
            return .expired
        default:
            return .failed
        }
    }

    var validDays: Int? {
        let day: TimeInterval = 60 * 60 * 24
        let validUntil = created.addingTimeInterval(Self.validPeriod).timeIntervalSince(Date())

        if validUntil < 0 {
            return nil
        } else if validUntil >= day * 29 {
            return 30
        } else {
            return Int((validUntil / day).rounded(.up))
        }
    }

    var validityIcon: UIImage? {
        switch validDays {
        case let .some(x) where x >= 1 && x <= 30:
            let imageIndex = min(max(Int(Double(x) / 30 * 7), 1), 7)
            return UIImage(named: "ic-expire-\(imageIndex)")
        default:
            return nil
        }
    }

    var validDaysText: NSAttributedString? {
        switch validDays {
        case 1:
            return UBLocalized.wallet_transfer_code_expire_singular.formattingOccurrenceBold(UBLocalized.wallet_transfer_code_expire_singular_bold)
        case let .some(x) where x >= 2 && x <= 30:
            return UBLocalized.wallet_transfer_code_expire_plural.replacingOccurrences(of: "{DAYS}", with: "\(x)").formattingOccurrenceBold(UBLocalized.wallet_transfer_code_expire_plural_bold.replacingOccurrences(of: "{DAYS}", with: "\(x)"))
        default:
            return nil
        }
    }
}
