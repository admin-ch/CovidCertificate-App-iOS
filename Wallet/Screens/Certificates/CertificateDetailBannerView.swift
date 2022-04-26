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

class CertificateDetailBannerContent {
    init(title: String, text: String, buttonText: String) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
    }

    public let title: String
    public let text: String
    public let buttonText: String
}

class CertificateDetailBannerView: UIView {
    public var moreInfoTouchUpCallback: (() -> Void)? {
        didSet {
            container.action = moreInfoTouchUpCallback
        }
    }

    private let insets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 10)

    private var container = AccessibilityContainer()
    private let titleLabel = Label(.textBoldLarge, textAlignment: .left)
    private let textLabel = Label(.text, textAlignment: .left)

    let moreInfoButton = TitleIconButton(text: "",
                                         icon: UIImage(named: "ic-arrow")!.ub_image(with: .cc_text),
                                         labelType: .textBold,
                                         textColor: .cc_text)

    var banner: ConfigResponseBody.EOLBannerInfo? {
        didSet { update() }
    }

    var bannerContent: CertificateDetailBannerContent? {
        didSet { update() }
    }

    init() {
        super.init(frame: .zero)

        setup()
        setupInteraction()
        setupAccessibility()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func update() {
        if let banner = banner {
            titleLabel.text = banner.detailTitle
            textLabel.text = banner.detailText
            moreInfoButton.titleText = banner.detailMoreInfo
            backgroundColor = UIColor(ub_hexString: banner.detailHexColor) ?? UIColor.cc_yellow
        }

        if let content = bannerContent {
            titleLabel.text = content.title
            textLabel.text = content.text
            moreInfoButton.titleText = content.buttonText
            backgroundColor = UIColor.cc_blueish
        }

        container.accessibilityLabel = [titleLabel.text, textLabel.text, moreInfoButton.titleText].compactMap { $0 }.joined(separator: ", ")
    }

    private func setup() {
        addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(textLabel)
        container.addSubview(moreInfoButton)

        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(insets)
            make.top.equalToSuperview().inset(insets)
        }

        textLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(insets)
            make.top.equalTo(titleLabel.snp.bottom).offset(Padding.small)
        }

        moreInfoButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(insets)
            make.trailing.lessThanOrEqualToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(Padding.medium)
            make.bottom.equalToSuperview().inset(insets)
        }

        layer.cornerRadius = 10
        clipsToBounds = true
    }

    private func setupInteraction() {
        moreInfoButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            // callbacks
            strongSelf.moreInfoTouchUpCallback?()
        }
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if moreInfoButton.frame.contains(point) {
            return moreInfoButton
        }

        return super.hitTest(point, with: event)
    }

    private func setupAccessibility() {
        container.isAccessibilityElement = true

        container.accessibilityLabel = [titleLabel.text, textLabel.text, moreInfoButton.titleText].compactMap { $0 }.joined(separator: ", ")
        container.accessibilityTraits = .button

        accessibilityElements = [container, moreInfoButton]
        isAccessibilityElement = false
    }
}
