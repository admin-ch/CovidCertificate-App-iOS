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
    init(transferCode: String, created: Date) {
        self.transferCode = transferCode
        self.created = created
        expiresAt = created.addingTimeInterval(Self.validPeriod)
        failsAt = created.addingTimeInterval(Self.expiredPeriod)
    }

    let transferCode: String
    let created: Date
    var expiresAt: Date?
    var failsAt: Date?
}

extension UserTransferCode {
    // MARK: - Periods

    fileprivate static let validPeriod: TimeInterval = 60 * 60 * 24 * 30 // 30 days
    fileprivate static let expiredPeriod: TimeInterval = 60 * 60 * 24 * 33 // 33 days

    // MARK: - State

    enum State: Equatable {
        case valid
        case expired
        case failed
    }

    // MARK: - API

    var state: State {
        let now = Date()

        if now <= expiryDate() {
            #if Wallet
                if TransferManager.shared.hasKey(code: transferCode) {
                    return .valid
                } else {
                    return .failed
                }
            #else
                return .valid
            #endif
        } else if now <= failDate() {
            return .expired
        } else {
            return .failed
        }
    }

    var validDays: Int? {
        let day: TimeInterval = 60 * 60 * 24
        let validUntil = expiryDate().timeIntervalSince(Date())

        if validUntil < 0 {
            return nil
        } else {
            return Int((validUntil / day).rounded(.up))
        }
    }

    var validityIcon: UIImage? {
        switch validDays {
        case let .some(x) where x >= 1:
            let fullInterval = expiryDate().timeIntervalSince(created)
            let part = Date().timeIntervalSince(created)
            let percentage = max(0.0, min(1.0 - (Double(part) / Double(fullInterval)), 1.0))
            let index = min(7, max(1, Int(round(percentage * 7) + 1)))
            return UIImage(named: "ic-expire-\(index)")
        default:
            return nil
        }
    }

    var validDaysText: NSAttributedString? {
        switch validDays {
        case 1:
            return UBLocalized.wallet_transfer_code_expire_singular.formattingOccurrenceBold(UBLocalized.wallet_transfer_code_expire_singular_bold)
        case let .some(x) where x >= 2:
            return UBLocalized.wallet_transfer_code_expire_plural.replacingOccurrences(of: "{DAYS}", with: "\(x)").formattingOccurrenceBold(UBLocalized.wallet_transfer_code_expire_plural_bold.replacingOccurrences(of: "{DAYS}", with: "\(x)"))
        default:
            return nil
        }
    }

    // MARK: - Dates

    private func expiryDate() -> Date {
        return expiresAt ?? created.addingTimeInterval(Self.validPeriod)
    }

    private func failDate() -> Date {
        return failsAt ?? created.addingTimeInterval(Self.expiredPeriod)
    }
}

extension UserTransferCode {
    // MARK: - Migration

    public mutating func migrateExpiresAndFailDate() {
        // transfer codes that need to be migrated where 7 days valid and failed
        // after 10 days
        expiresAt = created.addingTimeInterval(60 * 60 * 24 * 7)
        failsAt = created.addingTimeInterval(60 * 60 * 24 * 10)
    }
}
