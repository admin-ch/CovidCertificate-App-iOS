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

import Foundation

import XCTest

final class LuhnTests: XCTestCase {
    func testLuhn() {
        let luhnCode = Luhn.generateLuhnCode()
        let result = Luhn.checkLuhnCode(luhnCode)
        XCTAssertTrue(result)
    }

    func testLuhnCases() {
        let codes = [
            "Y8P8ECFN8",
            "HDTYRB66W",
            "YS6R7H88T",
            "K42K6F7R2",
            "3BY8DAZYS",
            "ADWYF11SY",
            "453S6HUA6",
            "WR7UPHB4A",
            "37WDPRSKM",
            "01AWUUB2M",
            "MA4S9CNUK",
            "SY7M684WA",
            "X216WN3YF",
            "3C2YFKCNP",
            "TNKBZ0TSK",
            "CHARM",
            "SW1SS9",
            "APPS1",
            "TRANSFERC0DET",
        ]
        for c in codes {
            print(c)
            print(Luhn.checkLuhnCode(c))
            XCTAssertTrue(Luhn.checkLuhnCode(c))
        }

        let wrongCodes = [
            "Y8P8ECFN9",
            "HDTYRC66W",
            "YS6RH788T",
            "K43K6F7R2",
            "3B8YDAZYS",
            "ADWFY11SY",
            "453S6HU6A",
            "WR7UHPB4A",
            "37WDRPSKM",
            "10AWUUB2M",
            "MAS49CNUK",
            "SY7M864WA",
            "$%(*(!@#$_!@*#",
        ]
        for c in wrongCodes {
            print(c)
            print(Luhn.checkLuhnCode(c))
            XCTAssertFalse(Luhn.checkLuhnCode(c))
        }
    }
}
