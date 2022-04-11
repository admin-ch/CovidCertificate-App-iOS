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

    public var addQRCertificateTouchUpCallback: (() -> Void)?
    public var addPDFCertificateTouchUpCallback: (() -> Void)?
    public var addTransferCodeTouchUpCallback: (() -> Void)?
    public var showVaccinationAppointmentInformationTouchUpCallback: (() -> Void)?

    public var isVaccinationButtonHidden: Bool = true {
        didSet {
            showVaccinationAppointmentInformationButton.ub_setHidden(isVaccinationButtonHidden)
        }
    }

    // MARK: - Subviews

    private let stackView = UIStackView()

    private let addCertificateView = AddCertificateView()
    private let addTransferCodeButton = RoundedButton(titleKey: .wallet_homescreen_add_transfer_code)
    private lazy var showVaccinationAppointmentInformationButton = RoundedButton(titleKey: .vaccination_homescreen_button_title)

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

        stackView.addArrangedView(addCertificateView)
        stackView.addArrangedView(addTransferCodeButton)

        stackView.addArrangedView(showVaccinationAppointmentInformationButton)
        showVaccinationAppointmentInformationButton.ub_setHidden(isVaccinationButtonHidden)
    }

    private func setupInteraction() {
        addCertificateView.addQRCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addQRCertificateTouchUpCallback?()
        }

        addCertificateView.addPDFCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addPDFCertificateTouchUpCallback?()
        }

        addTransferCodeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addTransferCodeTouchUpCallback?()
        }

        showVaccinationAppointmentInformationButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showVaccinationAppointmentInformationTouchUpCallback?()
        }
    }
}

class AddCertificateView: UIView {
    // MARK: - API

    public var addQRCertificateTouchUpCallback: (() -> Void)?
    public var addPDFCertificateTouchUpCallback: (() -> Void)?

    // MARK: - Subviews

    private let topLabel = Label(.textBoldLarge)
    private let textLabel = Label(.text)

    private let qrButton = IconButton(textKey: .wallet_homescreen_qr_code_scannen, icon: UIImage(named: "ic-qrcode-scan"))
    private let pdfButton = IconButton(textKey: .wallet_homescreen_pdf_import, icon: UIImage(named: "ic-pdf"))

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
        setupInteraction()

        ub_setContentPriorityRequired()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        backgroundColor = UIColor.cc_white
        layer.cornerRadius = 20
        ub_addShadow(radius: 10.0, opacity: 0.2, xOffset: 0.0, yOffset: 0.0)

        topLabel.text = UBLocalized.wallet_homescreen_add_title
        topLabel.accessibilityTraits = .header
        textLabel.text = UBLocalized.wallet_homescreen_add_certificate_description

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

        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(Padding.medium + 2.0)
            make.left.right.equalToSuperview().inset(lr)
        }

        addSubview(qrButton)
        qrButton.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(Padding.large)
            make.left.right.equalToSuperview().inset(lr / 2)
        }

        addSubview(pdfButton)
        pdfButton.snp.makeConstraints { make in
            make.top.equalTo(qrButton.snp.bottom).offset(Padding.medium + 2.0)
            make.left.right.equalToSuperview().inset(lr / 2)
            make.bottom.equalToSuperview().inset(2.0 * Padding.medium)
        }

        accessibilityLabel = [topLabel.text, textLabel.text].compactMap { $0 }.joined(separator: ", ")
    }

    private func setupInteraction() {
        qrButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addQRCertificateTouchUpCallback?()
        }

        pdfButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addPDFCertificateTouchUpCallback?()
        }
    }
}

class RoundedButton: UBButton {
    // MARK: - Subviews

    private let topLabel = Label(.textBoldLarge)

    // MARK: - Init

    init(titleKey: UBLocalized.Key) {
        super.init()
        setup(titleKey: titleKey)
    }

    // MARK: - Setup

    private func setup(titleKey: UBLocalized.Key) {
        highlightedBackgroundColor = UIColor.cc_touchState
        backgroundColor = UIColor.cc_white
        layer.cornerRadius = 20
        highlightCornerRadius = 20
        ub_addShadow(radius: 10.0, opacity: 0.2, xOffset: 0.0, yOffset: 0.0)

        topLabel.text = UBLocalized.translate(titleKey)
        accessibilityIdentifier = titleKey.rawValue
        addSubview(topLabel)

        let lr = Padding.small + Padding.medium
        let tb = Padding.medium

        topLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: tb, left: lr, bottom: tb, right: lr))
        }

        accessibilityLabel = topLabel.text
        accessibilityTraits = [.button, .header]
    }
}

class IconButton: UBButton {
    // MARK: - Subviews

    private let textLabel = Label(.textBoldLarge, numberOfLines: 0)
    private let iconImageView = UIImageView()

    // MARK: - Init

    init(textKey: UBLocalized.Key, icon: UIImage?) {
        super.init()

        textLabel.text = UBLocalized.translate(textKey)
        accessibilityIdentifier = textKey.rawValue
        iconImageView.image = icon
        setup()
    }

    // MARK: - Setup

    private func setup() {
        highlightedBackgroundColor = UIColor.cc_touchState
        highlightCornerRadius = 10

        let lr = Padding.small + Padding.medium

        iconImageView.contentMode = .scaleAspectFit

        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(lr / 2)
            make.top.greaterThanOrEqualToSuperview().offset(Padding.small)
            make.bottom.lessThanOrEqualToSuperview().offset(-Padding.small)
            make.centerY.equalToSuperview()
        }
        iconImageView.ub_setContentPriorityRequired()

        textLabel.textColor = .cc_blue

        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(2 * Padding.small)
            make.centerY.equalToSuperview()
            make.trailing.lessThanOrEqualToSuperview().offset(-lr / 2)
            make.top.greaterThanOrEqualToSuperview().offset(Padding.small)
            make.bottom.lessThanOrEqualToSuperview().offset(-Padding.small)
        }

        accessibilityLabel = textLabel.text
    }
}
