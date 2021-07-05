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

// simple user storage only for User Default values
class WalletUserStorage {
    static let shared = WalletUserStorage()

    @UBUserDefault(key: "wallet.user.hasCompletedOnboarding", defaultValue: false)
    var hasCompletedOnboarding: Bool {
        didSet {
            ConfigManager().startConfigRequest(window: UIApplication.shared.keyWindow?.window)
        }
    }

    @UBUserDefault(key: "wallet.user.hasCompletedSecureStorageMigration", defaultValue: false)
    var hasCompletedSecureStorageMigration: Bool

    @UBUserDefault(key: "wallet.user.hasCompletedPushRegistration", defaultValue: false)
    var hasCompletedPushRegistration: Bool
}

class CertificateStorage {
    // MARK: - Shared

    private lazy var certificates: [UserCertificate] = self.secureStorage.loadSynchronously() ?? []
    private lazy var secureStorage = SecureStorage<[UserCertificate]>(name: "wallet.user.certificates")

    static let shared = CertificateStorage()

    // MARK: - Certificates API

    var userCertificates: [UserCertificate] {
        set {
            certificates = newValue
            _ = secureStorage.saveSynchronously(certificates)
            UIStateManager.shared.stateChanged()
        }

        get {
            certificates
        }
    }

    var openTransferCodes: [String] {
        return certificates.filter { cert in
            // only not-downloaded codes
            guard cert.qrCode == nil else { return false }
            // transfer code needs to be there
            guard let tc = cert.transferCode else { return false }
            // transfer code should not be in failed state
            guard tc.state != .failed else { return false }
            // everything ok
            return true
        }.compactMap { $0.transferCode?.transferCode }
    }

    func insertCertificate(userCertificate: UserCertificate) {
        insertCertificates(certificates: [userCertificate])
    }

    func insertCertificates(certificates: [UserCertificate]) {
        // add all certificates at the front of the list
        // that are not already added
        let toBeAdded = certificates.filter { uc in !userCertificates.contains(uc) }

        if toBeAdded.count > 0 {
            userCertificates = toBeAdded + userCertificates
        }
    }

    func updateCertificate(with transferCode: String, qrCode: String?) {
        userCertificates = userCertificates.map { uc in
            if let t = uc.transferCode?.transferCode, t == transferCode {
                return UserCertificate(qrCode: qrCode, transferCode: uc.transferCode)
            }

            return uc
        }
    }

    @discardableResult
    func updateCertificate(with qrCode: String, lightCertififcate: LightCertificate?) -> UserCertificate? {
        var newModel: UserCertificate?
        userCertificates = userCertificates.map { uc in
            if let qr = uc.qrCode, qr == qrCode {
                let model = UserCertificate(qrCode: uc.qrCode, transferCode: uc.transferCode, lightCertificate: lightCertififcate)
                newModel = model
                return model
            }
            return uc
        }
        return newModel
    }

    func discardExpiredLightCertificates(completionHandler: (() -> Void)? = nil) {
        DispatchQueue.global().async {
            self.userCertificates = self.userCertificates.map { userCertificate in
                // is the certificate has no light certificate we don't touch it
                guard let lightCertificate = userCertificate.lightCertificate?.certificate else {
                    return userCertificate
                }
                var isValid = true
                // first check if we can decode the light certificate
                switch CovidCertificateSDK.Wallet.decode(encodedData: lightCertificate) {
                case let .success(holder):
                    let semaphore = DispatchSemaphore(value: 0)
                    // we only delete light certificates which signature is expired
                    CovidCertificateSDK.Wallet.check(holder: holder, forceUpdate: false) { checkResults in
                        switch checkResults.signature {
                        case .failure(.CWT_EXPIRED):
                            isValid = false
                        default:
                            isValid = true
                        }
                        semaphore.signal()
                    }
                    semaphore.wait()
                case .failure:
                    isValid = false
                }
                if isValid {
                    return userCertificate
                } else {
                    return UserCertificate(qrCode: userCertificate.qrCode, transferCode: userCertificate.transferCode, lightCertificate: nil)
                }
            }
            completionHandler?()
        }
    }

    func removeAll() {
        userCertificates = []
    }

    // MARK: - Migration

    @KeychainPersisted(key: "wallet.user.certificates", defaultValue: [])
    var keyChainUserCertificates: [UserCertificate]
}
