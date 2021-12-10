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

    fileprivate static let checkModeValidPeriodHours: Int = 48

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

        let validPeriod = ConfigManager.currentConfig?.checkModeReselectAfterHours ?? Self.checkModeValidPeriodHours
        return Date() > last.addingTimeInterval(TimeInterval(60 * 60 * validPeriod))
    }
}
