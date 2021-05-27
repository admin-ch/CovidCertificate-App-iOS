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

import CovidCertificateVerifierSDK

public extension CovidCertError {
    // MARK: - Error code for UI

    var errorCode: String {
        switch self {
        case .NOT_IMPLEMENTED:
            return "ER NI"
        case .INVALID_SCHEME_PREFIX:
            return "ER ISP"
        case .BASE_45_DECODING_FAILED:
            return "ER B45"
        case .DECOMPRESSION_FAILED:
            return "ER DF"
        case .COSE_DESERIALIZATION_FAILED:
            return "ER CDF"
        case .HCERT_IS_INVALID:
            return "ER INV"
        }
    }
}
