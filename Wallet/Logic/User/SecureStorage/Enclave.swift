//
/* -
 * ---license-start
 * eu-digital-green-certificates / dgca-app-core-ios
 * ---
 * Copyright (C) 2021 T-Systems International GmbH and all other contributors
 * ---
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ---license-end
 */
//
//  Enclave.swift
//
//
//  Created by Yannick Spreen on 4/25/21.
//

import Foundation

public enum Enclave {
    static let encryptAlg = SecKeyAlgorithm.eciesEncryptionCofactorVariableIVX963SHA256AESGCM
    static let signAlg = SecKeyAlgorithm.ecdsaSignatureMessageX962SHA512

    static func tag(for name: String) -> Data {
        "\(Bundle.main.bundleIdentifier ?? "app").\(name)".data(using: .utf8)!
    }

    static func generateKey(with name: String? = nil) -> (SecKey?, String?) {
        let name = name ?? UUID().uuidString
        let tag = Enclave.tag(for: name)
        var error: Unmanaged<CFError>?
        guard
            let access =
            SecAccessControlCreateWithFlags(
                kCFAllocatorDefault,
                kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
                [.privateKeyUsage],
                &error
            )
        else {
            return (nil, error?.takeRetainedValue().localizedDescription)
        }
        var attributes: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeEC,
            kSecAttrKeySizeInBits as String: 256,
            kSecPrivateKeyAttrs as String: [
                kSecAttrIsPermanent as String: true,
                kSecAttrApplicationTag as String: tag,
                kSecAttrAccessControl as String: access,
            ],
        ]
        #if !targetEnvironment(simulator)
            attributes[kSecAttrTokenID as String] = kSecAttrTokenIDSecureEnclave
        #endif
        guard
            let privateKey = SecKeyCreateRandomKey(
                attributes as CFDictionary,
                &error
            )
        else {
            return (nil, error?.takeRetainedValue().localizedDescription)
        }
        return (privateKey, nil)
    }

    static func loadKey(with name: String) -> SecKey? {
        let tag = Enclave.tag(for: name)
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrKeyType as String: kSecAttrKeyTypeEC,
            kSecAttrApplicationTag as String: tag,
            kSecReturnRef as String: true,
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard
            status == errSecSuccess,
            case let result as SecKey? = item
        else {
            return nil
        }
        return result
    }

    static func loadOrGenerateKey(with name: String) -> SecKey? {
        if let key = loadKey(with: name) {
            return key
        }
        return generateKey(with: name).0
    }

    static func encrypt(data: Data, with key: SecKey) -> (Data?, String?) {
        guard let publicKey = SecKeyCopyPublicKey(key) else {
            return (nil, "err.pub-key-irretrievable")
        }
        guard SecKeyIsAlgorithmSupported(publicKey, .encrypt, encryptAlg) else {
            return (nil, "err.alg-not-supported")
        }
        var error: Unmanaged<CFError>?
        let cipherData = SecKeyCreateEncryptedData(
            publicKey,
            encryptAlg,
            data as CFData,
            &error
        ) as Data?
        let err = error?.takeRetainedValue().localizedDescription
        return (cipherData, err)
    }

    static func decrypt(data: Data, with key: SecKey, completion: @escaping (Data?, String?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let (result, error) = syncDecrypt(data: data, with: key)
            completion(result, error)
        }
    }

    static func syncDecrypt(data: Data, with key: SecKey) -> (Data?, String?) {
        guard SecKeyIsAlgorithmSupported(key, .decrypt, encryptAlg) else {
            return (nil, "err.alg-not-supported")
        }
        var error: Unmanaged<CFError>?
        let clearData = SecKeyCreateDecryptedData(
            key,
            encryptAlg,
            data as CFData,
            &error
        ) as Data?
        let err = error?.takeRetainedValue().localizedDescription
        return (clearData, err)
    }

    static func verify(data: Data, signature: Data, with key: SecKey) -> (Bool, String?) {
        guard let publicKey = SecKeyCopyPublicKey(key) else {
            return (false, "err.pub-key-irretrievable")
        }
        guard SecKeyIsAlgorithmSupported(publicKey, .verify, signAlg) else {
            return (false, "err.alg-not-supported")
        }
        var error: Unmanaged<CFError>?
        let isValid = SecKeyVerifySignature(
            publicKey,
            signAlg,
            data as CFData,
            signature as CFData,
            &error
        )
        let err = error?.takeRetainedValue().localizedDescription
        return (isValid, err)
    }

    public static func sign(
        data: Data,
        with key: SecKey,
        using algorithm: SecKeyAlgorithm? = nil,
        completion: @escaping (Data?, String?) -> Void
    ) {
        DispatchQueue.global(qos: .userInitiated).async {
            let (result, error) = syncSign(data: data, with: key, using: algorithm)
            completion(result, error)
        }
    }

    static func syncSign(
        data: Data,
        with key: SecKey,
        using algorithm: SecKeyAlgorithm? = nil
    ) -> (Data?, String?) {
        let algorithm = algorithm ?? signAlg
        guard SecKeyIsAlgorithmSupported(key, .sign, algorithm) else {
            return (nil, "err.alg-not-supported")
        }
        var error: Unmanaged<CFError>?
        let signature = SecKeyCreateSignature(
            key,
            algorithm,
            data as CFData,
            &error
        ) as Data?
        let err = error?.takeRetainedValue().localizedDescription
        return (signature, err)
    }
}
