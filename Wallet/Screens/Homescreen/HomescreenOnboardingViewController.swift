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

class HomescreenOnboardingViewController: ViewController {
    // MARK: - Touch Up Callback

    public var addTouchUpCallback: (() -> Void)?

    // MARK: - Subviews

    private let stackScrollView = StackScrollView(axis: .vertical)

    private let titleLabel = Label(.uppercaseBold, textColor: .white, textAlignment: .center)
    private var explanationLabel = Label(.textLarge, textColor: .white, textAlignment: .center)
    private let button = Button(title: UBLocalized.wallet_add_certificate, style: .normal(.white), customTextColor: .cc_blue)

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        button.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addTouchUpCallback?()
        }
    }

    // MARK: - Setup

    private func setupViews() {
        let isSmall = view.frame.size.width <= 375
        let isUltraSmall = view.frame.size.width <= 320

        if isUltraSmall {
            explanationLabel = Label(.text, textColor: .white, textAlignment: .center)
        }

        view.backgroundColor = UIColor.clear
        view.addSubview(stackScrollView)

        stackScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackScrollView.scrollView.alwaysBounceVertical = false
        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.large + Padding.small
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)

        stackScrollView.addSpacerView(Padding.large)
        stackScrollView.addArrangedView(titleLabel)
        stackScrollView.addSpacerView(Padding.large)

        var image = UIImage(named: "wallet-illu-home-empty")

        if isUltraSmall || isSmall {
            image = image?.ub_image(byScaling: isUltraSmall ? 0.45 : 0.7)
        }

        let imageView = UIImageView.centered(with: image)
        stackScrollView.addArrangedView(imageView)

        stackScrollView.addSpacerView(isUltraSmall ? Padding.medium : Padding.large + Padding.medium)
        stackScrollView.addArrangedView(explanationLabel)

        stackScrollView.addSpacerView(isUltraSmall ? Padding.large : 2.5 * Padding.large)
        stackScrollView.addArrangedViewCentered(button)

        titleLabel.text = UBLocalized.wallet_certificate
        explanationLabel.text = UBLocalized.wallet_homescreen_explanation
    }
}
