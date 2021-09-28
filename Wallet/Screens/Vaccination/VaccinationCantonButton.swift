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
import UIKit

class VaccinationCantonButton: UBButton {
    // MARK: - Subviews

    private let textLabel = Label(.textBoldLarge)
    private let icon = UIImageView()
    private let externalLinkIcon = UIImageView()

    // MARK: - Init

    init(text: String?, iconName: String) {
        super.init()

        textLabel.text = text
        icon.image = UIImage(named: iconName)
        externalLinkIcon.image = UIImage(named: "ic-link-external")?.ub_image(with: .cc_blue)
        setup()
    }

    // MARK: - Setup

    private func setup() {
        highlightedBackgroundColor = UIColor.cc_touchState

        icon.contentMode = .scaleAspectFit
        icon.layer.borderColor = UIColor(ub_hexString: "#e7e6e5")!.cgColor
        icon.layer.borderWidth = 1.2

        addSubview(icon)
        icon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.centerY.equalToSuperview()
        }

        textLabel.textColor = .cc_blue

        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(icon.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
        }

        addSubview(externalLinkIcon)
        externalLinkIcon.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.greaterThanOrEqualTo(textLabel.snp.trailing).offset(Padding.small)
            make.centerY.equalToSuperview()
        }

        accessibilityLabel = textLabel.text

        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }
}
