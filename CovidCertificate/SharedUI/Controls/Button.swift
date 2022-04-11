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

class Button: UBButton {
    enum Style {
        case normal(UIColor)
        case text(UIColor)

        var textColor: UIColor {
            switch self {
            case .normal:
                return UIColor.white
            case let .text(c):
                return c
            }
        }

        var backgroundColor: UIColor {
            switch self {
            case let .normal(c):
                return c
            case .text:
                return .clear
            }
        }

        var highlightedColor: UIColor {
            return UIColor.black.withAlphaComponent(0.2)
        }

        var isUppercase: Bool {
            return true
        }
    }

    var style: Style {
        didSet {
            setTitleColor(style.textColor, for: .normal)
            backgroundColor = style.backgroundColor
        }
    }

    private let customTextColor: UIColor?
    private var useCircle = false

    // MARK: - Init

    init(image: UIImage?, accessibilityKey: UBLocalized.Key, useCircle: Bool = true, highlightCornerRadius: CGFloat = 3.0) {
        self.useCircle = useCircle
        style = .normal(.clear)
        customTextColor = nil
        super.init()
        setImage(image, for: .normal)
        highlightedBackgroundColor = UIColor.black.withAlphaComponent(0.2)

        accessibilityLabel = UBLocalized.translate(accessibilityKey)
        accessibilityIdentifier = accessibilityKey.rawValue
        highlightXInset = -Padding.small
        highlightYInset = -Padding.small

        if !self.useCircle {
            self.highlightCornerRadius = highlightCornerRadius
        }

        snp.makeConstraints { make in
            if useCircle {
                make.height.equalTo(self.snp.width)
            }
            make.height.greaterThanOrEqualTo(44.0)
        }
    }

    init(titleKey: UBLocalized.Key?, style: Style = .normal(UIColor.cc_blue), customTextColor: UIColor? = nil) {
        self.style = style
        self.customTextColor = customTextColor

        super.init()

        let titleString = titleKey != nil ? UBLocalized.translate(titleKey!) : nil

        accessibilityIdentifier = titleKey?.rawValue

        let t = style.isUppercase ? (titleString?.uppercased() ?? "") : (titleString ?? "")

        let attributedString = NSAttributedString(string: t, attributes: [NSAttributedString.Key.kern: LabelType.button.letterSpacing ?? 0.0, NSAttributedString.Key.font: LabelType.button.font, NSAttributedString.Key.foregroundColor: customTextColor ?? style.textColor])

        setAttributedTitle(attributedString, for: .normal)

        let disabledColor = UIColor.setColorsForTheme(lightColor: style.textColor, darkColor: style.textColor.withAlphaComponent(0.15))
        setTitleColor(disabledColor, for: .disabled)

        backgroundColor = style.backgroundColor
        highlightedBackgroundColor = style.highlightedColor

        // Size
        let s: CGFloat = 56.0

        highlightCornerRadius = s * 0.5
        layer.cornerRadius = s * 0.5
        contentEdgeInsets = UIEdgeInsets(top: Padding.medium, left: Padding.large, bottom: Padding.medium, right: Padding.large)

        titleLabel?.numberOfLines = 2

        snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(s)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if currentImage != nil, useCircle {
            highlightCornerRadius = frame.size.height * 0.5 + Padding.small
        }
    }

    override var titleKey: UBLocalized.Key? {
        didSet {
            let titleString = titleKey != nil ? UBLocalized.translate(titleKey!) : nil
            self.title = titleString
            accessibilityIdentifier = titleKey?.rawValue
        }
    }

    override var title: String? {
        didSet {
            let t = style.isUppercase ? (title?.uppercased() ?? "") : (title ?? "")

            let attributedString = NSAttributedString(string: t, attributes: [NSAttributedString.Key.kern: LabelType.button.letterSpacing ?? 0.0, NSAttributedString.Key.font: LabelType.button.font, NSAttributedString.Key.foregroundColor: customTextColor ?? style.textColor])

            setAttributedTitle(attributedString, for: .normal)
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
            titleLabel?.font = LabelType.button.font
        }
    }
}
