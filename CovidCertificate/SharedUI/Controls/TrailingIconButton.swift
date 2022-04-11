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

class TrailingIconButton: Button {
    init(titleKey: UBLocalized.Key, icon: UIImage?) {
        super.init(titleKey: titleKey)

        setImage(icon, for: .normal)
    }

    init(title: String, icon: UIImage?) {
        super.init(titleKey: nil)

        self.title = title

        setImage(icon, for: .normal)
    }

    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image, for: state)
        invalidateIntrinsicContentSize()
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize

        contentSize.height = max(contentSize.height, 56)

        if let img = imageView?.image {
            contentSize.width += 2 * (img.size.width + 20)
        } else {
            contentSize.width += 2 * Padding.large
        }

        return contentSize
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if let img = imageView?.image, let titleLabel = titleLabel {
            let titleLabelWidth = titleLabel.sizeThatFits(CGSize(width: bounds.width - 2 * 20 - img.size.width, height: bounds.height)).width
            let contentWidth = (img.size.width + titleLabelWidth) / 2
            let offset = contentWidth + bounds.width / 2 - img.size.width - 20
            imageEdgeInsets = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: -offset)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -img.size.width / 2, bottom: 0, right: img.size.width / 2)
        }
    }
}
