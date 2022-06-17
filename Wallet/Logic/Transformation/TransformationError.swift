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

enum TransformationError: Error {
    enum Mode {
        case export, certificateLight, renew
        var errorPrefix: String {
            switch self {
            case .export:
                return "EX"
            case .certificateLight:
                return "CI"
            case .renew:
                return "RN"
            }
        }
    }

    case networkError(NetworkError, Mode)
    case certificateInvalid(Mode)
    case rateLimit(Mode)
}

extension TransformationError: ErrorViewError {
    func icon(color: UIColor?) -> UIImage? {
        switch self {
        case .networkError(.NETWORK_NO_INTERNET_CONNECTION, _):
            var image = UIImage(named: "ic-offline")
            image = image?.ub_image(with: color ?? .cc_orange)
            return image
        case .rateLimit:
            var image = UIImage(named: "ic-info-alert")
            image = image?.ub_image(with: color ?? .cc_orange)
            return image
        default:
            var image = UIImage(named: "ic-error")
            if let c = color {
                image = image?.ub_image(with: c)
            }

            return image
        }
    }

    var errorTitle: String {
        switch self {
        case let .networkError(.NETWORK_NO_INTERNET_CONNECTION, mode):
            switch mode {
            case .certificateLight, .renew:
                return UBLocalized.wallet_certificate_light_detail_activation_network_error_title
            case .export:
                return UBLocalized.wallet_certificate_export_detail_network_error_title
            }
        case let .rateLimit(mode):
            switch mode {
            case .renew:
                return UBLocalized.wallet_certificate_renewal_rate_limit_error_title
            default:
                return UBLocalized.wallet_certificate_light_rate_limit_title
            }
        default:
            return UBLocalized.wallet_certificate_light_detail_activation_general_error_title
        }
    }

    var errorText: String {
        switch self {
        case let .networkError(.NETWORK_NO_INTERNET_CONNECTION, mode):
            switch mode {
            case .certificateLight, .renew:
                return UBLocalized.wallet_certificate_light_detail_activation_network_error_text
            case .export:
                return UBLocalized.wallet_certificate_export_detail_network_error_text
            }
        case let .rateLimit(mode):
            switch mode {
            case .renew:
                return UBLocalized.wallet_certificate_renewal_rate_limit_error_text
            default:
                return UBLocalized.wallet_certificate_light_rate_limit_text
            }
        default:
            return UBLocalized.wallet_certificate_light_detail_activation_general_error_text
        }
    }

    var errorCode: String {
        switch self {
        case let .networkError(error, mode):
            return mode.errorPrefix + "|" + error.errorCode
        case let .certificateInvalid(mode):
            return mode.errorPrefix + "|" + "CI"
        case let .rateLimit(mode):
            return mode.errorPrefix + "|" + "RL"
        }
    }
}
