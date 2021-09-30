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

class ExternalLinkButton: UBButton {
    // MARK: - Init

    enum Mode { case link, phone }

    init(title: String, mode: Mode = .link, tintColor: UIColor = .cc_blue) {
        super.init()

        self.title = title

        backgroundColor = .clear
        highlightedBackgroundColor = UIColor.cc_blue.withAlphaComponent(0.15)

        highlightXInset = -2.0 * Padding.small
        highlightYInset = -Padding.small
        highlightCornerRadius = -Padding.small

        setTitleColor(tintColor, for: .normal)
        titleLabel?.font = LabelType.textBold.font
        titleLabel?.textAlignment = .left

        switch mode {
        case .link:
            setImage(UIImage(named: "ic-link-external")?.ub_image(with: tintColor), for: .normal)
        case .phone:
            setImage(UIImage(named: "ic-call")?.ub_image(with: tintColor), for: .normal)
        }

        imageView?.contentMode = .scaleAspectFit

        imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: Padding.small)
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: Padding.small, bottom: 0.0, right: 0.0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        highlightCornerRadius = frame.size.height * 0.5 + 3.0
    }

    // MARK: - Fix content size

    override public var intrinsicContentSize: CGSize {
        guard !(title?.isEmpty ?? true) else { return .zero }
        var size = titleLabel?.intrinsicContentSize ?? super.intrinsicContentSize
        size.width = size.width + titleEdgeInsets.left + titleEdgeInsets.right + 30.0
        size.height = size.height + titleEdgeInsets.top + titleEdgeInsets.bottom
        return size
    }
}

class SimpleTextButton: UBButton {
    private let color: UIColor

    // MARK: - Init

    init(title: String, color: UIColor) {
        self.color = color
        super.init()

        self.title = title

        backgroundColor = .clear
        highlightedBackgroundColor = color.withAlphaComponent(0.15)

        highlightXInset = -Padding.medium
        highlightYInset = -3.0
        highlightCornerRadius = 3.0

        setTitleColor(color, for: .normal)
        titleLabel?.font = LabelType.text.font
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        highlightCornerRadius = frame.size.height * 0.5 + 3.0
    }
}
