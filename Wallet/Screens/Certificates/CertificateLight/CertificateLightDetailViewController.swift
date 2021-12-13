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

import UIKit

class CertificateLightDetailViewController: StackScrollViewController {
    private let certificate: UserCertificate

    private let qrCodeNameView = QRCodeNameView(isLightCertificate: true)
    private let verificationStateView = CertificateStateView(isHomescreen: false, showValidity: false, isLightCertificate: true)
    private let summary = CertificateLightSummaryView(isActive: true)

    var didDisableLightCertificate: ((UserCertificate) -> Void)?

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupInteraction()
        view.backgroundColor = .cc_background
        title = UBLocalized.wallet_certificate_light_title.localizedUppercase

        guard let qrCode = certificate.lightCertificate?.certificate else {
            return
        }
        VerifierManager.shared.addObserver(self, for: qrCode, modes: Verifier.currentModes()) { [weak self] state in
            guard let self = self else { return }
            self.verificationStateView.states = (state, .idle)
            self.qrCodeNameView.enabled = !state.isInvalid()
        }
    }

    func setupLayout() {
        let p = Padding.large + Padding.medium
        let padding = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)
        addArrangedView(qrCodeNameView, insets: padding)

        qrCodeNameView.snp.makeConstraints { make in
            make.width.equalTo(stackScrollView.snp.width).inset(padding)
        }

        qrCodeNameView.certificate = certificate
        stackScrollView.addSpacerView(Padding.large)

        addArrangedView(verificationStateView, insets: padding)
        verificationStateView.snp.makeConstraints { make in
            make.width.equalTo(qrCodeNameView.qrCodeLayoutGuide)
        }
        stackScrollView.addSpacerView(Padding.large * 2)

        addArrangedView(summary, insets: UIEdgeInsets(top: 0, left: Padding.large, bottom: 0, right: Padding.large))

        stackScrollView.addSpacerView(Padding.large)
    }

    func setupInteraction() {
        summary.activateCallback = { [weak self] in
            guard let self = self,
                  let qrCode = self.certificate.qrCode,
                  let newModel = CertificateStorage.shared.updateCertificate(with: qrCode, lightCertififcate: nil) else { return }
            self.didDisableLightCertificate?(newModel)
        }
        qrCodeNameView.didExpireCallback = { [weak self] in
            guard let self = self,
                  let qrCode = self.certificate.qrCode,
                  let newModel = CertificateStorage.shared.updateCertificate(with: qrCode, lightCertififcate: nil) else { return }
            self.didDisableLightCertificate?(newModel)
        }
    }
}
