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

class UIStateManagerTests: XCTestCase {
    func testObserverCalledInitially() throws {
        let uistateManager = UIStateManager()
        let ex = expectation(description: "observer called")
        ex.assertForOverFulfill = false
        var observerCalls = 0
        uistateManager.addObserver(self, block: { _ in
            observerCalls += 1
            ex.fulfill()
        })
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(observerCalls, 1)
    }

    func testObserverMultithreaded() throws {
        let uistateManager = UIStateManager()
        let ex = expectation(description: "observer called")
        var observerCalls = 100
        uistateManager.addObserver(self, block: { _ in
            observerCalls -= 1
            if observerCalls == -1 {
                ex.fulfill()
            }
        })
        DispatchQueue.concurrentPerform(iterations: observerCalls) { _ in
            uistateManager.stateChanged(forceRefresh: true)
        }
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(observerCalls, -1) // -1 because one call is triggered on addObserver
    }
}
