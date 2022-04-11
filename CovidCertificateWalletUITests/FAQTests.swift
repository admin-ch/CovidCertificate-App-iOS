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

class FAQTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testShowFAQwhenOffline() {
        guard TestEnviroment.networkCondition == .airplane else { return }

        let app = XCUIApplication()
        app.setOnboarding(completed: true)
        app.launch()

        app.buttons[UBLocalized.Key.accessibility_faq_button].tap()
        app.staticTexts["StaticContentViewModel_Titel_Label_0"].assertExists()
    }
}
