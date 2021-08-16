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

public enum Crypto {
    static func getPublicKeyData(fromPrivateKeyReference privateKey: SecKey) -> Result<Data, TransferError> {
        guard let publicKey = SecKeyCopyPublicKey(privateKey) else {
            return .failure(.CANNOT_GET_PUBLIC_KEY)
        }
        var error: Unmanaged<CFError>?
        guard let encoded = SecKeyCopyExternalRepresentation(publicKey, &error) else {
            guard let err = error else {
                return .failure(.CANNOT_ENCODE_PUBLIC_KEY(nil))
            }
            return .failure(.CANNOT_ENCODE_PUBLIC_KEY(err.takeRetainedValue() as Error))
        }
        return .success(encoded as Data)
    }

    static func decryptData(privateKey: SecKey, cipherText: String) -> Result<Data, TransferError> {
        let algorithm: SecKeyAlgorithm = .eciesEncryptionStandardVariableIVX963SHA256AESGCM
        var error: Unmanaged<CFError>?

        guard let data = Data(base64Encoded: cipherText),
              let clearText = SecKeyCreateDecryptedData(privateKey, algorithm, data as CFData, &error) else {
            let publicKeyPrefix: String?
            switch getPublicKeyData(fromPrivateKeyReference: privateKey) {
            case let .success(data):
                publicKeyPrefix = String(data.sha256.prefix(6).base64EncodedString())
            case .failure:
                publicKeyPrefix = nil
            }

            guard let err = error else {
                return .failure(.DECRYPTION_ERROR(nil, publicKeyPrefix))
            }
            return .failure(.DECRYPTION_ERROR(err.takeRetainedValue() as Error, publicKeyPrefix))
        }

        return .success(clearText as Data)
    }

    static func signData(_ dataToBeSigned: Data, withPrivateKey privateKey: SecKey) -> Result<Data, TransferError> {
        var error: Unmanaged<CFError>?
        guard let signature = SecKeyCreateSignature(privateKey, .ecdsaSignatureMessageX962SHA256, dataToBeSigned as CFData, &error) else {
            guard let err = error else {
                return .failure(.SIGN_ERROR(nil))
            }
            return .failure(.SIGN_ERROR(err.takeRetainedValue() as Error))
        }
        return .success(signature as Data)
    }

    static func loadKey(name: String) -> Result<SecKey, TransferError> {
        let tag = name.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: tag,
            kSecAttrKeyType as String: kSecAttrKeyTypeEC,
            kSecReturnRef as String: true,
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status == errSecSuccess else {
            return .failure(.LOAD_KEY_ERROR(status))
        }
        guard let guardedRef = item else {
            return .failure(.LOAD_KEY_ERROR(nil))
        }

        return .success(guardedRef as! SecKey)
    }

    static func makeAndStoreKey(name: String,
                                requiresBiometry: Bool = false) -> Result<SecKey, TransferError> {
        let flags: SecAccessControlCreateFlags
        if #available(iOS 11.3, *) {
            flags = requiresBiometry ?
                [.privateKeyUsage, .biometryCurrentSet] : .privateKeyUsage
        } else {
            flags = requiresBiometry ?
                [.privateKeyUsage, .touchIDCurrentSet] : .privateKeyUsage
        }
        let access =
            SecAccessControlCreateWithFlags(kCFAllocatorDefault,
                                            kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,
                                            flags,
                                            nil)!
        let tag = name.data(using: .utf8)!
        let attributes: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeEC,
            kSecAttrKeySizeInBits as String: 256,
            kSecAttrTokenID as String: kSecAttrTokenIDSecureEnclave,
            kSecPrivateKeyAttrs as String: [
                kSecAttrIsPermanent as String: true,
                kSecAttrApplicationTag as String: tag,
                kSecAttrAccessControl as String: access,
            ],
        ]

        var error: Unmanaged<CFError>?
        guard let privateKey = SecKeyCreateRandomKey(attributes as CFDictionary, &error) else {
            guard let err = error else {
                return .failure(.CREATE_KEY_ERROR(nil))
            }
            return .failure(.CREATE_KEY_ERROR(err.takeRetainedValue() as Error))
        }

        return .success(privateKey)
    }
}

extension NSError {
    func noInternetError() -> Bool {
        switch code {
        case NSURLErrorTimedOut,
             NSURLErrorCannotFindHost,
             NSURLErrorCannotConnectToHost,
             NSURLErrorNetworkConnectionLost,
             NSURLErrorDNSLookupFailed,
             NSURLErrorNotConnectedToInternet,
             NSURLErrorInternationalRoamingOff,
             NSURLErrorDataNotAllowed:
            return true
        default:
            return false
        }
    }
}
