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

class VaccinationInformationViewController: StackScrollViewController {
    private let insets = UIEdgeInsets(top: 0, left: 2 * Padding.medium, bottom: 0, right: 2 * Padding.medium)

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = ConfigManager.currentConfig

        title = UBLocalized.vaccination_appointment_header.uppercased()
        view.backgroundColor = .cc_background
        addDismissButton()

        stackScrollView.stackView.alignment = .fill

        if let titleText = config?.vaccinationBookingInfo.value?.title {
            let title = Label(.title, textAlignment: .center)
            title.accessibilityTraits = .header
            title.text = titleText
            addArrangedView(title, insets: insets)

            stackScrollView.addSpacerView(40)
        }

        if let subtitleText = config?.vaccinationBookingInfo.value?.text {
            let subtitle = Label(.text, textAlignment: .left)
            subtitle.text = subtitleText
            addArrangedView(subtitle, insets: insets)

            stackScrollView.addSpacerView(30)
        }

        if let vaccinationBookingInfoBlueBox = config?.vaccinationBookingInfo.value?.info {
            addArrangedView(RoundedBackgroundView(text: vaccinationBookingInfoBlueBox), insets: insets)
            stackScrollView.addSpacerView(30)
        }

        if config?.vaccinationBookingInfo.value?.hasAllImpfCheckValues ?? false {
            let titleLabel = Label(.textBoldLarge, textAlignment: .left)
            titleLabel.accessibilityTraits = .header
            titleLabel.text = config?.vaccinationBookingInfo.value?.impfcheckTitle ?? UBLocalized.vaccination_impf_check_title
            addArrangedView(titleLabel, insets: insets)
            stackScrollView.addSpacerView(14)

            let subtitleLabel = Label(.text, textAlignment: .left)
            subtitleLabel.text = config?.vaccinationBookingInfo.value?.impfcheckText ?? UBLocalized.vaccination_impf_check_info_text
            addArrangedView(subtitleLabel, insets: insets)
            stackScrollView.addSpacerView(Padding.large)

            let button = TrailingIconButton(title: config?.vaccinationBookingInfo.value?.impfcheckButton ?? UBLocalized.vaccination_impf_check_action, icon: UIImage(named: "ic-link-external")?.ub_image(with: .white))
            button.touchUpCallback = { [weak self] in
                self?.vaccinationCheckButtonPressed()
            }
            addArrangedView(button, insets: insets)

            stackScrollView.addSpacerView(30)
        }

        let button = IconButton(textKey: .vaccination_more_information_title, icon: UIImage(named: "ic-link-external")?.ub_image(with: .cc_blue))
        button.accessibilityTraits = .link
        button.touchUpCallback = {
            guard let url = URL(string: UBLocalized.vaccination_booking_info_url) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }

        addArrangedView(button, insets: insets)
        stackScrollView.addSpacerView(40)
    }

    private func vaccinationCheckButtonPressed() {
        let urlString = ConfigManager.currentConfig?.vaccinationBookingInfo.value?.impfcheckUrl ?? UBLocalized.vaccination_impf_check_url
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

class RoundedBackgroundView: UIView {
    // MARK: - Subviews

    private let label = Label(.text)

    // MARK: - Init

    init(text: String) {
        super.init(frame: .zero)
        setup()

        label.text = text
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        let v = UIView()
        v.backgroundColor = UIColor.cc_blueish
        v.layer.cornerRadius = 9.0

        addSubview(v)
        v.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Padding.large)
        }
    }
}
