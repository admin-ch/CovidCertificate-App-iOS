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

class LeadingTrailingIconButton: UBButton {
    // MARK: Views

    private let leadingImageView = UIImageView()
    private let trailingImageView = UIImageView()
    private let textLabel = Label(.textBold, textColor: .cc_blue)

    // MARK: Init

    init(text: String, leadingIcon: UIImage, trailingIcon: UIImage) {
        super.init()

        textLabel.text = text
        leadingImageView.image = leadingIcon
        trailingImageView.image = trailingIcon

        highlightedBackgroundColor = UIColor.cc_blue.withAlphaComponent(0.15)

        layer.cornerRadius = 22
        layer.borderColor = UIColor.cc_blue.cgColor
        layer.borderWidth = 1.5

        addSubview(leadingImageView)
        addSubview(textLabel)
        addSubview(trailingImageView)

        leadingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.centerY.equalToSuperview()
        }
        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.leadingImageView.snp.trailing).offset(4)
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.centerY.equalToSuperview()
        }

        trailingImageView.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(self.textLabel.snp.trailing).offset(10)
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.trailing.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }

        snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(44)
        }
    }
}
