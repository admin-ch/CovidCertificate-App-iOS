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

class VerifierUserStorage {
    static let shared = VerifierUserStorage()

    fileprivate static let checkModeValidPeriod: TimeInterval = 60 * 60 * 24 * 2 // 2 days

    @UBUserDefault(key: "verifier.user.hasCompletedOnboarding", defaultValue: false)
    var hasCompletedOnboarding: Bool

    @UBUserDefault(key: "wallet.user.hasCompletedLightCertificateUpdateBoarding", defaultValue: false)
    var hasCompletedLightCertificateUpdateBoarding: Bool

    @UBUserDefault(key: "verifier.user.checkmode.key", defaultValue: nil)
    var checkModeKey: String? {
        didSet {
            lastCheckModeSetDate = Date()
            UIStateManager.shared.stateChanged()
        }
    }

    @UBUserDefault(key: "verifier.user.checkmode.set.date", defaultValue: nil)
    var lastCheckModeSetDate: Date?

    public func checkModeNeedsUpdate() -> Bool {
        guard let last = lastCheckModeSetDate else { return false }
        return Date() > last.addingTimeInterval(Self.checkModeValidPeriod)
    }
}
