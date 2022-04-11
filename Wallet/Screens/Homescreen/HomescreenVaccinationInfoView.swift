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

class HomescreenVaccinationInfoView: UIView {
    public var dismissButtonTouchUpCallback: (() -> Void)?
    public var vaccinationButtonTouchUpCallback: (() -> Void)? {
        didSet {
            container.action = vaccinationButtonTouchUpCallback
        }
    }

    private let insets = UIEdgeInsets(top: 13, left: 13, bottom: 17, right: 10)

    private var container = AccessibilityContainer()
    private let titleLabel = Label(.textBoldLarge, textAlignment: .left)
    private let textLabel = Label(.text, textAlignment: .left)

    private let vaccinationButton = TitleIconButton(text: UBLocalized.vaccination_homescreen_button_title, icon: UIImage(named: "ic-arrow")!.ub_image(with: .cc_blue))
    private let dismissButton = Button(image: UIImage(named: "ic-close")?.ub_image(with: .black), accessibilityKey: .accessibility_close_button)

    init(title: String?, text: String?) {
        super.init(frame: .zero)

        titleLabel.text = title
        textLabel.text = text

        setup()
        setupInteraction()
        setupAccessibility()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(textLabel)
        container.addSubview(vaccinationButton)
        container.addSubview(dismissButton)

        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(insets)
            make.top.equalToSuperview().inset(insets)
            make.trailing.lessThanOrEqualTo(dismissButton.snp.leading).offset(-Padding.small)
        }

        textLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(insets)
            make.top.equalTo(titleLabel.snp.bottom).offset(Padding.small)
        }

        vaccinationButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(insets)
            make.trailing.lessThanOrEqualToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(Padding.medium)
            make.bottom.equalToSuperview().inset(insets)
        }

        dismissButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }

        backgroundColor = .cc_yellow
        layer.cornerRadius = 10
        clipsToBounds = true
    }

    private func setupInteraction() {
        dismissButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            // callbacks
            strongSelf.dismissButtonTouchUpCallback?()
        }

        vaccinationButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            // callbacks
            strongSelf.vaccinationButtonTouchUpCallback?()
        }
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if vaccinationButton.frame.contains(point) {
            return vaccinationButton
        }

        if dismissButton.frame.contains(point) {
            return dismissButton
        }

        return super.hitTest(point, with: event)
    }

    private func setupAccessibility() {
        container.isAccessibilityElement = true
        dismissButton.isAccessibilityElement = true

        container.accessibilityLabel = [titleLabel.text, textLabel.text, vaccinationButton.titleText].compactMap { $0 }.joined(separator: ", ")
        container.accessibilityTraits = .button

        accessibilityElements = [container, dismissButton]
        isAccessibilityElement = false
    }
}

class AccessibilityContainer: UIView {
    public var action: (() -> Void)?

    override func accessibilityActivate() -> Bool {
        action?()
        return true
    }
}

class TitleIconButton: UBButton {
    // MARK: - Subviews

    public var titleText: String? {
        get {
            return textLabel.text
        }
        set {
            textLabel.text = newValue
        }
    }

    private let textLabel: Label
    private let iconView = UIImageView()

    // MARK: - Init

    init(text: String?, icon: UIImage?, labelType: LabelType = .textBoldLarge, textColor: UIColor = .cc_blue) {
        textLabel = Label(labelType, textColor: textColor)
        super.init()

        titleText = text
        iconView.image = icon

        highlightedBackgroundColor = UIColor.cc_blue.withAlphaComponent(0.15)

        highlightXInset = -2.0 * Padding.small
        highlightYInset = -Padding.small
        highlightCornerRadius = -Padding.small

        setup()
    }

    // MARK: - Setup

    private func setup() {
        addSubview(textLabel)
        textLabel.textAlignment = .left
        textLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.centerY.equalToSuperview()
        }

        addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.leading.equalTo(textLabel.snp.trailing).offset(3)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        iconView.setContentCompressionResistancePriority(.required, for: .horizontal)

        accessibilityLabel = textLabel.text
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        highlightCornerRadius = frame.size.height * 0.5 + 3.0
    }
}
