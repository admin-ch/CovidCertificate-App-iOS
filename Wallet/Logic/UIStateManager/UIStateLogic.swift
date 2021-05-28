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

/// Implementation of business rules to link SDK and all errors and states  to UI state
class UIStateLogic {
    let manager: UIStateManager

    init(manager: UIStateManager) {
        self.manager = manager
    }

    func buildState() -> UIStateModel {
        return UIStateModel(certificateState: buildCertificateState(), infoBoxState: buildInfoBoxState())
    }

    // MARK: - Substates

    private func buildCertificateState() -> CertificateState {
        #if WALLET
            return CertificateState(certificates: CertificateStorage.shared.userCertificates)
        #elseif VERIFIER
            return CertificateState(certificates: [])
        #endif
    }

    private func buildInfoBoxState() -> InfoBox? {
        return ConfigManager.currentConfig?.infoBox?.value
    }
}
