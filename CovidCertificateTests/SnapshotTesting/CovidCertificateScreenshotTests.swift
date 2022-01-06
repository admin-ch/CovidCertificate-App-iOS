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
import SnapshotTesting
import XCTest

class CovidCertificateScreenshotTests: XCTestCase {
    func testValidVaccination() {
        
        let cert = UserCertificate(qrCode: """
        HC1:NCFOXN%TSMAHN-H3ZSUZK+.V0ET9%6-AH-R61ROR$SIOO$-I1TMUXIDJ5*1HAZAF/8X*G3M9JUPY0BZW4Z*AK.GNNVR*G0C7PHBO33BC786B*E3-433QBV53XEBW77WNN+FNULJ96B4UN*97$IJV7776B*D3LL7SZ4ZI00T9UKPSH9WC5PF6846A$QX76NZ64998T5UEIY0Q$UPR$5:NLOEPNRAE69K P4NPDDAJP5DMH1$4R/S09T./0LWTKD3323UJ0BGJB/S7-SN2H N37J3JFTULJ5CB8X2+36D-I/2DBAJDAJCNB-43 X4VV2 73-E3GG3V20-7TZD5CC9T0H$/IC74:ZH:PI/E2$4JY/K9/INE0J0A.G9/G9F:QQ28R3U6/V.*NT*QI%KZYNNEVQ KB+P8$J3-SY$NKLACIQ 52564L64W5A 4F4DR+7C218UBRM.SY$N-P1S29 34S0B8DRFRMLNKNM8LK4NTOR7H4KJ1SU 0IR+Q-VJNZENQC9IU3ALX6SDMJEZ8-25.AT%2D1C6A6EJ/EZ6SDC48DC%:5VON5VHB+M9MQ*IEM:J-*1I+RJU6O.VNWJO407CIH3
        """, transferCode: nil, lightCertificate: nil, pdf: nil)
        let vc = CertificateDetailViewController(certificate: cert)
        // trigger view load
        _ = vc.view
        // wait for certificate to be verified
        let ex = expectation(description: "check_delay")
        ex.assertForOverFulfill = false
        VerifierManager.shared.addObserver(self, for: cert.qrCode!, modes: Verifier.currentModes(), forceUpdate: true) { s in
            if s != .loading {
                ex.fulfill()
            }
        }
        waitForExpectations(timeout: 5.0, handler: nil)

        assertSnapshot(matching: vc, as: .image(size: .init(width: 375, height: 2500)))
    }
}
