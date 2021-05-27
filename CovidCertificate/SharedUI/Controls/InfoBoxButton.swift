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

class InfoBoxButton: UBButton {
    // MARK: - Properties

    private let onImage = UIImage(named: "ic-notification-filled")
    private let offImage = UIImage(named: "ic-notification")
    private let offBackgroundColor = UIColor.cc_black.withAlphaComponent(0.5)
    private let onBackgroundColor: UIColor = .clear

    public var isOn: Bool = true {
        didSet { update() }
    }

    // MARK: - Init

    override init() {
        super.init()

        update()

        snp.makeConstraints { make in
            make.size.equalTo(Padding.large * 2.0)
        }

        layer.cornerRadius = Padding.large
        highlightCornerRadius = Padding.large

        accessibilityLabel = UBLocalized.accessibility_info_box
    }

    // MARK: - Update

    private func update() {
        backgroundColor = isOn ? onBackgroundColor : offBackgroundColor
        setImage(isOn ? onImage : offImage, for: .normal)
    }
}
