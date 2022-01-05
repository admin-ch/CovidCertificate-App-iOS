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

    private let buttonView = UIView()
    private let closeButton = Button(title: UBLocalized.close_button, style: .text(.cc_blue))

    // MARK: - Init

    init(iconTextSource: [(UIImage, String)], imageHeight: CGFloat) {
        self.imageHeight = imageHeight
        self.iconTextSource = iconTextSource
        super.init()
    }

    // MARK: - Setup

    override internal func setup() {
        super.setup()

        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.small + Padding.medium
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)

        contentView.backgroundColor = .cc_white
        contentView.layer.cornerRadius = 20.0
        contentView.clipsToBounds = true

        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Padding.large)
            make.centerY.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin).inset(2.0 * Padding.large)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottomMargin).inset(2.0 * Padding.large)
        }

        contentView.addSubview(stackScrollView)
        contentView.addSubview(buttonView)

        buttonView.backgroundColor = .cc_white
        buttonView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
        }

        buttonView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.left.greaterThanOrEqualToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualToSuperview().inset(Padding.medium)
            make.centerX.top.bottom.equalToSuperview().inset(Padding.medium)
        }

        buttonView.ub_addShadow(radius: 8, opacity: 0.14, xOffset: 0, yOffset: 0)

        stackScrollView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(buttonView.snp.top)
        }

        titleLabel.text = ConfigManager.currentConfig?.checkModesInfo?.value?.title ?? UBLocalized.accessibility_info_box

        stackScrollView.addArrangedView(titleLabel, inset: UIEdgeInsets(top: Padding.large + Padding.small, left: 0, bottom: Padding.large + Padding.small, right: 0))

        var maxWidth: CGFloat = 0
        for i in iconTextSource {
            let w = i.0.size.width / (i.0.size.height / imageHeight)
            if w > maxWidth {
                maxWidth = w
            }
        }

        iconTextSource.forEach {
            stackScrollView.addArrangedView(OnboardingInfoView(icon: $0.0, text: $0.1, alignment: .natural, leftRightInset: 0, height: self.imageHeight, width: maxWidth))
        }

        closeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismiss()
        }
    }
}
