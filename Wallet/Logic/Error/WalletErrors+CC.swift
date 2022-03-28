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

import CovidCertificateSDK
import Foundation

extension VerificationError {
    func displayName() -> NSAttributedString {
        switch self {
        case .signature:
            let bold = UBLocalized.wallet_error_invalid_signature_bold
            return UBLocalized.wallet_error_invalid_signature.formattingOccurrenceBold(bold)
        case .revocation:
            let bold = UBLocalized.wallet_error_revocation_bold
            return UBLocalized.wallet_error_revocation.formattingOccurrenceBold(bold)
        case .otherNationalRules:
            return UBLocalized.wallet_error_national_rules.formattingOccurrenceBold("")
        case .expired:
            let bold = UBLocalized.wallet_error_expired_bold
            return UBLocalized.wallet_error_expired.formattingOccurrenceBold(bold)
        case .signatureExpired:
            return UBLocalized.verifier_certificate_light_error_expired.bold()
        case let .notYetValid(date):
            let dayDate = DateFormatter.ub_dayString(from: date)
            return UBLocalized.wallet_error_valid_from.replacingOccurrences(of: "{DATE}", with: dayDate).formattingOccurrenceBold(dayDate)
        case .typeInvalid:
            let bold = UBLocalized.wallet_error_invalid_format_bold
            return UBLocalized.wallet_error_invalid_format.formattingOccurrenceBold(bold)
        case .countryNotSupported:
            let bold = UBLocalized.wallet_error_country_not_supported_bold
            return UBLocalized.wallet_error_country_not_supported.formattingOccurrenceBold(bold)
        case .noValidRule:
            let bold = UBLocalized.wallet_error_no_valid_rule_bold
            return UBLocalized.wallet_error_no_valid_rule.formattingOccurrenceBold(bold)
        case .unknown:
            return UBLocalized.unknown_error.formattingOccurrenceBold("")
        case .lightUnsupported, .unknownMode:
            return "".bold()
        }
    }

    func icon(with color: UIColor? = nil) -> UIImage? {
        switch self {
        case .signature, .typeInvalid, .unknownMode, .lightUnsupported: return UIImage(named: "ic-info-alert")?.ub_image(with: color ?? UIColor.cc_grey)
        case .revocation: return UIImage(named: "ic-info-alert")?.ub_image(with: color ?? UIColor.cc_grey)
        case .otherNationalRules, .noValidRule, .countryNotSupported: return UIImage(named: "ic-info-alert")?.ub_image(with: color ?? UIColor.cc_grey)
        case .expired, .signatureExpired:
            if let c = color {
                return UIImage(named: "ic-invalid")?.ub_image(with: c)
            } else {
                return UIImage(named: "ic-invalid")
            }
        case .notYetValid:
            if let c = color {
                return UIImage(named: "ic-timelapse")?.ub_image(with: c)
            } else {
                return UIImage(named: "ic-timelapse")
            }
        case .unknown:
            if let c = color {
                return UIImage(named: "ic-invalid")?.ub_image(with: c)
            } else {
                return UIImage(named: "ic-invalid")
            }
        }
    }
}

extension RetryError {
    func displayTitle(isReload: Bool, isHomescreen: Bool) -> NSAttributedString {
        switch self {
        case .noInternetConnection:
            return isReload ? UBLocalized.wallet_detail_offline_retry_title.bold() : UBLocalized.wallet_homescreen_offline.bold()
        case .timeShift:
            return isReload ? UBLocalized.wallet_time_inconsistency_error_title.bold() : UBLocalized.wallet_homescreen_network_error.formattingOccurrenceBold("")
        case .network, .unknown:
            return isHomescreen ? UBLocalized.wallet_homescreen_network_error.formattingOccurrenceBold("") : UBLocalized.wallet_detail_network_error_title.formattingOccurrenceBold("")
        }
    }

    func displayText(isReload: Bool) -> String {
        if case .timeShift = self {
            return UBLocalized.wallet_time_inconsistency_error_text
        }

        return isReload ? UBLocalized.wallet_detail_network_error_text : UBLocalized.wallet_offline_description
    }

    func icon(with color: UIColor? = nil) -> UIImage? {
        var image: UIImage?
        switch self {
        case .noInternetConnection:
            image = UIImage(named: "ic-offline")
        case .timeShift:
            image = UIImage(named: "ic-timeerror")
        case .network, .unknown:
            image = UIImage(named: "ic-error")
        }

        if let c = color {
            image = image?.ub_image(with: c)
        }

        return image
    }
}
