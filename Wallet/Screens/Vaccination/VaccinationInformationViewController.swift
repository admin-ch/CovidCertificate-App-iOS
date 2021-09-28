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

        self.title = UBLocalized.vaccination_appointment_header
        view.backgroundColor = .cc_background
        addDismissButton()

        stackScrollView.stackView.alignment = .fill

        let title = Label(.title, textAlignment: .center)
        title.text = ConfigManager.currentConfig?.vaccinationBookingInfo.value?.title ?? ""
        addArrangedView(title, insets: insets)

        stackScrollView.addSpacerView(40)
        let subtitle = Label(.text, textAlignment: .left)
        subtitle.text = ConfigManager.currentConfig?.vaccinationBookingInfo.value?.text
        addArrangedView(subtitle, insets: insets)

        stackScrollView.addSpacerView(30)

        addArrangedView(RoundedBackgroundView(text: ConfigManager.currentConfig?.vaccinationBookingInfo.value?.info ?? ""), insets: insets)

        stackScrollView.addSpacerView(30)
        let titleLabel = Label(.textBoldLarge, textAlignment: .left)
        titleLabel.text = UBLocalized.vaccination_choose_your_canton
        addArrangedView(titleLabel, insets: insets)
        stackScrollView.addSpacerView(14)
        stackScrollView.addSpacerView(2, color: .cc_blueish)

        for canton in ConfigManager.currentConfig?.vaccinationBookingCantons.value ?? [] {
            let cantonButton = VaccinationCantonButton(text: canton.name, iconName: "canton_3") // canton.iconIos)
            cantonButton.accessibilityTraits = .link

            cantonButton.touchUpCallback = {
                guard let url = URL(string: canton.linkUrl) else { return }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            addArrangedView(cantonButton)
            stackScrollView.addSpacerView(2, color: .cc_blueish)
        }
        stackScrollView.addSpacerView(30)

        let button = IconTitleButton(text: UBLocalized.vaccination_more_information_title, icon: UIImage(named: "ic-link-external")?.ub_image(with: .cc_blue))
        button.accessibilityTraits = .link
        button.touchUpCallback = {
            // UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        addArrangedView(button, insets: insets)
        stackScrollView.addSpacerView(40)
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

private class IconTitleButton: UBButton {
    // MARK: - Subviews

    private let textLabel = Label(.textBoldLarge)
    private let iconView = UIImageView()

    // MARK: - Init

    init(text: String?, icon: UIImage?) {
        super.init()

        textLabel.text = text
        iconView.image = icon

        highlightedBackgroundColor = UIColor.cc_blue.withAlphaComponent(0.15)

        highlightXInset = -2.0 * Padding.small
        highlightYInset = -Padding.medium
        highlightCornerRadius = -Padding.small

        setup()
    }

    // MARK: - Setup

    private func setup() {
        addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.centerY.equalToSuperview()
        }

        textLabel.textColor = .cc_blue
        textLabel.textAlignment = .left
        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        accessibilityLabel = textLabel.text
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        highlightCornerRadius = frame.size.height * 0.5 + 3.0
    }
}
