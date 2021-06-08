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

extension VerificationError {
    func displayName() -> String {
        switch self {
        case .signature:
            return UBLocalized.verifier_verify_error_info_for_certificate_invalid
        case .revocation:
            return UBLocalized.verifier_verify_error_info_for_blacklist
        case .otherNationalRules:
            return UBLocalized.verifier_verify_error_info_for_national_rules
        case .expired:
            return UBLocalized.verifier_verifiy_error_expired
        case .notYetValid:
            return UBLocalized.verifier_verifiy_error_notyetvalid
        case .typeInvalid:
            return UBLocalized.verifier_error_invalid_format
        case .unknown:
            return UBLocalized.unknown_error
        }
    }
}

extension RetryError {
    func displayName() -> String {
        switch self {
        case .network:
            return UBLocalized.verifier_retry_network_error
        case .flightMode:
            return UBLocalized.verifier_retry_flightmode_error
        case .unknown:
            return UBLocalized.unknown_error
        }
    }
}
