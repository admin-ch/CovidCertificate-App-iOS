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
    func assertExists(_ timeout: TimeInterval = 10) {
        guard !exists else {
            XCTAssert(exists)
            return
        }
        XCTAssert(waitForExistence(timeout: timeout))
    }

    func assertNotExist(_ timeout: TimeInterval = 10) {
        guard exists else {
            XCTAssertFalse(exists)
            return
        }
        XCTAssertFalse(waitForExistence(timeout: timeout))
    }
}
