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

    private func updateObservers(for qrString: String, modes: [CheckMode], state: VerificationState) {
        guard let list = observers[key(qrString, modes)] else { return }
        let newList = list.filter { $0.object != nil }

        guard !newList.isEmpty else {
            verifiers[key(qrString, modes)] = nil
            return
        }

        DispatchQueue.main.async {
            newList.forEach { $0.block(state) }
        }
    }

    // MARK: - Public API

    func addObserver(_ object: AnyObject, for qrString: String, modes: [CheckMode], forceUpdate: Bool = false, block: @escaping (VerificationState) -> Void) {
        if observers[key(qrString, modes)] != nil {
            observers[key(qrString, modes)] = observers[key(qrString, modes)]!.filter { $0.object != nil && !$0.object!.isEqual(object) }
            observers[key(qrString, modes)]?.append(Observer(object: object, block: block))
        } else {
            observers[key(qrString, modes)] = [Observer(object: object, block: block)]
        }

        if let v = verifiers[key(qrString, modes)] {
            v.restart(modes: modes, forceUpdate: forceUpdate)
        } else {
            let v = Verifier(qrString: qrString)
            verifiers[key(qrString, modes)] = v
            v.start(modes: modes, forceUpdate: forceUpdate) { state in
                self.updateObservers(for: qrString, modes: modes, state: state)
            }
        }
    }

    private func key(_ qrString: String, _ modes: [CheckMode]) -> String {
        return modes.reduce(qrString) { partialResult, mode in partialResult + mode.id }
    }
}
