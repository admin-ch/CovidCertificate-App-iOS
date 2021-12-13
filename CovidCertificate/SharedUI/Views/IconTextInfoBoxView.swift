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
    private let stackScrollView = StackScrollView(axis: .vertical)

    private let titleLabel = Label(.title, textAlignment: .center)

    private let iconTextSource: [(UIImage, String)]
    private let imageHeight: CGFloat

    private var closeButtonView = UIView()
    private let closeButton = Button(title: UBLocalized.close_button, style: .text(.cc_blue))

    init(iconTextSource: [(UIImage, String)], imageHeight: CGFloat) {
        self.imageHeight = imageHeight
        self.iconTextSource = iconTextSource
        super.init()
    }

    override internal func setup() {
        super.setup()

        stackScrollView.scrollView.alwaysBounceVertical = false
        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.small + Padding.medium
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: p, left: p, bottom: 0.0, right: p)

        contentView.backgroundColor = .cc_white
        contentView.layer.cornerRadius = 20.0
        contentView.clipsToBounds = true

        contentView.addSubview(stackScrollView)
        contentView.addSubview(closeButtonView)

        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Padding.large)
            make.centerY.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin).inset(2.0 * Padding.large)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottomMargin).inset(2.0 * Padding.large)
        }

        closeButtonView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
        }

        stackScrollView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(closeButtonView.snp.top)
        }

        titleLabel.text = ConfigManager.currentConfig?.checkModesInfo?.value?.title ?? UBLocalized.accessibility_info_box

        stackScrollView.addArrangedView(titleLabel)
        stackScrollView.addSpacerView(Padding.medium + Padding.small - 2.0)

        iconTextSource.forEach {
            stackScrollView.addArrangedView(OnboardingInfoView(icon: $0.0, text: $0.1, alignment: .natural, leftRightInset: 0, height: self.imageHeight))
        }

        closeButtonView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.bottom.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }

        closeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismiss()
        }
    }
}
