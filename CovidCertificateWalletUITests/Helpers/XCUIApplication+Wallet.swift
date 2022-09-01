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

import XCTest

extension XCUIApplication {
    @discardableResult
    func setOnboarding(completed: Bool) -> Self {
        launchArguments += ["-wallet.user.hasCompletedOnboarding", "\(completed ? "YES" : "NO")"]
        launchArguments += ["-wallet.user.hasCompletedUpdateBoarding2022.8", "\(completed ? "YES" : "NO")"]
        return self
    }

    static func allowNotificationPermission() {
        let app = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        let button = app.alerts.firstMatch.buttons["Allow"]
        if button.waitForExistence(timeout: 2) {
            button.tap()
        } else {
            let button = app.alerts.firstMatch.buttons["Erlauben"]
            if button.waitForExistence(timeout: 2) {
                button.tap()
            }
        }
    }

    func closeInfoboxIfVisible() {
        if otherElements["InfoBoxView"].buttons[UBLocalized.Key.close_button].waitForExistence(timeout: 1.0) {
            otherElements["InfoBoxView"].buttons[UBLocalized.Key.close_button].tap()
        }
    }
}
