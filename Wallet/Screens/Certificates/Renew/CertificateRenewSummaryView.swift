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

class CertificateRenewSummaryView: UIView {
    private let stackView = UIStackView()

    enum Mode {
        case expired
        case renewed

        var identifier: String {
            switch self {
            case .expired:
                return "EXPIRED"
            case .renewed:
                return "RENEWED"
            }
        }
    }

    var mode: Mode = .expired {
        didSet {
            update()
        }
    }

    init() {
        super.init(frame: .zero)
        setupLayout()
        update()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        stackView.axis = .vertical

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func update() {
        stackView.clearSubviews()

        guard let infos = ConfigManager.currentConfig?.certRenewalInfo.value?[mode.identifier] else { return }

        let title = Label(.textBoldLarge, textAlignment: .center)
        title.text = infos.heading

        stackView.addSpacerView(Padding.large)

        stackView.addArrangedView(title)

        stackView.addSpacerView(Padding.large)

        for info in infos.infos {
            stackView.addArrangedView(
                OnboardingInfoView(icon: UIImage(named: info.iconIos)?.ub_image(with: .cc_blue),
                                   text: info.text,
                                   alignment: .left,
                                   leftRightInset: Padding.medium)
            )
        }

        stackView.addSpacerView(Padding.large)
    }
}
