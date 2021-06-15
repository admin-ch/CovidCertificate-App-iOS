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

    public var addCertificateTouchUpCallback: (() -> Void)?
    public var addTransferCodeTouchUpCallback: (() -> Void)?

    // MARK: - Subviews

    private let stackScrollView = StackScrollView(axis: .vertical)

    private let titleLabel = Label(.uppercaseBold, textColor: .white, textAlignment: .center)
    private let questionLabel = Label(.title, textColor: .white, textAlignment: .center)
    private let homescreenButtons = WalletHomescreenActionView()

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        homescreenButtons.addCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addCertificateTouchUpCallback?()
        }

        homescreenButtons.addTransferCodeTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addTransferCodeTouchUpCallback?()
        }
    }

    // MARK: - Setup

    private func setupViews() {
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
        stackScrollView.addSpacerView(Padding.large + Padding.medium)

        stackScrollView.addArrangedView(questionLabel)
        stackScrollView.addSpacerView(Padding.medium + Padding.small)

        stackScrollView.addArrangedView(homescreenButtons)

        titleLabel.text = UBLocalized.wallet_certificate
        questionLabel.text = UBLocalized.wallet_homescreen_what_to_do
    }
}
