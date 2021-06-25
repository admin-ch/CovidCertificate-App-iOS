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

class TransferCodeAnimationView: UIView {
    public let phoneAnimationView = UIImageView()
    public let ringAnimationView = UIImageView()

    private var timer: Timer?
    private var animationCounter = 0

    init() {
        super.init(frame: .zero)
        setupImageAnimationViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupImageAnimationViews() {
        addSubview(ringAnimationView)

        ringAnimationView.loadAnimation(pattern: "210616_wait_for_transfer_animation_ripple_only_00000", numberOfImages: 17)
        ringAnimationView.startAnimating()

        timer = Timer.scheduledTimer(withTimeInterval: 1.0 * 17.0 / 24.0, repeats: true, block: { _ in
            self.animationCounter = self.animationCounter + 1

            if self.animationCounter % 8 == 0 {
                self.ringAnimationView.startAnimating()
                self.animationCounter = 0
            } else {
                self.ringAnimationView.stopAnimating()
            }
        })

        timer?.fire()

        addSubview(phoneAnimationView)

        phoneAnimationView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }

        ringAnimationView.snp.makeConstraints { make in
            make.edges.equalTo(phoneAnimationView)
        }

        phoneAnimationView.loadAnimation(pattern: "210616_wait_for_transfer_phone_only_00000", numberOfImages: 71)
        phoneAnimationView.startAnimating()

        phoneAnimationView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        phoneAnimationView.setContentHuggingPriority(.defaultLow, for: .vertical)
        phoneAnimationView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        phoneAnimationView.setContentHuggingPriority(.defaultLow, for: .horizontal)

        ringAnimationView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        ringAnimationView.setContentHuggingPriority(.defaultLow, for: .vertical)
        ringAnimationView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        ringAnimationView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}

public extension UIImageView {
    func loadAnimation(pattern: String, numberOfImages: Int) {
        var images: [UIImage] = []
        for i in 0 ..< numberOfImages {
            var number = "\(i)"
            while number.count < 5 {
                number = "0\(number)"
            }

            let name = pattern.replacingOccurrences(of: "00000", with: number)

            if let img = UIImage(named: name) {
                images.append(img)
            }
        }

        animationImages = images
        contentMode = .scaleAspectFit
        animationDuration = Double(numberOfImages) * (1.0 / 24.0)
    }
}
