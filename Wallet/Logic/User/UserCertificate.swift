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

enum CertificateType {
    case certificate
    case lightCertificate
    case transferCode
}

struct LightCertificate: Codable, Equatable {
    let certificate: String
    let qrCode: Data
}

struct UserCertificate: Codable, Equatable {
    var qrCode: String?
    let transferCode: UserTransferCode?
    var lightCertificate: LightCertificate?
    var pdf: Data?

    var type: CertificateType {
        if lightCertificate != nil {
            return .lightCertificate
        }
        if qrCode == nil {
            return .transferCode
        }

        return .certificate
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        // a certificate is considerd equal if they have the same qrCode
        if lhs.qrCode != nil,
           rhs.qrCode != nil,
           lhs.qrCode == rhs.qrCode {
            return true
        }
        // the lightcertificate isn't compared because it is derived by the qrCode
        return false
    }
}

extension LightCertificate {
    var qrCodeImage: UIImage? {
        return UIImage(data: qrCode)
    }
}
