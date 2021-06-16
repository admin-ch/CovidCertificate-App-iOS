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

//    func testInApp() {
//        let iap = InAppDelivery()
//        let expectations = expectation(description: "async task")
//        iap.registerNewCode { result in
//            let code = try? result.get()
//            XCTAssertNotNil(code)
//            print(code!)
//            iap.tryDownloadCertificate(withCode: code!) { result in
//                let certs = try? result.get()
//                XCTAssertNotNil(certs)
//                XCTAssertNotNil(certs![0].pdf)
//                XCTAssertNotNil(certs![0].cert)
//                expectations.fulfill()
//            }
//        }
//        waitForExpectations(timeout: 60, handler: nil)
//    }
}
