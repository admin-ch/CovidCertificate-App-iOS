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

final class VerifierManager {
    // MARK: - Singleton

    static let shared = VerifierManager()

    private init() {}

    // MARK: - Properties

    private var verifiers: [String: Verifier] = [:]

    // MARK: - State Observers

    private struct Observer {
        weak var object: AnyObject?
        var block: (VerificationState) -> Void
    }

    private var observers: [String: [Observer]] = [:]

    private func updateObservers(for qrString: String, modes: [CheckMode], state: VerificationState, countryCode: String = CountryCodes.Switzerland, checkDate: Date?) {
        guard let list = observers[key(qrString, modes, countryCode, checkDate)] else { return }
        let newList = list.filter { $0.object != nil }

        guard !newList.isEmpty else {
            verifiers[key(qrString, modes, countryCode, checkDate)] = nil
            return
        }

        DispatchQueue.main.async {
            newList.forEach { $0.block(state) }
        }
    }

    // MARK: - Public API

    func addObserver(_ object: AnyObject, for qrString: String, modes: [CheckMode], forceUpdate: Bool = false, countryCode: String = CountryCodes.Switzerland, checkDate: Date? = nil, block: @escaping (VerificationState) -> Void) {
        if observers[key(qrString, modes, countryCode, checkDate)] != nil {
            observers[key(qrString, modes, countryCode, checkDate)] = observers[key(qrString, modes, countryCode, checkDate)]!.filter { $0.object != nil && !$0.object!.isEqual(object) }
            observers[key(qrString, modes, countryCode, checkDate)]?.append(Observer(object: object, block: block))
        } else {
            observers[key(qrString, modes, countryCode, checkDate)] = [Observer(object: object, block: block)]
        }

        if let v = verifiers[key(qrString, modes, countryCode, checkDate)] {
            v.restart(modes: modes, forceUpdate: forceUpdate)
        } else {
            let v = Verifier(qrString: qrString)
            verifiers[key(qrString, modes, countryCode, checkDate)] = v
            v.start(modes: modes, forceUpdate: forceUpdate, countryCode: countryCode, checkDate: checkDate ?? Date()) { state in
                self.updateObservers(for: qrString, modes: modes, state: state, countryCode: countryCode, checkDate: checkDate)
            }
        }
    }

    private func key(_ qrString: String, _ modes: [CheckMode], _ countryCode: String, _ checkDate: Date?) -> String {
        if let checkDate = checkDate {
            return modes.reduce(qrString + countryCode + DateFormatter.ub_string(from: checkDate)) { partialResult, mode in partialResult + mode.id }
        } else {
            return modes.reduce(qrString + countryCode) { partialResult, mode in partialResult + mode.id }
        }
    }
}
