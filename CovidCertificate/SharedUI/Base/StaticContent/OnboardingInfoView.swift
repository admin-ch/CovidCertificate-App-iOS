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

class OnboardingInfoView: UIView {
    public let label = Label(.text)

    private let leftRightInset: CGFloat

    init(icon: UIImage?, text: String, alignment: NSTextAlignment, leftRightInset: CGFloat = 2 * Padding.medium, height: CGFloat? = nil, width: CGFloat? = nil, imageAccessibilityText: String? = nil) {
        self.leftRightInset = leftRightInset

        super.init(frame: .zero)

        label.text = text
        label.textAlignment = alignment

        addSubview(label)

        let imgView = UIImageView(image: icon)
        imgView.contentMode = .center
        imgView.ub_setContentPriorityRequired()

        if icon != nil {
            addSubview(imgView)
            imgView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().inset(leftRightInset)

                if let h = height,
                   let w = width {
                    make.height.equalTo(h)
                    make.width.equalTo(w)
                }
            }
        }

        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(Padding.medium + Padding.small)
            if icon != nil {
                make.leading.equalTo(imgView.snp.trailing).offset(Padding.medium + Padding.small)
            } else {
                make.leading.equalToSuperview().inset(leftRightInset)
            }
            make.trailing.equalToSuperview().inset(leftRightInset)
        }

        isAccessibilityElement = true
        accessibilityLabel = [imageAccessibilityText, text].compactMap { $0 }.joined(separator: ",")
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
