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

class RefreshButtonVisibilityManager {
    enum VisibilityState {
        case refreshButton
        case infoButton
        case none
    }

    @UBUserDefault(key: "refreshButtonDisabledDate", defaultValue: nil)
    static var refreshButtonDisabledDate: Date?

    static let showInfoButtonTimeInterval: TimeInterval = 60 * 60 * 24 * 14 // 14d

    static var state: VisibilityState {
        let refreshButtonDisabled = ConfigManager.currentConfig?.refreshButtonDisabled ?? false

        guard refreshButtonDisabled == true else {
            // if the refreshbutton is not disabled we reset the last stored date
            Self.refreshButtonDisabledDate = nil
            // and the refreshButton should be visible
            return .refreshButton
        }

        // if no date is stored we store the current timestamp
        let disabledDate = Self.refreshButtonDisabledDate ?? Date()
        Self.refreshButtonDisabledDate = disabledDate

        // if the stored timestamp is not older than showInfoButtonTimeInterval we show the info button
        if abs(disabledDate.timeIntervalSinceNow) < Self.showInfoButtonTimeInterval {
            return .infoButton
        }

        // otherwise we don't show anything
        return .none
    }
}
