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
//  SecureStorage.swift
//
//
//  Created by Yannick Spreen on 4/25/21.
//

import Foundation

struct SecureDB: Codable {
    let data: Data
    let signature: Data
}

struct SecureStorageError: Error {
    let errorCode: String
}

public struct SecureStorage<T: Codable> {
    let documents: URL! = try? FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: true
    )
    var path: URL! { URL(string: documents.absoluteString + name) }

    let name: String

    // this is the old key which was previously used to encrypt the storage
    var oldKeyName: String { "\(name)_secureStorageKey" }
    // this is the new key, since keychain attributes have changed we had to create a new key
    var keyName: String { "\(name)_secureStorageKey_1" }

    public init(name: String) {
        self.name = name
    }

    public func loadSynchronously() -> T? {
        switch load() {
        case let .success(obj):
            return obj
        case .failure:
            return nil
        }
    }

    // returns nil if there is no error Code
    public func errorCode() -> String? {
        switch load() {
        case .success:
            return nil
        case let .failure(error):
            return error.errorCode
        }
    }

    private func load() -> Result<T?, SecureStorageError> {
        if !FileManager.default.fileExists(atPath: path.path) {
            return .success(nil)
        }

        var key: SecKey?
        var keyLoadError: String = ""

        switch Enclave.loadKey(with: keyName) {
        case let .success(secureStorageKey):
            key = secureStorageKey
        case let .failure(error):
            // don't return here since we first try to use the old key
            // but we keep the error code and append it to all following errors
            keyLoadError = "/E\(error.errorCode)"
        }

        guard let (data, signature) = read() else {
            return .success(nil)
        }

        var verifiyResult: (Bool, String?) = (false, nil)

        if let unwrappedKey = key {
            verifiyResult = Enclave.verify(data: data, signature: signature, with: unwrappedKey)
        }

        if !verifiyResult.0 {
            // if the data is not decryptable with the new key try to decrypt it with the old one
            // this fallback ensures that we always can decrypt the saved data
            // On the next save it will get encrypted with the new key

            switch Enclave.loadKey(with: oldKeyName) {
            case let .success(secureStorageKey):
                key = secureStorageKey
            case let .failure(error):
                return .failure(.init(errorCode: "EO\(error.errorCode)\(keyLoadError)"))
            }

            guard let unwrappedOldKey = key else {
                return .failure(.init(errorCode: "KMO\(keyLoadError)"))
            }

            let verifyOldResult = Enclave.verify(data: data, signature: signature, with: unwrappedOldKey)

            if !verifyOldResult.0 {
                return .failure(.init(errorCode: "SIG\(verifyOldResult.1 ?? "")/\(verifiyResult.1 ?? "")\(keyLoadError)"))
            }
        }

        guard let unwrappedKey = key else {
            return .failure(.init(errorCode: "ENK\(keyLoadError)\(keyLoadError)"))
        }

        let semaphore = DispatchSemaphore(value: 0)
        var t: T?

        Enclave.decrypt(data: data, with: unwrappedKey) { decrypted, err in
            guard
                let decrypted = decrypted,
                err == nil,
                let data = try? JSONDecoder().decode(T.self, from: decrypted)
            else {
                semaphore.signal()
                return
            }

            t = data
            semaphore.signal()
        }

        semaphore.wait()

        if t != nil {
            return .success(t)
        }
        return .failure(.init(errorCode: "DEC"))
    }

    public func saveSynchronously(_ instance: T, generateNewKey: Bool = false) -> Bool {
        let semaphore = DispatchSemaphore(value: 0)
        var outcome = false
        save(instance, generateNewKey: generateNewKey) { result in
            outcome = result
            semaphore.signal()
        }

        semaphore.wait()
        return outcome
    }

    public func save(_ instance: T, generateNewKey: Bool = false, completion: ((Bool) -> Void)? = nil) {
        if case .failure = Enclave.loadKey(with: keyName) {
            if generateNewKey || !FileManager.default.fileExists(atPath: path.path) {
                _ = Enclave.generateKey(with: keyName)
            } else {
                completion?(false)
                return
            }
        }

        guard
            let data = try? JSONEncoder().encode(instance),
            case let .success(secureStorageKey) = Enclave.loadKey(with: keyName),
            let key = secureStorageKey,
            let encrypted = Enclave.encrypt(data: data, with: key).0
        else {
            completion?(false)
            return
        }
        Enclave.sign(data: encrypted, with: key) { signature, err in
            guard
                let signature = signature,
                err == nil
            else {
                completion?(false)
                return
            }
            let success = write(data: encrypted, signature: signature)
            completion?(success)
        }
    }

    func write(data: Data, signature: Data) -> Bool {
        guard
            let rawData = try? JSONEncoder().encode(SecureDB(data: data, signature: signature)),
            (try? rawData.write(to: path)) != nil
        else {
            return false
        }
        return true
    }

    func read() -> (Data, Data)? {
        guard
            let rawData = try? Data(contentsOf: path, options: [.uncached]),
            let result = try? JSONDecoder().decode(SecureDB.self, from: rawData)
        else {
            return nil
        }
        return (result.data, result.signature)
    }
}
