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

enum TransformationService {
    static func getLightCertificate(qrCode: String,
                                    completionHandler: @escaping (Result<LightCertificate, TransformationError>) -> Void) {
        let payload = TransformationRequestPayload(hcert: qrCode)

        let request = Endpoint.lightCertificate(payload: payload).request()
        URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error?.asNetworkError() {
                completionHandler(.failure(.networkError(error)))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode != 400 else {
                completionHandler(.failure(.certificateInvalid))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR)))
                return
            }

            guard let cert = try? JSONDecoder().decode(TransformationLightCertificateResponsePayload.self, from: data) else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR)))
                return
            }

            completionHandler(.success(LightCertificate(certificate: cert.payload, qrCode: cert.qrcode)))
        }.resume()
    }

    static func getPdf(qrCode: String,
                       completionHandler: @escaping (Result<Data, TransformationError>) -> Void) {
        let payload = TransformationRequestPayload(hcert: qrCode)

        let request = Endpoint.pdf(payload: payload).request()
        URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error?.asNetworkError() {
                completionHandler(.failure(.networkError(error)))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode != 400 else {
                completionHandler(.failure(.certificateInvalid))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR)))
                return
            }

            guard let pdfResponse = try? JSONDecoder().decode(TransformationPdfResponsePayload.self, from: data) else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR)))
                return
            }

            completionHandler(.success(pdfResponse.pdf))
        }.resume()
    }
}
