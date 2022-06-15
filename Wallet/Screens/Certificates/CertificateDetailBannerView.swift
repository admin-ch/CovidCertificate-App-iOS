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

    public var dismissButtonTouchUpCallback: (() -> Void)? {
        didSet {
            dismissButton.touchUpCallback = dismissButtonTouchUpCallback
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

    private let dismissButton = Button(image: UIImage(named: "ic-close")?.ub_image(with: .black), accessibilityKey: .accessibility_close_button)

    enum State {
        case eol(ConfigResponseBody.EOLBannerInfo)
        case rat(CertificateDetailBannerContent)
        case renew(CertificateDetailBannerContent)
        case wasRenewed(CertificateDetailBannerContent, uvci: String)
    }

    var state: State? {
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
        switch state {
        case let .eol(banner):
            titleLabel.text = banner.detailTitle
            textLabel.text = banner.detailText
            moreInfoButton.titleText = banner.detailMoreInfo
            backgroundColor = UIColor(ub_hexString: banner.detailHexColor) ?? UIColor.cc_yellow
            dismissButton.isHidden = true
        case let .rat(content):
            titleLabel.text = content.title
            textLabel.text = content.text
            moreInfoButton.titleText = content.buttonText
            backgroundColor = UIColor.cc_blueish
            dismissButton.isHidden = true
        case let .renew(content):
            titleLabel.text = content.title
            textLabel.text = content.text
            moreInfoButton.titleText = content.buttonText
            backgroundColor = UIColor.cc_redish
            dismissButton.isHidden = true
        case let .wasRenewed(content, _):
            titleLabel.text = content.title
            textLabel.text = content.text
            moreInfoButton.titleText = content.buttonText
            backgroundColor = UIColor.cc_greenish
            dismissButton.isHidden = false
        default:
            break
        }

        container.accessibilityLabel = [titleLabel.text, textLabel.text, moreInfoButton.titleText].compactMap { $0 }.joined(separator: ", ")
    }

    private func setup() {
        addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(textLabel)
        container.addSubview(moreInfoButton)
        container.addSubview(dismissButton)

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

        dismissButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
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
        dismissButton.isAccessibilityElement = !dismissButton.isHidden

        container.accessibilityLabel = [titleLabel.text, textLabel.text, moreInfoButton.titleText].compactMap { $0 }.joined(separator: ", ")
        container.accessibilityTraits = .button

        accessibilityElements = [container, moreInfoButton] + (dismissButton.isHidden ? [] : [dismissButton])
        isAccessibilityElement = false
    }
}
