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

    init(icon: UIImage?, text: String, alignment: NSTextAlignment, leftRightInset: CGFloat = 2 * Padding.medium) {
        self.leftRightInset = leftRightInset

        super.init(frame: .zero)

        label.text = text
        label.textAlignment = alignment

        addSubview(label)

        let imgView = UIImageView(image: icon)
        imgView.ub_setContentPriorityRequired()

        if icon != nil {
            addSubview(imgView)
            imgView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(Padding.medium)
                make.leading.equalToSuperview().inset(leftRightInset)
            }
        }

        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Padding.medium)
            if icon != nil {
                make.leading.equalTo(imgView.snp.trailing).offset(Padding.medium + Padding.small)
            } else {
                make.leading.equalToSuperview().inset(leftRightInset)
            }
            make.trailing.equalToSuperview().inset(leftRightInset)
        }

        accessibilityLabel = text
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
