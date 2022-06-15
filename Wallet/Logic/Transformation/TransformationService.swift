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
        URLSession.certificatePinned.dataTask(with: request) { data, response, error in

            if let error = error?.asNetworkError() {
                completionHandler(.failure(.networkError(error, .certificateLight)))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode != 400 else {
                completionHandler(.failure(.certificateInvalid(.certificateLight)))
                return
            }

            guard response.statusCode != 429 else {
                completionHandler(.failure(.rateLimit(.certificateLight)))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR, .certificateLight)))
                return
            }

            guard let cert = try? JSONDecoder().decode(TransformationLightCertificateResponsePayload.self, from: data) else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR, .certificateLight)))
                return
            }

            completionHandler(.success(LightCertificate(certificate: cert.payload, qrCode: cert.qrCode)))
        }.resume()
    }

    static func renewCertificate(qrCode: String,
                                 completionHandler: @escaping (Result<String, TransformationError>) -> Void) {
        let payload = TransformationRequestPayload(hcert: qrCode)

        let request = Endpoint.renewCertificate(payload: payload).request()
        URLSession.certificatePinned.dataTask(with: request) { data, response, error in

            if let error = error?.asNetworkError() {
                completionHandler(.failure(.networkError(error, .certificateLight)))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode != 400 else {
                completionHandler(.failure(.certificateInvalid(.certificateLight)))
                return
            }

            guard response.statusCode != 429 else {
                completionHandler(.failure(.rateLimit(.certificateLight)))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR, .certificateLight)))
                return
            }

            guard let cert = try? JSONDecoder().decode(TransformationRenewCertificateResponsePayload.self, from: data) else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR, .certificateLight)))
                return
            }

            completionHandler(.success(cert.hcert))
        }.resume()
    }

    static func getPdf(qrCode: String,
                       completionHandler: @escaping (Result<Data, TransformationError>) -> Void) {
        let payload = TransformationRequestPayload(hcert: qrCode)

        let request = Endpoint.pdf(payload: payload).request()
        URLSession.certificatePinned.dataTask(with: request) { data, response, error in

            if let error = error?.asNetworkError() {
                completionHandler(.failure(.networkError(error, .export)))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  response.statusCode != 400 else {
                completionHandler(.failure(.certificateInvalid(.export)))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR, .export)))
                return
            }

            guard let pdfResponse = try? JSONDecoder().decode(TransformationPdfResponsePayload.self, from: data) else {
                completionHandler(.failure(.networkError(.NETWORK_PARSE_ERROR, .export)))
                return
            }

            completionHandler(.success(pdfResponse.pdf))
        }.resume()
    }
}
