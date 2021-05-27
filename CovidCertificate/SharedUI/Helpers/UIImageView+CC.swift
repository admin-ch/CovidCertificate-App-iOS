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

public extension UIImageView {
    func setQrCode(_ qrCode: String) {
        image = QRCodeUtils.createQrCodeImage(from: qrCode)
        layer.magnificationFilter = .nearest
    }

    func rotate(time: Double) {
        layer.removeAllAnimations()
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2.0
        rotationAnimation.duration = time
        rotationAnimation.repeatCount = .infinity
        layer.add(rotationAnimation, forKey: nil)
    }
}

extension UIImageView {
    static func centered(with image: UIImage?) -> UIView {
        let i = UIView()

        let imageView = UIImageView(image: image)
        i.addSubview(imageView)
        imageView.ub_setContentPriorityRequired()

        imageView.snp.makeConstraints { make in
            make.top.bottom.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().priority(.medium)
            make.right.lessThanOrEqualToSuperview().priority(.medium)
        }

        return i
    }
}
