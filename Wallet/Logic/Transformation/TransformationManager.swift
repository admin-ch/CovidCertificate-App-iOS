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

enum TransformationManager {
    static func getLightCertificate(certificate: UserCertificate,
                                    completionHandler: @escaping (Result<UserCertificate, TransformationError>) -> Void) {
        guard let qrCode = certificate.qrCode else {
            assertionFailure()
            return
        }
        TransformationService.getLightCertificate(qrCode: qrCode) { result in
            switch result {
            case let .success(lightCertififcate):
                guard let model = CertificateStorage.shared.updateCertificate(with: qrCode, lightCertififcate: lightCertififcate) else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.certificateInvalid(.certificateLight)))
                    }
                    return
                }
                DispatchQueue.main.async {
                    completionHandler(.success(model))
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }

    static func renewCertificate(certificate: UserCertificate,
                                 completionHandler: @escaping (Result<UserCertificate, TransformationError>) -> Void) {
        guard let qrCode = certificate.qrCode else {
            assertionFailure()
            return
        }
        TransformationService.renewCertificate(qrCode: qrCode) { result in
            switch result {
            case let .success(newQrCode):

                guard let model = CertificateStorage.shared.renewCertificate(oldQrCode: qrCode, newQrCode: newQrCode) else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.certificateInvalid(.renew)))
                    }
                    return
                }
                DispatchQueue.main.async {
                    completionHandler(.success(model))
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }

    static func getPDF(certificate: UserCertificate,
                       completionHandler: @escaping (Result<UserCertificate, TransformationError>) -> Void) {
        guard let qrCode = certificate.qrCode else {
            assertionFailure()
            return
        }
        guard certificate.pdf == nil else {
            if Thread.isMainThread {
                completionHandler(.success(certificate))
            } else {
                DispatchQueue.main.async {
                    completionHandler(.success(certificate))
                }
            }
            return
        }
        TransformationService.getPdf(qrCode: qrCode) { result in
            switch result {
            case let .success(pdf):
                guard let model = CertificateStorage.shared.updateCertificate(with: qrCode, pdf: pdf) else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.certificateInvalid(.export)))
                    }
                    return
                }
                DispatchQueue.main.async {
                    completionHandler(.success(model))
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }
}
