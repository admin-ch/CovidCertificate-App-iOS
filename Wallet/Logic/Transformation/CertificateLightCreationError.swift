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

enum CertificateLightCreationError: Error {
    case networkError(NetworkError)
    case certificateInvalid
}

extension CertificateLightCreationError: ErrorViewError {
    func icon(color: UIColor?) -> UIImage? {
        switch self {
        case .networkError(.NETWORK_NO_INTERNET_CONNECTION):
            var image = UIImage(named: "ic-offline")
            if let c = color {
                image = image?.ub_image(with: c)
            }

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
        case .networkError(.NETWORK_NO_INTERNET_CONNECTION):
            return UBLocalized.wallet_certificate_light_detail_activation_network_error_title
        default:
            return UBLocalized.wallet_certificate_light_detail_activation_general_error_title
        }
    }

    var errorText: String {
        switch self {
        case .networkError(.NETWORK_NO_INTERNET_CONNECTION):
            return UBLocalized.wallet_certificate_light_detail_activation_network_error_text
        default:
            return UBLocalized.wallet_certificate_light_detail_activation_general_error_text
        }
    }

    var errorCode: String {
        switch self {
        case let .networkError(error):
            return "CL|" + error.errorCode
        case .certificateInvalid:
            return "CL|CI"
        }
    }
}
