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

class CertificateLightSummaryView: UIView {
    private let stackView = UIStackView()
    private let activateButton: Button

    var activateCallback: (() -> Void)? {
        didSet {
            activateButton.touchUpCallback = activateCallback
        }
    }

    init(isActive: Bool) {
        if isActive {
            activateButton = Button(titleKey: .wallet_certificate_light_detail_deactivate_button, style: .normal(.cc_bund))
        } else {
            activateButton = Button(titleKey: .wallet_certificate_light_detail_activate_button)
        }
        super.init(frame: .zero)
        setupLayout()

        backgroundColor = .cc_blueish
        layer.cornerRadius = 10
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        stackView.axis = .vertical

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let title = Label(.textBoldLarge, textAlignment: .center)
        title.text = UBLocalized.wallet_certificate_light_detail_summary_title

        stackView.addSpacerView(Padding.large)

        stackView.addArrangedView(title)

        stackView.addSpacerView(Padding.large)

        stackView.addArrangedView(
            OnboardingInfoView(icon: UIImage(named: "ic-bund-small"),
                               text: UBLocalized.wallet_certificate_light_detail_summary_1,
                               alignment: .left,
                               leftRightInset: Padding.medium)
        )

        stackView.addArrangedView(
            OnboardingInfoView(icon: UIImage(named: "ic-privacy")?.ub_image(with: .cc_blue),
                               text: UBLocalized.wallet_certificate_light_detail_summary_2,
                               alignment: .left,
                               leftRightInset: Padding.medium)
        )

        stackView.addArrangedView(
            OnboardingInfoView(icon: UIImage(named: "ic-timelapse")?.ub_image(with: .cc_blue),
                               text: UBLocalized.wallet_certificate_light_detail_summary_3.replacingOccurrences(of: "{LIGHT_CERT_VALIDITY_IN_H}", with: "\(ConfigManager.currentConfig?.lightCertDurationInHours ?? 24)"),
                               alignment: .left,
                               leftRightInset: Padding.medium)
        )

        stackView.addArrangedView(
            OnboardingInfoView(icon: UIImage(named: "ic-online")?.ub_image(with: .cc_blue),
                               text: UBLocalized.wallet_certificate_light_detail_summary_4,
                               alignment: .left,
                               leftRightInset: Padding.medium)
        )

        stackView.addArrangedView(
            OnboardingInfoView(icon: UIImage(named: "ic-swap")?.ub_image(with: .cc_blue),
                               text: UBLocalized.wallet_certificate_light_detail_summary_5,
                               alignment: .left,
                               leftRightInset: Padding.medium)
        )

        stackView.addSpacerView(Padding.large)

        stackView.addArrangedViewCentered(activateButton)

        stackView.addSpacerView(Padding.large * 2.0)
    }
}
