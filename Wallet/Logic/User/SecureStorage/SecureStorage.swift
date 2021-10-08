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

public struct SecureStorage<T: Codable> {
    let documents: URL! = try? FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: true
    )
    var path: URL! { URL(string: documents.absoluteString + name) }
    let oldKey: SecKey?
    let secureStorageKey: SecKey?

    let name: String

    public init(name: String) {
        self.name = name
        // this is the key which was previously used to encrypt the storage
        oldKey = Enclave.loadOrGenerateKey(with: "\(name)_secureStorageKey")
        // this is the new key, since keychain attributes have changed we had to create a new key
        secureStorageKey = Enclave.loadOrGenerateKey(with: "\(name)_secureStorageKey_1")
    }

    public func loadSynchronously() -> T? {
        if !FileManager.default.fileExists(atPath: path.path) {
            return nil
        }

        var key = secureStorageKey

        guard let (data, signature) = read() else { return nil }

        if let unwrappedKey = key,
           !Enclave.verify(data: data, signature: signature, with: unwrappedKey).0 {
            // if the data is not decryptable with the new key try to decrypt it with the old one
            // this fallback ensures that we always can decrypt the saved data
            // On the next save it will get encrypted with the new key
            key = oldKey
            guard let unwrappedOldKey = key,
                  Enclave.verify(data: data, signature: signature, with: unwrappedOldKey).0 else {
                return nil
            }
        }

        guard let unwrappedKey = key else { return nil }

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

        return t
    }

    public func saveSynchronously(_ instance: T) -> Bool {
        let semaphore = DispatchSemaphore(value: 0)
        var outcome = false
        save(instance) { result in
            outcome = result
            semaphore.signal()
        }

        semaphore.wait()
        return outcome
    }

    public func save(_ instance: T, completion: ((Bool) -> Void)? = nil) {
        guard
            let data = try? JSONEncoder().encode(instance),
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
