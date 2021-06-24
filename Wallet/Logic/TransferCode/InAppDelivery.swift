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

public class InAppDelivery {
    private let session = URLSession.certificatePinned
    private var dataTask: URLSessionDataTask?
    private(set) var lastResult: Result<[DecryptedCertificate], TransferError>?

    public func registerNewCode(callback: @escaping (Result<String, TransferError>) -> Void) {
        let payload = InAppDeliveryPayload()
        let code = Luhn.generateLuhnCode()

        let privateKey: SecKey
        switch Crypto.makeAndStoreKey(name: code) {
        case let .success(pk): privateKey = pk
        case let .failure(error):
            callback(.failure(error))
            return
        }

        let publicKey: Data
        switch Crypto.getPublicKeyData(fromPrivateKeyReference: privateKey) {
        case let .success(data): publicKey = data
        case let .failure(error):
            callback(.failure(error))
            return
        }

        payload.publicKey = publicKey.base64EncodedString()

        switch getSignature(forAction: InAppDeliveryAction.Register, withCode: code) {
        case .success(let (signaturePayload, signature)):
            payload.signature = signature
            payload.signaturePayload = signaturePayload
        case let .failure(error):
            callback(.failure(error))
            return
        }

        payload.code = code

        // do some requests
        let request = Endpoint.register(payload: payload).request()
        dataTask = session.dataTask(with: request, completionHandler: { _, response, error in
            DispatchQueue.main.async {
                guard let resp = response as? HTTPURLResponse
                else {
                    callback(.failure(.REGISTER_FAILED(error)))
                    return
                }
                if resp.statusCode < 200 || resp.statusCode >= 300 {
                    callback(.failure(.REGISTER_FAILED(nil)))
                    return
                }
                callback(.success(code))
            }
        })

        dataTask?.resume()
    }

    public func tryDownloadCertificate(withCode code: String, callback: @escaping (Result<[DecryptedCertificate], TransferError>) -> Void) {
        DispatchQueue.global().async {
            let payload = InAppDeliveryPayload()

            switch self.getSignature(forAction: InAppDeliveryAction.Get, withCode: code) {
            case .success(let (signaturePayload, signature)):
                payload.signature = signature
                payload.signaturePayload = signaturePayload
            case let .failure(error):
                self.lastResult = .failure(error)
                callback(self.lastResult!)
                return
            }
            payload.code = code

            let request = Endpoint.certificate(payload: payload).request()
            self.dataTask = self.session.dataTask(with: request, completionHandler: { data, response, error in
                guard let _ = response as? HTTPURLResponse,
                      let data = data
                else {
                    self.lastResult = .failure(.GET_CERTIFICATE_FAILED(error))
                    callback(self.lastResult!)
                    return
                }

                guard let certs = try? JSONDecoder().decode(InAppDeliveryCertificateBody.self, from: data) else {
                    self.lastResult = .failure(.CANNOT_DECODE_RESPONSE)
                    callback(self.lastResult!)
                    return
                }

                var collectedCerts: [DecryptedCertificate] = []

                if certs.covidCerts.count > 0 {
                    // Load private key from keychain
                    let privateKey: SecKey
                    switch Crypto.loadKey(name: code) {
                    case let .success(key): privateKey = key
                    case let .failure(error):
                        self.lastResult = .failure(error)
                        callback(self.lastResult!)
                        return
                    }

                    // Go through received covid certs and decrypt every one
                    for cert in certs.covidCerts {
                        let hcert: Data
                        switch Crypto.decryptData(privateKey: privateKey, cipherText: cert.encryptedHcert) {
                        case let .success(hc): hcert = hc
                        case let .failure(error):
                            callback(.failure(error))
                            return
                        }
                        let pdf: Data
                        switch Crypto.decryptData(privateKey: privateKey, cipherText: cert.encryptedPdf) {
                        case let .success(pdfData): pdf = pdfData
                        case let .failure(error):
                            self.lastResult = .failure(error)
                            callback(self.lastResult!)
                            return
                        }
                        collectedCerts.append(DecryptedCertificate(hcert, pdf))
                    }
                }

                self.lastResult = .success(collectedCerts)
                callback(self.lastResult!)
            })
            self.dataTask?.resume()
        }
    }

    public func tryDeleteCertificate(withCode code: String, callback: @escaping (Result<Bool, TransferError>) -> Void) {
        DispatchQueue.global().async {
            let payload = InAppDeliveryPayload()

            switch self.getSignature(forAction: InAppDeliveryAction.Get, withCode: code) {
            case .success(let (signaturePayload, signature)):
                payload.signature = signature
                payload.signaturePayload = signaturePayload
            case let .failure(error):
                callback(.failure(error))
                return
            }
            payload.code = code

            let request = Endpoint.deleteCertificate(payload: payload).request()
            self.dataTask = self.session.dataTask(with: request, completionHandler: { data, response, error in
                DispatchQueue.main.async {
                    guard let _ = response as? HTTPURLResponse,
                          let _ = data
                    else {
                        callback(.failure(.DELETE_CERTIFICATE_FAILED(error)))
                        return
                    }
                    callback(.success(true))
                }
            })
            self.dataTask?.resume()
        }
    }

    func getSignature(forAction action: InAppDeliveryAction, withCode code: String) -> Result<(String, String), TransferError> {
        var signaturePayload = ""
        switch action {
        case .Register:
            signaturePayload = "register:\(code):\(Int(Date().timeIntervalSince1970) * 1000)"
        case .Get:
            signaturePayload = "get:\(code):\(Int(Date().timeIntervalSince1970) * 1000)"
        case .Delete:
            signaturePayload = "delete:\(code):\(Int(Date().timeIntervalSince1970) * 1000)"
        }
        guard let data = signaturePayload.data(using: .utf8) else {
            return .failure(.SIGN_ERROR(nil))
        }

        let privateKey: SecKey
        switch Crypto.loadKey(name: code) {
        case let .success(pk): privateKey = pk
        case let .failure(error): return .failure(error)
        }
        let signature: Data
        switch Crypto.signData(data, withPrivateKey: privateKey) {
        case let .success(sig): signature = sig
        case let .failure(error): return .failure(error)
        }

        return .success((signaturePayload, signature.base64EncodedString()))
    }
}

public enum InAppDeliveryAction {
    case Register
    case Get
    case Delete
}
