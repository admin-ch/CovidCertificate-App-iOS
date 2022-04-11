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

extension XCUIElementQuery {
    subscript(key: UBLocalized.Key, localized: Bool = false) -> XCUIElement {
        if localized {
            return self[UBLocalized.translate(key)]
        } else {
            return self[key.rawValue]
        }
    }
}
