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

class TransfercodeTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testCreateTransfercode() throws {
        let app = XCUIApplication()
        app.setOnboarding(completed: true)
        app.launch()

        app.buttons[.wallet_homescreen_add_transfer_code_key].assertExists().tap()
        app.buttons[.wallet_transfer_code_create_code_button_key].assertExists().tap()
        app.staticTexts[.wallet_transfer_code_code_created_title_key, true].assertExists()
        app.buttons[.wallet_transfer_code_done_button_key].assertExists().tap()

        if app.staticTexts[.wallet_notification_permission_text_key, true].waitForExistence(timeout: 1.0) {
            app.buttons[.continue_button_key].assertExists().tap()
            XCUIApplication.allowNotificationPermission()
        }

        // Delete transfercode
        app.scrollViews.firstMatch.tap()
        app.scrollViews.firstMatch.scrollToElement(element: app.buttons[.delete_button_key])
        app.buttons[.delete_button_key].assertExists().tap()
        app.sheets.firstMatch.buttons[.delete_button_key, true].assertExists().tap()

        // No transfercode should be visible
        app.buttons[.wallet_homescreen_add_transfer_code_key].assertExists()
    }
}
