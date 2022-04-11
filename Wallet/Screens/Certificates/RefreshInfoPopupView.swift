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

import CovidCertificateSDK
import UIKit

class RefreshInfoPopupView: PopupView {
    // MARK: - Subviews

    private let stackScrollView = StackScrollView(axis: .vertical)

    private let titleLabel = Label(.title, textAlignment: .center)

    private let buttonView = UIView()
    private let closeButton = Button(titleKey: .close_button, style: .text(.cc_blue))

    private var infoView = UIStackView()

    init() {
        super.init(enableBackgroundDismiss: true)
    }

    // MARK: - Setup

    override internal func setup() {
        super.setup()

        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.small + Padding.medium + 3.0
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)

        contentView.backgroundColor = .cc_white
        contentView.layer.cornerRadius = 20.0
        contentView.clipsToBounds = true

        infoView.axis = .vertical
        infoView.spacing = Padding.small

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

        closeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismiss()
        }

        buttonView.ub_addShadow(radius: 8, opacity: 0.14, xOffset: 0, yOffset: 0)

        stackScrollView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(buttonView.snp.top)
        }

        updateInfos()

        stackScrollView.addArrangedView(infoView, inset: UIEdgeInsets(top: Padding.medium + Padding.small, left: 0, bottom: Padding.small, right: 0))
    }

    private func updateInfos() {
        guard let info = ConfigManager.currentConfig?.refreshButtonInfo?.value else { return }

        // adds title
        if let title = info.title {
            titleLabel.text = title
            stackScrollView.addArrangedView(titleLabel, inset: UIEdgeInsets(top: Padding.large + Padding.small, left: 0, bottom: 0, right: 0))
        }

        var padding = Padding.large + Padding.small

        // adds info text
        if let text1 = info.text1 {
            let label = Label(.text)
            label.text = text1
            stackScrollView.addArrangedView(label, inset: UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0))

            padding = Padding.medium + Padding.small
        }

        if let text2 = info.text2 {
            let label = Label(.text)
            label.text = text2
            stackScrollView.addArrangedView(label, inset: UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0))

            padding = Padding.medium + Padding.small
        }

        // adds title and text for checkers
        if let fatTitle = info.fatTitle {
            let label = Label(.textBold)
            label.text = fatTitle
            stackScrollView.addArrangedView(label, inset: UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0))

            padding = Padding.medium + Padding.small
        }

        if let text3 = info.text3 {
            let label = Label(.text)
            label.text = text3
            stackScrollView.addArrangedView(label, inset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))

            padding = Padding.medium + Padding.small
        }

        // adds covid check icon
        let v = UIView()
        let b = Button(image: UIImage(named: "img-covid-check"), accessibilityKey: .verifier_app_name, useCircle: false, highlightCornerRadius: Padding.medium)
        if let url = URL(string: UBLocalized.verifier_apple_app_store_url) {
            b.touchUpCallback = {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }

        v.addSubview(b)
        b.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }

        stackScrollView.addArrangedView(v, inset: UIEdgeInsets(top: Padding.medium, left: 0, bottom: 0, right: 0))

        // adds link to BAG website about checking
        if let linkTitle = info.linkText,
           let linkUrl = URL(string: info.linkUrl ?? "") {
            let v = UIView()
            let button = ExternalLinkButton(title: linkTitle)

            v.addSubview(button)
            button.snp.makeConstraints { make in
                make.top.bottom.left.equalToSuperview()
                make.right.lessThanOrEqualToSuperview()
            }

            button.touchUpCallback = {
                UIApplication.shared.open(linkUrl, options: [:], completionHandler: nil)
            }

            stackScrollView.addArrangedView(v, inset: UIEdgeInsets(top: Padding.medium + Padding.small, left: 0, bottom: 0, right: 0))
        }
    }
}
