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
        return UIStateModel(certificateState: buildCertificateState(), infoBoxState: buildInfoBoxState(), vaccinationInfoState: buildVaccinationInfoState(), checkMode: buildCheckMode())
    }

    // MARK: - Substates

    private func buildCertificateState() -> CertificateState {
        #if WALLET
            return CertificateState(certificates: CertificateStorage.shared.userCertificates, renewalDates: WalletUserStorage.shared.renewalDates)
        #elseif VERIFIER
            return CertificateState(certificates: [], renewalDates: [])
        #endif
    }

    private func buildInfoBoxState() -> InfoBox? {
        return ConfigManager.currentConfig?.infoBox?.value
    }

    private func buildVaccinationInfoState() -> VaccinationInfo {
        #if WALLET
            return VaccinationInfo(showVaccinationHintHomescreen: ConfigManager.currentConfig?.showVaccinationHintHomescreen ?? false)
        #elseif VERIFIER
            return VaccinationInfo(showVaccinationHintHomescreen: false)
        #endif
    }

    private func buildCheckMode() -> CheckModeState {
        #if WALLET
            return CheckModeState(key: nil, modes: Verifier.currentModes().map { $0.id })
        #elseif VERIFIER
            return CheckModeState(key: VerifierUserStorage.shared.checkModeKey, modes: Verifier.currentModes().map { $0.id })
        #endif
    }
}
