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

import CovidCertificateSDK
import Foundation

class HomescreenCertificateView: UIView {
    public var touchUpCallback: (() -> Void)?

    // MARK: - Inset

    public static let inset: CGFloat = 6.0

    private let titleLabel = Label(.uppercaseBold, textColor: .cc_greyText, textAlignment: .center)
    private let contentView = UIView()

    private let qrCodeView: QRCodeView
    private let lightQrCodeView: LightQRCodeView
    private let transferView: TransferView

    public var certificate: UserCertificate? {
        didSet {
            qrCodeView.certificate = certificate
            lightQrCodeView.certificate = certificate
            transferView.certificate = certificate
            update(animated: true)
        }
    }

    public var state: VerificationState = .loading {
        didSet {
            qrCodeView.state = state
            lightQrCodeView.state = state
            update(animated: true)
        }
    }

    public var transferError: TransferError? {
        didSet {
            transferView.error = transferError
        }
    }

    // MARK: - Subviews

    init(certificate: UserCertificate) {
        self.certificate = certificate
        qrCodeView = QRCodeView(certificate: certificate)
        lightQrCodeView = LightQRCodeView(certificate: certificate)
        transferView = TransferView(certificate: certificate)
        super.init(frame: .zero)
        setup()

        isAccessibilityElement = true
        accessibilityTraits = [.button]
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        let shadowRadius: CGFloat = 20.0
        let shadowOpacity: CGFloat = 0.17

        contentView.backgroundColor = .white
        contentView.ub_addShadow(radius: shadowRadius, opacity: shadowOpacity, xOffset: 0.0, yOffset: 2.0)
        contentView.layer.cornerRadius = 20.0
        addSubview(contentView)

        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(HomescreenCertificateView.inset)
        }

        contentView.addSubview(titleLabel)
        titleLabel.ub_setContentPriorityRequired()

        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(Padding.large)
        }

        contentView.addSubview(qrCodeView)
        qrCodeView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.titleLabel.snp.bottom)
        }

        contentView.addSubview(lightQrCodeView)
        lightQrCodeView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.titleLabel.snp.bottom)
        }

        contentView.addSubview(transferView)
        transferView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.titleLabel.snp.bottom)
        }

        let holeViews = [HoleView(radius: 10.0, shadowRadius: shadowRadius, shadowOpacity: shadowOpacity, left: true), HoleView(radius: 10.0, shadowRadius: shadowRadius, shadowOpacity: shadowOpacity, left: false)]
        for (i, h) in holeViews.enumerated() {
            contentView.addSubview(h)
            h.snp.makeConstraints { make in
                make.centerX.equalTo(i == 0 ? self.contentView.snp.left : self.contentView.snp.right)
                make.top.equalTo(self.contentView.snp.bottom).multipliedBy(0.618)
            }
        }

        // disable user interaction
        for v in contentView.subviews {
            v.isUserInteractionEnabled = false
        }

        // add button at bottom
        let v = UBButton()
        contentView.insertSubview(v, at: 0)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        v.layer.cornerRadius = contentView.layer.cornerRadius
        v.backgroundColor = .clear
        v.highlightedBackgroundColor = UIColor.cc_touchState

        v.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.touchUpCallback?()
        }

        update(animated: false)
    }

    private func update(animated _: Bool) {
        guard let cert = certificate else { return }

        switch cert.type {
        case .lightCertificate:
            qrCodeView.alpha = 0.0
            transferView.alpha = 0.0
            lightQrCodeView.alpha = 1.0

            let c = CovidCertificateSDK.Wallet.decode(encodedData: cert.lightCertificate?.certificate ?? "")
            switch c {
            case let .success(holder):
                let vaccinations = holder.healthCert.vaccinations ?? []
                if vaccinations.allSatisfy({ $0.doseNumber == $0.totalDoses }) {
                    titleLabel.text = UBLocalized.wallet_certificate
                } else {
                    titleLabel.text = UBLocalized.wallet_certificate_evidence_title
                }
            case .failure:
                break
            }
            accessibilityLabel = [titleLabel.text, qrCodeView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
        case .certificate:
            qrCodeView.alpha = 1.0
            transferView.alpha = 0.0
            lightQrCodeView.alpha = 0.0

            let c = CovidCertificateSDK.Wallet.decode(encodedData: cert.qrCode ?? "")
            switch c {
            case let .success(holder):
                guard let certificate = holder.certificate as? DCCCert else { break }
                let vaccinations = certificate.vaccinations ?? []
                if vaccinations.allSatisfy({ $0.doseNumber == $0.totalDoses }) {
                    titleLabel.text = UBLocalized.wallet_certificate
                } else {
                    titleLabel.text = UBLocalized.wallet_certificate_evidence_title
                }
            case .failure:
                break
            }
            accessibilityLabel = [titleLabel.text, qrCodeView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
        case .transferCode:
            titleLabel.text = UBLocalized.wallet_transfer_code_card_title
            qrCodeView.alpha = 0.0
            transferView.alpha = 1.0
            lightQrCodeView.alpha = 0.0
            accessibilityLabel = [titleLabel.text, transferView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
        }
    }
}

private class HoleView: UIView {
    // MARK: - Subviews

    private let shadowRadius: CGFloat
    private let shadowOpacity: CGFloat

    init(radius: CGFloat, shadowRadius: CGFloat, shadowOpacity: CGFloat, left: Bool) {
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
        super.init(frame: .zero)

        snp.makeConstraints { make in
            make.size.equalTo(radius * 2.0)
        }

        let circlePath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: -CGFloat(Double.pi) * 0.5, endAngle: CGFloat(0.5 * Double.pi), clockwise: left)
        let circleShape = CAShapeLayer()
        circleShape.path = circlePath.cgPath

        layer.mask = circleShape
        layer.cornerRadius = radius
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Draw

    override func draw(_: CGRect) {
        let context = UIGraphicsGetCurrentContext()

        let shadow = UIColor.black.withAlphaComponent(shadowOpacity)
        let shadowOffset = CGSize(width: 0, height: 0)

        let rectanglePath = UIBezierPath(rect: bounds)
        UIColor.cc_blue.setFill()
        rectanglePath.fill()
        context?.saveGState()
        UIRectClip(rectanglePath.bounds)
        context?.setShadow(offset: CGSize.zero, blur: 0, color: nil)
        context?.setAlpha(shadow.cgColor.alpha)
        context?.beginTransparencyLayer(auxiliaryInfo: nil)
        do {
            let opaqueShadow: UIColor? = shadow.withAlphaComponent(1)
            context?.setShadow(offset: shadowOffset, blur: shadowRadius, color: opaqueShadow?.cgColor)
            context!.setBlendMode(.sourceOut)
            context?.beginTransparencyLayer(auxiliaryInfo: nil)
            opaqueShadow?.setFill()
            rectanglePath.fill()
            context!.endTransparencyLayer()
        }
        context!.endTransparencyLayer()
        context?.restoreGState()
    }
}

private class TransferView: UIView {
    // MARK: - Views

    private let transferCodeView = TransferCodeStatusView()
    public var certificate: UserCertificate? {
        didSet { update(animated: true) }
    }

    private let nameView = Label(.title, textAlignment: .center)
    private let failedImageView = UIImageView(image: UIImage(named: "illu-transfer-failed"))
    private let animationView = TransferCodeAnimationView()

    private var timer: Timer?
    private var animationCounter: Int = 2

    public var error: TransferError? {
        didSet { transferCodeView.error = error }
    }

    // MARK: - Subviews

    init(certificate: UserCertificate?) {
        self.certificate = certificate
        super.init(frame: .zero)
        setup()

        isAccessibilityElement = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(nameView)
        addSubview(transferCodeView)

        let codeHasFailed = certificate?.transferCode?.state == .failed

        if codeHasFailed {
            addSubview(failedImageView)
            failedImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(40)
                make.centerX.equalToSuperview()
            }

            failedImageView.contentMode = .scaleAspectFit

            failedImageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
            failedImageView.setContentHuggingPriority(.defaultLow, for: .vertical)
            failedImageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            failedImageView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        } else {
            addSubview(animationView)
            animationView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
            }
        }

        nameView.snp.makeConstraints { make in
            if codeHasFailed {
                make.top.equalTo(failedImageView.snp.bottom).offset(Padding.large)
            } else {
                make.top.equalTo(animationView.snp.bottom).offset(Padding.medium)
            }
            make.left.right.equalToSuperview().inset(Padding.large)
        }

        nameView.text = codeHasFailed ? UBLocalized.wallet_transfer_code_state_expired : UBLocalized.wallet_transfer_code_state_waiting

        nameView.ub_setContentPriorityRequired()

        transferCodeView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(nameView.snp.bottom).offset(Padding.medium)
            make.bottom.left.right.equalToSuperview().inset(2.0 * Padding.small)
        }

        transferCodeView.ub_setContentPriorityRequired()

        update(animated: false)
    }

    public func update(animated _: Bool) {
        transferCodeView.transferCode = certificate?.transferCode
        accessibilityLabel = [nameView.text, transferCodeView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
    }
}

private class QRCodeView: UIView {
    // MARK: - Inset

    private let titleLabel = Label(.uppercaseBold, textColor: .cc_greyText, textAlignment: .center)
    private let nameView = QRCodeNameView(qrCodeInset: Padding.large)
    private let stateView = CertificateStateView(showValidity: false)

    public var certificate: UserCertificate?

    public var state: VerificationState = .loading {
        didSet {
            stateView.states = (state, .idle)
            update(animated: true)
        }
    }

    // MARK: - Subviews

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init(frame: .zero)
        setup()

        isAccessibilityElement = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(nameView)

        nameView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Padding.medium)
            make.left.right.equalToSuperview().inset(Padding.large)
        }

        nameView.certificate = certificate
        addSubview(stateView)
        stateView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(nameView.snp.bottom).offset(Padding.medium + Padding.small)
            make.bottom.left.right.equalToSuperview().inset(2.0 * Padding.small)
        }

        update(animated: false)
    }

    public func update(animated _: Bool) {
        let isInvalid = state.isInvalid()
        nameView.enabled = !isInvalid
        nameView.certificate = certificate

        accessibilityLabel = [nameView.accessibilityLabel, stateView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
    }
}

private class LightQRCodeView: UIView {
    // MARK: - Inset

    private let titleLabel = Label(.uppercaseBold, textColor: .cc_greyText, textAlignment: .center)
    private let nameView = QRCodeNameView(qrCodeInset: Padding.large, isLightCertificate: true)
    private let stateView = CertificateStateView(showValidity: false, isLightCertificate: true)

    public var certificate: UserCertificate?

    public var state: VerificationState = .loading {
        didSet {
            stateView.states = (state, .idle)
            update(animated: true)
        }
    }

    // MARK: - Subviews

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init(frame: .zero)
        setup()

        isAccessibilityElement = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(nameView)

        nameView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Padding.medium)
            make.left.right.equalToSuperview().inset(Padding.large)
        }

        nameView.certificate = certificate
        addSubview(stateView)
        stateView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(nameView.snp.bottom).offset(Padding.medium + Padding.small)
            make.bottom.left.right.equalToSuperview().inset(2.0 * Padding.small)
        }

        update(animated: false)

        nameView.didExpireCallback = { [weak self] in
            guard let self = self,
                  let qrCode = self.certificate?.qrCode else { return }
            CertificateStorage.shared.updateCertificate(with: qrCode, lightCertififcate: nil)
        }
    }

    public func update(animated _: Bool) {
        let isInvalid = state.isInvalid()
        nameView.enabled = !isInvalid
        nameView.certificate = certificate

        accessibilityLabel = [nameView.accessibilityLabel, stateView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
    }
}
