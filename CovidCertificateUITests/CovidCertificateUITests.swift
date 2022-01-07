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

@testable import CovidCertificateWallet
import XCTest

class CovidCertificateUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testShowOnboardingFirstLaunch() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-wallet.user.hasCompletedOnboarding", "false"]
        app.launch()
        XCTAssert(app.staticTexts["WEITER"].exists)
        app.staticTexts["WEITER"].tap()
        app.staticTexts["WEITER"].tap()
        app.staticTexts["WEITER"].tap()
        app.staticTexts["AKZEPTIEREN"].tap()
        app.terminate()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
