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

class RoundBackgroundView: UIView {
    // MARK: - Subviews

    let circleLayer = CAShapeLayer()
    let down: Bool

    public var offset: CGPoint = .zero {
        didSet { circleLayer.transform = CATransform3DMakeTranslation(offset.x, offset.y, 0.0) }
    }

    // MARK: - Init

    init(backgroundColor: UIColor, down: Bool) {
        self.down = down
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        circleLayer.fillColor = UIColor.cc_white.cgColor

        layer.addSublayer(circleLayer)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Update

    public func updatePath() {
        var rect: CGRect = .zero
        let w = (frame.width * 0.5)
        let factor: CGFloat = 18.0 / 376.0

        let drop: CGFloat = w * factor
        let r = (drop * drop + w * w) / (2 * drop)

        if down {
            rect = CGRect(x: -r / 2.0 + frame.width * 0.5, y: -r + 2 * drop, width: r, height: r)
        } else {
            rect = CGRect(x: -r / 2.0 + frame.width * 0.5, y: -2 * drop, width: r, height: r)
        }

        circleLayer.path = UIBezierPath(ovalIn: rect).cgPath
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let t = super.hitTest(point, with: event)

        // allow buttons to be on the round edge to be captured
        for v in subviews.filter({ $0 is UIButton }) {
            let translatedPoint = v.convert(point, from: self)

            if v.bounds.contains(translatedPoint) {
                return v.hitTest(translatedPoint, with: event)
            }
        }

        return t
    }
}
