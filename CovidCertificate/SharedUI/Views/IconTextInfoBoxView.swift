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

class IconTextInfoBoxView: PopupView {
    private let stackView = UIStackView()

    private let titleLabel = Label(.title, textAlignment: .center)

    private let iconTextSource: [(UIImage, String)]

    private var closeButtonView = UIView()
    private let closeButton = Button(title: UBLocalized.close_button, style: .text(.cc_blue))

    init(iconTextStrs: [(UIImage, String)]) {
        iconTextSource = iconTextStrs
        super.init()
    }

    override internal func setup() {
        super.setup()

        contentView.backgroundColor = .cc_white
        contentView.layer.cornerRadius = 20.0

        addSubview(contentView)

        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Padding.large)
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().inset(2.0 * Padding.large)
            make.bottom.lessThanOrEqualToSuperview().inset(2.0 * Padding.large)
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(Padding.large)
            make.bottom.equalToSuperview().inset(Padding.medium)
        }

        stackView.axis = .vertical

        titleLabel.text = ConfigManager.currentConfig?.checkModesInfo?.value?.title ?? UBLocalized.accessibility_info_box

        stackView.addArrangedView(titleLabel)
        stackView.addSpacerView(Padding.medium + Padding.small - 2.0)

        iconTextSource.forEach {
            stackView.addArrangedSubview(OnboardingInfoView(icon: $0.0, text: $0.1, alignment: .natural, leftRightInset: 0))
        }

        closeButtonView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.bottom.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }

        stackView.addArrangedSubview(closeButtonView)

        closeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismiss()
        }
    }
}
