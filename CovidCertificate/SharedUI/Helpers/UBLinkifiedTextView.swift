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

/// Creates a view with styled, tappable links which detected via RegEx
/// and static behaviour of UILabel.
final class UBLinkifiedTextView: UITextView, UITextViewDelegate {
    // MARK: - Initialization

    public let label = Label(.text)

    init() {
        super.init(frame: .zero, textContainer: nil)

        isEditable = false
        isScrollEnabled = false
        textAlignment = .natural
        backgroundColor = .clear
        label.isHtmlContent = true

        // Link style needs to be set as UITextView properties
        linkTextAttributes = [
            .foregroundColor: UIColor.cc_blue,
            .font: LabelType.text.font,
        ]

        font = LabelType.text.font

        delegate = self

        fixInset()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override default TextView behaviours

    override func gestureRecognizerShouldBegin(_ gesture: UIGestureRecognizer) -> Bool {
        guard !(gesture is UIPanGestureRecognizer) else {
            return true
        }

        let tapLocation = gesture.location(in: self).applying(CGAffineTransform(translationX: -textContainerInset.left, y: -textContainerInset.top))
        let characterAtIndex = layoutManager.characterIndex(for: tapLocation, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        let linkAttributeAtIndex = textStorage.attribute(.link, at: characterAtIndex, effectiveRange: nil)

        // Returns true for gestures located on linked text
        return linkAttributeAtIndex != nil
    }

    override func becomeFirstResponder() -> Bool {
        // Returning false disables double-tap selection of link text
        return false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        fixInset()
    }

    private func fixInset() {
        // Fixes inset (see: https://stackoverflow.com/questions/746670/how-to-lose-margin-padding-in-uitextview)
        textContainerInset = .zero
        textContainer.lineFragmentPadding = 0
    }

    // MARK: - Configuring the Text Attributes

    override var text: String! {
        didSet {
            label.text = text

            if let astr = label.attributedText {
                let type = LabelType.text
                let mt = NSMutableAttributedString(attributedString: astr)
                mt.ub_replaceFonts(with: LabelType.text.font, useHtmlTraits: false)

                // fix line height
                let strLength = astr.length
                let style = NSMutableParagraphStyle()

                let lineSpacing = type.lineSpacing
                let lineHeightMultiple = (type.font.pointSize / type.font.lineHeight) * lineSpacing

                style.lineSpacing = lineHeightMultiple * type.font.lineHeight - type.font.lineHeight

                mt.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: strLength))

                attributedText = mt
            }
        }
    }
}

// MARK: - Link detection with custom RegEx

extension RangeExpression where Bound == String.Index {
    func nsRange<S: StringProtocol>(in string: S) -> NSRange {
        .init(self, in: string)
    }
}
