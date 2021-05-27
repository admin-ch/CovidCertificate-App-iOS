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

class CertificateAlreadyAddedView: UIView {
    // MARK: - Subviews

    private let roundBackgroundView = UIView()
    private let roundImageBackgroundView = UIView()
    private let imageView = UIImageView(image: UIImage(named: "ic-info-filled"))
    private let textLabel = Label(.text, textAlignment: .center)

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()

        isAccessibilityElement = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        addSubview(roundBackgroundView)
        addSubview(roundImageBackgroundView)
        addSubview(imageView)
        addSubview(textLabel)

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerY.equalTo(self.roundBackgroundView.snp.top)
            make.centerX.equalToSuperview()
        }

        roundImageBackgroundView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(32.0)
        }
        roundImageBackgroundView.backgroundColor = .cc_white

        roundBackgroundView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(self.roundBackgroundView).inset(Padding.medium + 3.0)
            make.left.bottom.right.equalTo(self.roundBackgroundView).inset(Padding.medium)
        }

        roundBackgroundView.backgroundColor = .cc_greyBackground
        roundBackgroundView.layer.cornerRadius = 11.0

        textLabel.text = UBLocalized.wallet_certificate_already_exists
        accessibilityLabel = textLabel.text
        roundBackgroundView.backgroundColor = .cc_white

        roundBackgroundView.ub_addShadow(radius: 20.0, opacity: 0.17, xOffset: 0.0, yOffset: 2.0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundImageBackgroundView.layer.cornerRadius = roundImageBackgroundView.frame.size.height * 0.5
    }
}
