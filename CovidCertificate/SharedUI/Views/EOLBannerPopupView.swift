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

class EOLBannerPopupView: PopupView {
    private let stackScrollView = StackScrollView(axis: .vertical)

    private let titleLabel = Label(.title, textAlignment: .center)

    private let buttonView = UIView()
    private let closeButton = Button(titleKey: .close_button, style: .text(.cc_blue))

    let banner: ConfigResponseBody.EOLBannerInfo

    // MARK: - Init

    init(banner: ConfigResponseBody.EOLBannerInfo) {
        self.banner = banner
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

        titleLabel.text = banner.popupTitle

        stackScrollView.addArrangedView(titleLabel, inset: UIEdgeInsets(top: Padding.large + Padding.small, left: 0, bottom: 2.0 * Padding.medium, right: 0))

        let bottomPadding = Padding.medium + Padding.small

        if let text = banner.popupText1 {
            let label = Label(.text)
            label.text = text
            stackScrollView.addArrangedView(label, inset: UIEdgeInsets(top: 0.0, left: 0.0, bottom: bottomPadding, right: 0.0))
        }

        if let boldText = banner.popupBoldText {
            let wrapper = UIView()
            let boldLabel = Label(.textBold)
            boldLabel.text = boldText
            wrapper.addSubview(boldLabel)
            boldLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: Padding.medium, left: Padding.medium, bottom: Padding.medium, right: Padding.medium))
            }

            wrapper.layer.cornerRadius = 10.0
            wrapper.backgroundColor = .cc_blueish
            stackScrollView.addArrangedView(wrapper, inset: UIEdgeInsets(top: 0.0, left: 0.0, bottom: bottomPadding, right: 0.0))
        }

        if let text = banner.popupText2 {
            let label = Label(.text)
            label.text = text

            stackScrollView.addArrangedView(label, inset: UIEdgeInsets(top: 0.0, left: 0.0, bottom: bottomPadding, right: 0.0))
        }

        if let urlText = banner.popupLinkText,
           let urlString = banner.popupLinkUrl,
           let url = URL(string: urlString) {
            let externalLink = ExternalLinkButton(title: urlText)
            externalLink.touchUpCallback = {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }

            let wrapper = UIView()

            wrapper.addSubview(externalLink)
            externalLink.snp.makeConstraints { make in
                make.top.bottom.left.equalToSuperview()
                make.right.lessThanOrEqualToSuperview()
            }

            stackScrollView.addArrangedView(wrapper, inset: UIEdgeInsets(top: 0.0, left: 0.0, bottom: bottomPadding, right: 0))
        }

        closeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismiss()
        }
    }
}
