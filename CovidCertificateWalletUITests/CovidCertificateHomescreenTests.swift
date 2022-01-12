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

class CovidCertificateHomescreenTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testShowHomescreen() throws {
        let app = XCUIApplication()
        app.setOnboarding(completed: true)
        app.launch()
        app.buttons[.wallet_homescreen_qr_code_scannen_key].assertExists()
        app.buttons[.wallet_homescreen_pdf_import_key].assertExists()
        app.buttons[.wallet_homescreen_add_transfer_code_key].assertExists()
        app.buttons[.wallet_homescreen_add_transfer_code_key].assertExists()
        app.buttons[.vaccination_homescreen_button_title_key].assertExists()
    }
}
