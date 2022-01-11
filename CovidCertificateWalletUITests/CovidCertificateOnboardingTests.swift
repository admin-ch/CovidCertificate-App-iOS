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

class CovidCertificateUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testShowOnboardingFirstLaunch() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-wallet.user.hasCompletedOnboarding", "false"]
        app.launch()
        XCTAssert(app.buttons[.continue_button_key].exists)
        app.buttons[.continue_button_key].tap()
        app.buttons[.continue_button_key].tap()
        app.buttons[.continue_button_key].tap()
        app.buttons[.wallet_onboarding_accept_button_key].tap()
        app.terminate()

        // on the next launch the onboarding should not be shown
        app.launchArguments = []
        app.launch()
        XCTAssertFalse(app.buttons[.continue_button_key].exists)
    }
}
