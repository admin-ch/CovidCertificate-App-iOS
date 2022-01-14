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
import XCTest

extension XCUIElement {
    @discardableResult
    func assertExists(_ timeout: TimeInterval = TestEnviroment.networkCondition == .slow ? 60 : 10) -> Self {
        guard !exists else {
            XCTAssert(exists)
            return self
        }
        XCTAssert(waitForExistence(timeout: timeout))
        return self
    }

    @discardableResult
    func assertNotExist(_ timeout: TimeInterval = 10) -> Self {
        guard exists else {
            XCTAssertFalse(exists)
            return self
        }
        XCTAssertFalse(waitForExistence(timeout: timeout))
        return self
    }
}

extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        while !element.visible() {
            swipeUp()
        }
    }

    func visible() -> Bool {
        guard exists, !frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(frame)
    }
}
