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
    case otherNationalRules(String)
    case lightUnsupported(String)
    case unknownMode
    case unknown
}

enum RetryError: Equatable {
    case network
    case noInternetConnection
    case timeShift
    case unknown
}

enum VerificationState: Equatable {
    case loading
    // verification was skipped
    case skipped
    // validity as formatted date as String, whether the certificate is valid for switzerland only, mode results, eolBannerIdentifier
    case success(validityDate: String?, switzerlandOnly: Bool?, modeResults: ModeResults?, eolBannerIdentifier: String?)
    // sorted errors, error codes, validity as formatted date as String
    case invalid(errors: [VerificationError], errorCodes: [String], validity: String?, wasRevocationSkipped: Bool, switzerlandOnly: Bool?)
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
        case .success, .skipped:
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
        case let .invalid(errors, _, _, _, _):
            return errors
        default:
            return nil
        }
    }

    public func validUntilDateString() -> String? {
        switch self {
        case let .invalid(_, _, date, _, _):
            return date
        default:
            return nil
        }
    }

    public func errorCodes() -> [String] {
        switch self {
        case let .invalid(_, codes, _, _, _):
            return codes
        default:
            return []
        }
    }

    public func isSignatureOrRevocationError() -> Bool {
        guard let (signatureErr, revocationErr, _) = getVerifierErrorState() else { return false }

        return signatureErr != nil || revocationErr != nil
    }

    public var wasRevocationSkipped: Bool {
        switch self {
        case let .invalid(_, _, _, wasRevocationSkipped, _):
            return wasRevocationSkipped
        default:
            return false
        }
    }

    public var wasModeUnknown: Bool {
        return (verificationErrors()?.contains(where: { error in
            switch error {
            case .unknownMode:
                return true
            default:
                return false
            }
        })) ?? false
    }

    // get errors: (signature, revocation, nationalRuleError)
    // always show up to first error ->
    // (nil, error, error) --> show signature ok, show revocation error
    // (nil, nil, error) --> show signature ok, revocation ok, show national error
    public func getVerifierErrorState() -> (VerificationError?, VerificationError?, VerificationError?)? {
        switch self {
        case let .invalid(errors, _, _, _, _):
            let signatureError = errors.filter { $0 == .signature || $0 == .typeInvalid || $0 == .signatureExpired }.first
            let revocationError = errors.filter { $0 != .signature && $0 != .typeInvalid && $0 != .signatureExpired && $0 == .revocation }.first
            let nationalError = errors.filter { $0 != .signature && $0 != .typeInvalid && $0 != .signatureExpired && $0 != .revocation }.first

            return (signatureError, revocationError, nationalError)
        default:
            return nil
        }
    }

    public func getFirstError() -> VerificationError? {
        switch self {
        case let .invalid(errors, _, _, _, _):
            let (signatureError, revocationError, nationalError) = getVerifierErrorState() ?? (nil, nil, nil)
            return signatureError ?? revocationError ?? nationalError ?? errors.first
        default:
            return nil
        }
    }
}

class Verifier: NSObject {
    private let holder: HolderModel?
    private var stateUpdate: ((VerificationState) -> Void)?
    private var modes: [CheckMode]?

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

    // MARK: - Modes

    public static func currentModes() -> [CheckMode] {
        #if WALLET
            return CovidCertificateSDK.Wallet.activeModes
        #elseif VERIFIER
            return CovidCertificateSDK.Verifier.activeModes
        #endif
    }

    // MARK: - Start

    public func start(modes: [CheckMode], forceUpdate: Bool = false, countryCode: String = CountryCodes.Switzerland, checkDate: Date = Date(), stateUpdate: @escaping ((VerificationState) -> Void)) {
        self.stateUpdate = stateUpdate
        self.modes = modes

        guard let holder = holder else {
            // should never happen
            self.stateUpdate?(.invalid(errors: [.unknown], errorCodes: ["V|HN"], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil))
            return
        }

        DispatchQueue.main.async {
            self.stateUpdate?(.loading)
        }

        #if WALLET
            SDKNamespace.check(holder: holder, forceUpdate: forceUpdate, modes: modes, countryCode: countryCode, checkDate: checkDate) { [weak self] results in
                guard let strongSelf = self else { return }
                strongSelf.updateState(with: results)
            }

        #elseif VERIFIER
            SDKNamespace.check(holder: holder, forceUpdate: forceUpdate, mode: modes.first) { [weak self] results in
                guard let strongSelf = self else { return }
                let modeResults = strongSelf.handleModeResult(results.modeResults, mode: modes.first)
                strongSelf.updateState(with: results, modeResults: modeResults)
            }
        #endif
    }

    private func updateState(with results: CheckResults, modeResults: VerificationState? = nil) {
        let checkSignatureState = handleSignatureResult(results.signature)
        let checkRevocationState = handleRevocationResult(results.revocationStatus)
        let checkNationalRulesState = handleNationalRulesResult(results.nationalRules, modeResults: results.modeResults)

        var states = [checkSignatureState, checkRevocationState, checkNationalRulesState]
        if let mr = modeResults {
            states.append(mr)
        }

        var errors = states.compactMap { $0.verificationErrors() }.flatMap { $0 }
        errors.sort()

        var errorCodes = states.compactMap { $0.errorCodes() }.flatMap { $0 }
        errorCodes.sort()

        var isSwitzerlandOnly: Bool?
        switch checkNationalRulesState {
        case let .success(_, switzerlandOnly, _, _):
            isSwitzerlandOnly = switzerlandOnly
        case let .invalid(_, _, _, _, switzerlandOnly):
            isSwitzerlandOnly = switzerlandOnly
        default:
            break
        }

        let retries = states.filter { $0.isRetry() }

        if errors.count > 0 {
            let validityString = checkNationalRulesState.validUntilDateString()
            stateUpdate?(.invalid(errors: errors, errorCodes: errorCodes, validity: validityString, wasRevocationSkipped: results.revocationStatus == nil, switzerlandOnly: isSwitzerlandOnly))
        } else if let r = retries.first {
            stateUpdate?(r)
        } else if states.allSatisfy({ $0.isSuccess() }) {
            stateUpdate?(checkNationalRulesState)
        }
    }

    public func restart(modes: [CheckMode], forceUpdate: Bool = false, countryCode: String = CountryCodes.Switzerland, checkDate: Date = Date()) {
        guard let su = stateUpdate else { return }
        start(modes: modes, forceUpdate: forceUpdate, countryCode: countryCode, checkDate: checkDate, stateUpdate: su)
    }

    // MARK: - Signature

    private func handleSignatureResult(_ result: Result<ValidationResult, ValidationError>) -> VerificationState {
        switch result {
        case let .success(result):
            if result.isValid {
                return .success(validityDate: nil, switzerlandOnly: nil, modeResults: nil, eolBannerIdentifier: nil)
            } else {
                // !: checked
                let errorCodes = result.error != nil ? [result.error!.errorCode] : []
                return .invalid(errors: [.signature], errorCodes: errorCodes, validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
            }

        case let .failure(err):
            switch err {
            case .NETWORK_NO_INTERNET_CONNECTION:
                // retry possible
                return .retry(.noInternetConnection, [err.errorCode])
            case .NETWORK_PARSE_ERROR, .NETWORK_ERROR:
                return .retry(.network, [err.errorCode])
            case .TIME_INCONSISTENCY:
                return .retry(.timeShift, [err.errorCode])
            case .SIGNATURE_TYPE_INVALID:
                return .invalid(errors: [.typeInvalid], errorCodes: [err.errorCode], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
            case .CWT_EXPIRED:
                return .invalid(errors: [.signatureExpired], errorCodes: [err.errorCode], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
            default:
                // error
                return .invalid(errors: [.signature], errorCodes: [err.errorCode], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
            }
        }
    }

    private func handleRevocationResult(_ result: Result<ValidationResult, ValidationError>?) -> VerificationState {
        guard let result = result else { return .skipped }
        switch result {
        case let .success(result):
            if result.isValid {
                return .success(validityDate: nil, switzerlandOnly: nil, modeResults: nil, eolBannerIdentifier: nil)
            } else {
                // !: checked
                let errorCodes = result.error != nil ? [result.error!.errorCode] : []
                return .invalid(errors: [.revocation], errorCodes: errorCodes, validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
            }

        case let .failure(err):
            switch err {
            case .NETWORK_NO_INTERNET_CONNECTION:
                // retry possible
                return .retry(.noInternetConnection, [err.errorCode])
            case .NETWORK_PARSE_ERROR, .NETWORK_ERROR, .NETWORK_SERVER_ERROR:
                return .retry(.network, [err.errorCode])
            case .TIME_INCONSISTENCY:
                return .retry(.timeShift, [err.errorCode])
            default:
                return .retry(.unknown, [err.errorCode])
            }
        }
    }

    private func handleModeResult(_ result: ModeResults, mode: CheckMode?) -> VerificationState {
        guard let mode = mode, let modeResult = result.getResult(for: mode) else {
            return VerificationState.skipped
        }

        switch modeResult {
        case let .success(r):
            if r.isValid {
                return .success(validityDate: nil, switzerlandOnly: nil, modeResults: result, eolBannerIdentifier: nil)
            } else {
                // if is invalid, check for unknown mode or unsupported light certificate,
                // always remove all error codes afterwards as it shows mode error
                if r.isModeUnknown() {
                    return VerificationState.invalid(errors: [.unknownMode], errorCodes: [], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
                } else if r.isLightUnsupported() {
                    return VerificationState.invalid(errors: [.lightUnsupported(mode.displayName)], errorCodes: [], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
                } else if r.isUnknown() {
                    return VerificationState.invalid(errors: [.unknown], errorCodes: [], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
                } else {
                    return VerificationState.invalid(errors: [.otherNationalRules(mode.displayName)], errorCodes: [], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
                }
            }

        case let .failure(error):
            return handleNationalRulesError(err: error)
        }
    }

    private func handleNationalRulesResult(_ result: Result<VerificationResult, NationalRulesError>, modeResults: ModeResults?) -> VerificationState {
        guard let holder = holder else {
            assertionFailure()
            return .invalid(errors: [.unknown], errorCodes: ["V|HN"], validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
        }
        switch result {
        case let .success(result):
            var validUntil: String?
            var isSwitzerlandOnly: Bool?
            var eolBannerIdentifier: String?

            #if WALLET
                // get expired date string
                if let date = result.validUntil {
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
                }

                if let chOnly = result.isSwitzerlandOnly {
                    isSwitzerlandOnly = chOnly
                }

                if let identifier = result.eolBannerIdentifier {
                    eolBannerIdentifier = identifier
                }
            #endif

            // check for validity
            if result.isValid {
                return .success(validityDate: validUntil, switzerlandOnly: isSwitzerlandOnly, modeResults: modeResults, eolBannerIdentifier: eolBannerIdentifier)
            } else if let dateError = result.dateError {
                switch dateError {
                case .NOT_YET_VALID:
                    return .invalid(errors: [.notYetValid(result.validFrom ?? Date())], errorCodes: [], validity: validUntil, wasRevocationSkipped: false, switzerlandOnly: isSwitzerlandOnly)
                case .EXPIRED:
                    return .invalid(errors: [.expired(result.validUntil ?? Date())], errorCodes: [], validity: validUntil, wasRevocationSkipped: false, switzerlandOnly: isSwitzerlandOnly)
                case .NO_VALID_DATE:
                    return .invalid(errors: [.typeInvalid], errorCodes: [], validity: validUntil, wasRevocationSkipped: false, switzerlandOnly: isSwitzerlandOnly)
                }
            } else {
                let displayName = modeResults?.results.first?.key.displayName ?? ""
                return .invalid(errors: [.otherNationalRules(displayName)], errorCodes: [], validity: validUntil, wasRevocationSkipped: false, switzerlandOnly: isSwitzerlandOnly)
            }
        case let .failure(err):
            return handleNationalRulesError(err: err)
        }
    }

    private func handleNationalRulesError(err: NationalRulesError) -> VerificationState {
        switch err {
        case .NETWORK_NO_INTERNET_CONNECTION:
            // retry possible
            return .retry(.noInternetConnection, [err.errorCode])
        case .NETWORK_PARSE_ERROR, .NETWORK_ERROR:
            // retry possible
            return .retry(.network, [err.errorCode])
        case .TIME_INCONSISTENCY:
            return .retry(.timeShift, [err.errorCode])
        default:
            // for unknown rules, just show the rule identifier
            // (only used for checking foreign rules)
            var error = [err.errorCode]
            if case let .UNKNOWN_RULE_FAILED(ruleName) = err {
                error = [ruleName]
            }

            // do not show the explicit error code on the verifier app, s.t.
            // no information is shown about the checked user (e.g. certificate type)
            #if WALLET
                return .invalid(errors: [.otherNationalRules("")], errorCodes: error, validity: nil, wasRevocationSkipped: false, switzerlandOnly: nil)
            #elseif VERIFIER
                return .invalid(errors: [.otherNationalRules(modes?.first?.displayName ?? "")], errorCodes: [], validity: nil, wasRevocationSkipped: false)
            #endif
        }
    }
}
