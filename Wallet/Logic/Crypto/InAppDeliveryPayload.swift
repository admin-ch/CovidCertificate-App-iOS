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

public class InAppDeliveryPayload: Codable {
    var algorithm: String?
    var publicKey: String?
    var signature: String?
    var signaturePayload: String?
    var code: String?

    public init() {
        algorithm = "EC256"
    }

    static func getRegisterPayload() -> InAppDeliveryPayload? {
        let payload = InAppDeliveryPayload()
        let code = Luhn.generateLuhnCode()
        guard case let .success(privateKey) = Crypto.makeAndStoreKey(name: code),
              case let .success(publicKey) = Crypto.getPublicKeyData(fromPrivateKeyReference: privateKey) else {
            return nil
        }

        guard let (signaturePayload, signature) = getSignature(forAction: .Register, withCode: code) else {
            return nil
        }

        payload.signature = signature
        payload.signaturePayload = signaturePayload
        payload.code = code
        payload.publicKey = publicKey.base64EncodedString()

        return payload
    }

    public static func getPayload(forAction action: InAppDeliveryAction, withCode code: String) -> InAppDeliveryPayload? {
        if case .Register = action {
            return getRegisterPayload()
        }

        let payload = InAppDeliveryPayload()

        guard let (signaturePayload, signature) = getSignature(forAction: action, withCode: code) else {
            return nil
        }

        payload.signature = signature
        payload.signaturePayload = signaturePayload
        payload.code = code

        return payload
    }

    static func getSignature(forAction action: InAppDeliveryAction, withCode code: String) -> (String, String)? {
        var signaturePayload = ""
        switch action {
        case .Register:
            signaturePayload = "register:\(code):\(Int(Date().timeIntervalSince1970) * 1000)"
        case .Get:
            signaturePayload = "get:\(code):\(Int(Date().timeIntervalSince1970) * 1000)"
        case .Delete:
            signaturePayload = "delete:\(code):\(Int(Date().timeIntervalSince1970) * 1000)"
        }
        guard let data = signaturePayload.data(using: .utf8),
              case let .success(privateKey) = Crypto.loadKey(name: code),
              case let .success(signature) = Crypto.signData(data, withPrivateKey: privateKey) else { return nil }
        return (signaturePayload, signature.base64EncodedString())
    }
}

public enum InAppDeliveryAction {
    case Register
    case Get
    case Delete
}
