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
    func displayName() -> NSAttributedString {
        switch self {
        case .signature:
            return UBLocalized.verifier_verify_error_info_for_certificate_invalid.bold()
        case .revocation:
            return UBLocalized.verifier_verify_error_info_for_blacklist.bold()
        case .otherNationalRules:
            return UBLocalized.verifier_verify_error_info_for_national_rules.bold()
        case .expired:
            return UBLocalized.verifier_verifiy_error_expired.formattingOccurrenceBold(UBLocalized.verifier_verify_error_validity_range_bold)
        case .signatureExpired:
            return UBLocalized.verifier_certificate_light_error_expired.bold()
        case .notYetValid:
            return UBLocalized.verifier_verifiy_error_notyetvalid.formattingOccurrenceBold(UBLocalized.verifier_verify_error_validity_range_bold)
        case .typeInvalid:
            return UBLocalized.verifier_error_invalid_format.bold()
        case .unknown:
            return UBLocalized.unknown_error.bold()
        }
    }
}

extension RetryError {
    func displayTitle() -> String {
        switch self {
        case .network, .unknown:
            return UBLocalized.verifier_network_error_title
        case .noInternetConnection:
            return UBLocalized.verifier_offline_error_title
        }
    }

    func displayText() -> String {
        switch self {
        case .network, .unknown:
            return UBLocalized.verifier_network_error_text
        case .noInternetConnection:
            return UBLocalized.verifier_offline_error_text
        }
    }
}
