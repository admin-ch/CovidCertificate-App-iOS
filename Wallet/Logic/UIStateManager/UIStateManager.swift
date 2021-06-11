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
        DispatchQueue.main.async {
            guard UIApplication.shared.applicationState == .active else { return }
            self.forceRefresh = forceRefresh
            self.refresh()
        }
    }

    // MARK: - UI State Update

    private(set) var uiState: UIStateModel! {
        didSet {
            let stateHasChanged = uiState != oldValue || forceRefresh

            if stateHasChanged {
                updateObservers()
                dprint("New UI State")
            }
        }
    }

    private var forceRefresh = false

    private func refresh() {
        // build new state, sending update to observers if changed
        uiState = UIStateLogic(manager: self).buildState()
        forceRefresh = false
    }

    // MARK: - State Observers

    struct Observer {
        weak var object: AnyObject?
        var block: (UIStateModel) -> Void
    }

    private var observers: [Observer] = []

    func addObserver(_ object: AnyObject, block: @escaping (UIStateModel) -> Void) {
        observers.append(Observer(object: object, block: block))
        block(uiState)
    }

    func updateObservers() {
        observers = observers.filter { $0.object != nil }
        DispatchQueue.main.async {
            self.observers.forEach { observer in
                observer.block(self.uiState)
            }
        }
    }
}
