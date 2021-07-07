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

#if WALLET
    typealias HolderModel = CertificateHolder
    typealias SDKNamespace = CovidCertificateSDK.Wallet
#elseif VERIFIER
    typealias HolderModel = VerifierCertificateHolder
    typealias SDKNamespace = CovidCertificateSDK.Verifier
#endif

enum VerificationError: Equatable, Comparable {
    case signature
    case typeInvalid
    case revocation
    case expired(Date)
    case signatureExpired
    case notYetValid(Date)
    case otherNationalRules
    case unknown
}

enum RetryError: Equatable {
    case network
    case noInternetConnection
    case unknown
}

enum VerificationState: Equatable {
    case loading
    // verification was skipped
    case skipped
    // validity as formatted date as String
    case success(String?)
    // sorted errors, error codes, validity as formatted date as String
    case invalid([VerificationError], [String], String?)
    // retry error, error codes
    case retry(RetryError, [String])

    public func isInvalid() -> Bool {
        switch self {
        case .invalid:
            return true
        default:
            return false
        }
    }

    public func isSuccess() -> Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }

    public func isRetry() -> Bool {
        switch self {
        case .retry:
            return true
        default:
            return false
        }
    }

    public func verificationErrors() -> [VerificationError]? {
        switch self {
        case let .invalid(errors, _, _):
            return errors
        default:
            return nil
        }
    }

    public func validUntilDateString() -> String? {
        switch self {
        case let .invalid(_, _, date):
            return date
        default:
            return nil
        }
    }

    public func errorCodes() -> [String] {
        switch self {
        case let .invalid(_, codes, _):
            return codes
        default:
            return []
        }
    }

    // get errors: (signature, revocation, nationalRuleError)
    // always show up to first error ->
    // (nil, error, error) --> show signature ok, show revocation error
    // (nil, nil, error) --> show signature ok, revocation ok, show national error
    public func getVerifierErrorState() -> (VerificationError?, VerificationError?, VerificationError?)? {
        switch self {
        case let .invalid(errors, _, _):
            let signatureError = errors.filter { $0 == .signature || $0 == .typeInvalid }.first
            let revocationError = errors.filter { $0 != .signature && $0 != .typeInvalid && $0 == .revocation }.first
            let nationalError = errors.filter { $0 != .signature && $0 != .typeInvalid && $0 != .revocation }.first

            return (signatureError, revocationError, nationalError)
        default:
            return nil
        }
    }
}

class Verifier: NSObject {
    private let holder: HolderModel?
    private var stateUpdate: ((VerificationState) -> Void)?

    // MARK: - Init

    init(holder: HolderModel) {
        self.holder = holder
        super.init()
    }

    init(qrString: String) {
        let result = SDKNamespace.decode(encodedData: qrString)

        switch result {
        case let .success(holder):
            self.holder = holder
        case .failure:
            holder = nil
        }

        super.init()
    }

    // MARK: - Start

    public func start(forceUpdate: Bool = false, stateUpdate: @escaping ((VerificationState) -> Void)) {
        self.stateUpdate = stateUpdate

        guard let holder = holder else {
            // should never happen
            self.stateUpdate?(.invalid([.unknown], ["V|HN"], nil))
            return
        }

        DispatchQueue.main.async {
            self.stateUpdate?(.loading)
        }

        SDKNamespace.check(holder: holder, forceUpdate: forceUpdate) { [weak self] results in
            guard let self = self else { return }
            let checkSignatureState = self.handleSignatureResult(results.signature)
            let checkRevocationState = self.handleRevocationResult(results.revocationStatus)
            let checkNationalRulesState = self.handleNationalRulesResult(results.nationalRules)

            let states = [checkSignatureState, checkRevocationState, checkNationalRulesState]

            var errors = states.compactMap { $0.verificationErrors() }.flatMap { $0 }
            errors.sort()

            var errorCodes = states.compactMap { $0.errorCodes() }.flatMap { $0 }
            errorCodes.sort()

            let retries = states.filter { $0.isRetry() }

            if errors.count > 0 {
                let validityString = checkNationalRulesState.validUntilDateString()
                self.stateUpdate?(.invalid(errors, errorCodes, validityString))
            } else if let r = retries.first {
                self.stateUpdate?(r)
            } else if states.allSatisfy({ $0.isSuccess() }) {
                self.stateUpdate?(checkNationalRulesState)
            }
        }
    }

    public func restart(forceUpdate: Bool = false) {
        guard let su = stateUpdate else { return }
        start(forceUpdate: forceUpdate, stateUpdate: su)
    }

    // MARK: - Signature

    private func handleSignatureResult(_ result: Result<ValidationResult, ValidationError>) -> VerificationState {
        switch result {
        case let .success(result):
            if result.isValid {
                return .success(nil)
            } else {
                // !: checked
                let errorCodes = result.error != nil ? [result.error!.errorCode] : []
                return .invalid([.signature], errorCodes, nil)
            }

        case let .failure(err):
            switch err {
            case .NETWORK_NO_INTERNET_CONNECTION:
                // retry possible
                return .retry(.noInternetConnection, [err.errorCode])
            case .NETWORK_PARSE_ERROR, .NETWORK_ERROR:
                return .retry(.network, [err.errorCode])
            case .SIGNATURE_TYPE_INVALID:
                return .invalid([.typeInvalid], [err.errorCode], nil)
            case .CWT_EXPIRED:
                return .invalid([.signatureExpired], [err.errorCode], nil)
            default:
                // error
                return .invalid([.signature], [err.errorCode], nil)
            }
        }
    }

    private func handleRevocationResult(_ result: Result<ValidationResult, ValidationError>?) -> VerificationState {
        guard let result = result else { return .skipped }
        switch result {
        case let .success(result):
            if result.isValid {
                return .success(nil)
            } else {
                // !: checked
                let errorCodes = result.error != nil ? [result.error!.errorCode] : []
                return .invalid([.revocation], errorCodes, nil)
            }

        case let .failure(err):
            switch err {
            case .NETWORK_NO_INTERNET_CONNECTION:
                // retry possible
                return .retry(.noInternetConnection, [err.errorCode])
            case .NETWORK_PARSE_ERROR, .NETWORK_ERROR:
                return .retry(.network, [err.errorCode])
            default:
                return .invalid([.revocation], [err.errorCode], nil)
            }
        }
    }

    private func handleNationalRulesResult(_ result: Result<VerificationResult, NationalRulesError>) -> VerificationState {
        guard let holder = holder else {
            assertionFailure()
            return .invalid([.unknown], ["V|HN"], nil)
        }
        switch result {
        case let .success(result):
            var validUntil: String?

            // get expired date string
            if let date = result.validUntil {
                #if WALLET
                    switch (holder.certificate as? DCCCert)?.immunisationType {
                    case .test:
                        validUntil = DateFormatter.ub_dayTimeString(from: date)
                    case .recovery:
                        validUntil = DateFormatter.ub_dayString(from: date)
                    case .vaccination:
                        validUntil = DateFormatter.ub_dayString(from: date)
                    case .none:
                        break
                    }
                #endif
            }

            // check for validity
            if result.isValid {
                return .success(validUntil)
            } else if let dateError = result.dateError {
                switch dateError {
                case .NOT_YET_VALID:
                    return .invalid([.notYetValid(result.validFrom ?? Date())], [], validUntil)
                case .EXPIRED:
                    return .invalid([.expired(result.validUntil ?? Date())], [], validUntil)
                case .NO_VALID_DATE:
                    return .invalid([.typeInvalid], [], validUntil)
                }
            } else {
                return .invalid([.otherNationalRules], [], validUntil)
            }
        case let .failure(err):
            switch err {
            case .NETWORK_NO_INTERNET_CONNECTION:
                // retry possible
                return .retry(.noInternetConnection, [err.errorCode])
            case .NETWORK_PARSE_ERROR, .NETWORK_ERROR:
                // retry possible
                return .retry(.network, [err.errorCode])
            default:
                // do not show the explicit error code on the verifier app, s.t.
                // no information is shown about the checked user (e.g. certificate type)
                #if WALLET
                    return .invalid([.otherNationalRules], [err.errorCode], nil)
                #elseif VERIFIER
                    return .invalid([.otherNationalRules], [], nil)
                #endif
            }
        }
    }
}
