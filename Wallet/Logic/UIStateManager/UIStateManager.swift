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

class UIStateManager: NSObject {
    static let shared = UIStateManager()

    private let queue = DispatchQueue(label: "UiStateManager")

    override init() {
        // only one instance
        super.init()

        refresh()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    // MARK: - Refresh triggers

    public func stateChanged(forceRefresh: Bool = false) {
        refresh(forceRefresh: forceRefresh)
    }

    // MARK: - UI State Update

    private(set) var uiState: UIStateModel?

    private func refresh(forceRefresh: Bool = false) {
        queue.async {
            // build new state, sending update to observers if changed
            let oldState = self.uiState

            self.uiState = UIStateLogic(manager: self).buildState()

            let stateHasChanged = self.uiState != oldState || forceRefresh

            if stateHasChanged {
                self.updateObservers()
                dprint("New UI State")
            }
        }
    }

    // MARK: - State Observers

    struct Observer {
        weak var object: AnyObject?
        var block: (UIStateModel) -> Void
    }

    private var observers: [Observer] = []

    func addObserver(_ object: AnyObject, block: @escaping (UIStateModel) -> Void) {
        queue.sync {
            observers.append(Observer(object: object, block: block))
        }

        if let currentState = uiState {
            DispatchQueue.main.async {
                block(currentState)
            }
        }
    }

    private func updateObservers() {
        dispatchPrecondition(condition: .onQueue(queue))
        guard let currentState = uiState else { return }

        observers = observers.filter { $0.object != nil }
        DispatchQueue.main.async {
            self.observers.forEach { observer in
                observer.block(currentState)
            }
        }
    }
}
