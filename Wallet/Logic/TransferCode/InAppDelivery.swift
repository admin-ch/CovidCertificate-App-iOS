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
    static let shared = InAppDelivery()

    private let session = URLSession.certificatePinned

    private init() {}

    private var registerDataTask: URLSessionDataTask?
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
        registerDataTask = session.dataTask(with: request, completionHandler: { _, response, error in
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

        registerDataTask?.resume()
    }

    public func tryDownloadCertificate(withCode code: String) -> TransferCodeResult {
        let payload = InAppDeliveryPayload()

        switch getSignature(forAction: InAppDeliveryAction.Get, withCode: code) {
        case .success(let (signaturePayload, signature)):
            payload.signature = signature
            payload.signaturePayload = signaturePayload
        case let .failure(error):
            return .failure(error)
        }
        payload.code = code

        let request = Endpoint.certificate(payload: payload).request()

        let (optData, response, error) = session.synchronousDataTask(with: request)

        guard let _ = response as? HTTPURLResponse,
              let data = optData
        else {
            return .failure(.GET_CERTIFICATE_FAILED(error))
        }

        guard let certs = try? JSONDecoder().decode(InAppDeliveryCertificateBody.self, from: data) else {
            return .failure(.CANNOT_DECODE_RESPONSE)
        }

        var collectedCerts: [DecryptedCertificate] = []

        if certs.covidCerts.count > 0 {
            // Load private key from keychain
            let privateKey: SecKey
            switch Crypto.loadKey(name: code) {
            case let .success(key): privateKey = key
            case let .failure(error):
                return .failure(error)
            }

            // Go through received covid certs and decrypt every one
            for cert in certs.covidCerts {
                let hcert: Data
                switch Crypto.decryptData(privateKey: privateKey, cipherText: cert.encryptedHcert) {
                case let .success(hc): hcert = hc
                case let .failure(error):
                    return .failure(error)
                }
                let pdf: Data
                switch Crypto.decryptData(privateKey: privateKey, cipherText: cert.encryptedPdf) {
                case let .success(pdfData): pdf = pdfData
                case let .failure(error):
                    return .failure(error)
                }
                collectedCerts.append(DecryptedCertificate(hcert, pdf))
            }
        }

        return .success(collectedCerts)
    }

    public func tryDeleteCertificate(withCode code: String) -> Result<Bool, TransferError> {
        let payload = InAppDeliveryPayload()

        switch getSignature(forAction: InAppDeliveryAction.Get, withCode: code) {
        case .success(let (signaturePayload, signature)):
            payload.signature = signature
            payload.signaturePayload = signaturePayload
        case let .failure(error):
            return .failure(error)
        }
        payload.code = code

        let request = Endpoint.deleteCertificate(payload: payload).request()
        let (optData, response, error) = session.synchronousDataTask(with: request)

        guard let _ = response as? HTTPURLResponse,
              let _ = optData
        else {
            return .failure(.DELETE_CERTIFICATE_FAILED(error))
        }
        return .success(true)
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
