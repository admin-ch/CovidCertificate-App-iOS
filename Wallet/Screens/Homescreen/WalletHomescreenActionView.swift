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

class WalletHomescreenActionView: UIView {
    // MARK: - API

    public var addCertificateTouchUpCallback: (() -> Void)?
    public var addTransferCodeTouchUpCallback: (() -> Void)?

    // MARK: - Subviews

    private let stackView = UIStackView()

    private let addCertificateButton = AddCertificateButton()
    private let addTransferCodeButton = AddTransferCodeButton()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
        setupInteraction()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.axis = .vertical
        stackView.spacing = 2.0 * Padding.small

        stackView.addArrangedView(addCertificateButton)
        stackView.addArrangedView(addTransferCodeButton)
    }

    private func setupInteraction() {
        addCertificateButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addCertificateTouchUpCallback?()
        }

        addTransferCodeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addTransferCodeTouchUpCallback?()
        }
    }
}

class AddCertificateButton: UBButton {
    // MARK: - Subviews

    private let topLabel = Label(.textBoldLarge)
    private let illuImageView = UIImageView(image: UIImage(named: "illu-add-certificate"))
    private let textLabel = Label(.text)

    // MARK: - Init

    override init() {
        super.init()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        highlightedBackgroundColor = UIColor.cc_touchState
        backgroundColor = UIColor.cc_white
        layer.cornerRadius = 20
        highlightCornerRadius = 20
        ub_addShadow(radius: 10.0, opacity: 0.2, xOffset: 0.0, yOffset: 0.0)

        topLabel.text = UBLocalized.wallet_homescreen_add_title
        textLabel.text = UBLocalized.wallet_homescreen_explanation

        let lr = Padding.small + Padding.medium
        let tb = Padding.medium

        addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(UIEdgeInsets(top: tb, left: lr, bottom: tb, right: lr))
        }

        let lineView = UIView()
        lineView.backgroundColor = UIColor.cc_blueish

        addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(self.topLabel.snp.bottom).offset(tb)
            make.left.right.equalToSuperview()
            make.height.equalTo(1.0)
        }

        addSubview(illuImageView)
        illuImageView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(tb - 3.0)
            make.left.equalToSuperview().inset(lr)
            make.bottom.lessThanOrEqualToSuperview().inset(2.0 * Padding.medium + Padding.small)
        }

        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(Padding.medium + 2.0)
            make.left.equalTo(self.illuImageView.snp.right).offset(lr)
            make.right.equalToSuperview().inset(lr)
            make.bottom.lessThanOrEqualToSuperview().inset(2.0 * Padding.medium)
        }
    }
}

class AddTransferCodeButton: UBButton {
    // MARK: - Subviews

    private let topLabel = Label(.textBoldLarge)

    // MARK: - Init

    override init() {
        super.init()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        highlightedBackgroundColor = UIColor.cc_touchState
        backgroundColor = UIColor.cc_white
        layer.cornerRadius = 20
        highlightCornerRadius = 20
        ub_addShadow(radius: 10.0, opacity: 0.2, xOffset: 0.0, yOffset: 0.0)

        topLabel.text = UBLocalized.wallet_homescreen_add_transfer_code
        addSubview(topLabel)

        let lr = Padding.small + Padding.medium
        let tb = Padding.medium

        topLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: tb, left: lr, bottom: tb, right: lr))
        }
    }
}
