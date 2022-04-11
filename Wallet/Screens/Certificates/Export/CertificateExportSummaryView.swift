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

class CertificateExportSummaryView: UIView {
    private let stackView = UIStackView()
    private let exportButton: Button = Button(titleKey: .wallet_certificate_export_button)

    var exportCallback: (() -> Void)? {
        didSet {
            exportButton.touchUpCallback = exportCallback
        }
    }

    init() {
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

        stackView.addSpacerView(Padding.medium)

        stackView.addArrangedView(
            OnboardingInfoView(icon: UIImage(named: "ic-pdf")?.ub_image(with: .cc_blue),
                               text: UBLocalized.wallet_certificate_export_summary_1,
                               alignment: .left,
                               leftRightInset: Padding.medium)
        )

        stackView.addArrangedView(
            OnboardingInfoView(icon: UIImage(named: "ic-online")?.ub_image(with: .cc_blue),
                               text: UBLocalized.wallet_certificate_export_summary_2,
                               alignment: .left,
                               leftRightInset: Padding.medium)
        )

        stackView.addSpacerView(Padding.large)

        stackView.addArrangedViewCentered(exportButton)

        stackView.addSpacerView(Padding.large * 2.0)
    }
}
