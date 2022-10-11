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
import UIKit

extension VerificationError {
    func displayName(errorCodes: [String] = []) -> NSAttributedString {
        switch self {
        case .signature:
            let bold = UBLocalized.wallet_error_invalid_signature_bold
            return UBLocalized.wallet_error_invalid_signature.formattingOccurrenceBold(bold)
        case .revocation:
            let bold = UBLocalized.wallet_error_revocation_bold
            return UBLocalized.wallet_error_revocation.formattingOccurrenceBold(bold)
        case .otherNationalRules:
            if errorCodes.contains(NationalRulesError.NOT_FULLY_PROTECTED.errorCode) {
                return UBLocalized.wallet_error_not_fully_protected_national_rules.formattingOccurrenceBold("")
            } else {
                return UBLocalized.wallet_error_national_rules.formattingOccurrenceBold("")
            }
        case .expired:
            return UBLocalized.wallet_error_expired.formattingOccurrenceBold("")
        case .signatureExpired:
            return UBLocalized.wallet_error_qr_code_expired.formattingOccurrenceBold("")
        case let .notYetValid(date):
            let dayDate = DateFormatter.ub_dayString(from: date)
            return UBLocalized.wallet_error_valid_from.replacingOccurrences(of: "{DATE}", with: dayDate).formattingOccurrenceBold(dayDate)
        case .typeInvalid:
            let bold = UBLocalized.wallet_error_invalid_format_bold
            return UBLocalized.wallet_error_invalid_format.formattingOccurrenceBold(bold)
        case .unknown:
            return UBLocalized.unknown_error.formattingOccurrenceBold("")
        case .lightUnsupported, .unknownMode:
            return "".bold()
        }
    }

    func icon(with color: UIColor? = nil) -> UIImage? {
        switch self {
        case .signature, .typeInvalid, .unknownMode, .lightUnsupported: return UIImage(named: "ic-info-alert")?.ub_image(with: color ?? UIColor.cc_grey)
        case .revocation, .otherNationalRules, .expired:
            return UIImage(named: "ic-info-alert")?.ub_image(with: color ?? UIColor.cc_grey)
        case .signatureExpired:
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

    var showError: Bool {
        if ConfigManager.currentConfig?.showValidityState ?? false {
            return true
        }
        switch self {
        case .expired, .notYetValid:
            return false
        default:
            return true
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
