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
        guard TestEnviroment.networkCondition != .airplane else { return }

        let app = XCUIApplication()
        app.setOnboarding(completed: true)
        app.launch()

        app.closeInfoboxIfVisible()

        XCTAssertEqual(app.countTransfercodes, 0)
        app.createTransfercode()
        XCTAssertEqual(app.countTransfercodes, 1)
        app.deleteVisibleTransfercode()
        XCTAssertEqual(app.countTransfercodes, 0)
    }

    func testCreateMultipleTransfercodes() {
        guard TestEnviroment.networkCondition != .airplane else { return }

        let app = XCUIApplication()
        app.setOnboarding(completed: true)
        app.launch()

        app.closeInfoboxIfVisible()

        XCTAssertEqual(app.countTransfercodes, 0)
        app.createTransfercode()
        XCTAssertEqual(app.countTransfercodes, 1)
        app.createTransfercode()
        XCTAssertEqual(app.countTransfercodes, 2)
        app.deleteVisibleTransfercode()
        XCTAssertEqual(app.countTransfercodes, 1)
        app.deleteVisibleTransfercode()
        XCTAssertEqual(app.countTransfercodes, 0)
    }
}

extension XCUIApplication {
    func createTransfercode() {
        let isFirst = countTransfercodes == 0
        if isFirst {
            // TODO: this button is not found when info popup is on
            buttons[.wallet_homescreen_add_transfer_code_key].assertExists().tap()
        } else {
            buttons[.accessibility_add_button_key].assertExists().tap()
            buttons[.wallet_homescreen_add_transfer_code_key].assertExists().tap()
        }

        buttons[.wallet_transfer_code_create_code_button_key].assertExists().tap()

        staticTexts[.wallet_transfer_code_code_created_title_key, true].assertExists()
        buttons[.wallet_transfer_code_done_button_key].assertExists().tap()

        if staticTexts[.wallet_notification_permission_text_key, true].waitForExistence(timeout: 1.0) {
            buttons[.continue_button_key].assertExists().tap()
            XCUIApplication.allowNotificationPermission()
        }
    }

    func deleteVisibleTransfercode() {
        scrollViews.firstMatch.tap()
        scrollViews.firstMatch.scrollToElement(element: buttons[.delete_button_key])
        buttons[.delete_button_key].assertExists().tap()
        sheets.firstMatch.buttons[.delete_button_key, true].assertExists().tap()
    }

    var countTransfercodes: Int {
        _ = otherElements["HomescreenCertificateView.TransferView"].waitForExistence(timeout: 1.0)
        return otherElements.matching(identifier: "HomescreenCertificateView.TransferView").count
    }
}
