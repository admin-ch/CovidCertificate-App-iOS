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

class ScannerLightButton: UBButton {
    // MARK: - Standard buttons

    public static func verifierButton() -> ScannerLightButton {
        return ScannerLightButton(offBackgroundColor: .cc_black, onBackgroundColor: .cc_white, offImageColor: .cc_white, onImageColor: .cc_black)
    }

    public static func walletButton() -> ScannerLightButton {
        return ScannerLightButton(offBackgroundColor: .cc_white, onBackgroundColor: .cc_blue, offImageColor: .cc_blue, onImageColor: .cc_white)
    }

    // MARK: - Properties

    private let onImage: UIImage?
    private let offImage: UIImage?
    private let offBackgroundColor: UIColor
    private let onBackgroundColor: UIColor

    public var isOn: Bool = false {
        didSet { update() }
    }

    // MARK: - Init

    init(offBackgroundColor: UIColor, onBackgroundColor: UIColor, offImageColor: UIColor, onImageColor: UIColor) {
        self.onBackgroundColor = onBackgroundColor
        self.offBackgroundColor = offBackgroundColor
        onImage = UIImage(named: "ic-light-on")?.ub_image(with: onImageColor)
        offImage = UIImage(named: "ic-light-off")?.ub_image(with: offImageColor)
        super.init()

        ub_addShadow(radius: 4.0, opacity: 0.2, xOffset: 0.0, yOffset: 0.0)
        update()

        snp.makeConstraints { make in
            make.size.equalTo(Padding.large * 2.0)
        }

        layer.cornerRadius = Padding.large
        highlightCornerRadius = Padding.large
    }

    // MARK: - Update

    private func update() {
        backgroundColor = isOn ? onBackgroundColor : offBackgroundColor
        setImage(isOn ? onImage : offImage, for: .normal)
        accessibilityLabel = isOn ? UBLocalized.accessibility_lamp_off_button : UBLocalized.accessibility_lamp_on_button
    }
}
