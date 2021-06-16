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

class HomescreenCertificateView: UIView {
    public var touchUpCallback: (() -> Void)?

    // MARK: - Inset

    public static let inset: CGFloat = 6.0

    private let titleLabel = Label(.uppercaseBold, textColor: .cc_greyText, textAlignment: .center)
    private let contentView = UIView()

    private let qrCodeView: QRCodeView
    private let transferView: TransferView

    public let certificate: UserCertificate

    public var state: VerificationState = .loading {
        didSet {
            qrCodeView.state = state
            update(animated: true)
        }
    }

    // MARK: - Subviews

    init(certificate: UserCertificate) {
        self.certificate = certificate
        qrCodeView = QRCodeView(certificate: certificate)
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
        switch certificate.type {
        case .certificate:
            titleLabel.text = UBLocalized.wallet_certificate
            qrCodeView.alpha = 1.0
            transferView.alpha = 0.0
            accessibilityLabel = [titleLabel.text, qrCodeView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
        case .transferCode:
            titleLabel.text = UBLocalized.wallet_transfer_code_title
            qrCodeView.alpha = 0.0
            transferView.alpha = 1.0
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
    // MARK: - Inset

    private let transferCodeView = TransferCodeStatusView()
    public var certificate: UserCertificate

    public let phoneAnimationView = UIImageView()
    public let ringAnimationView = UIImageView()

    private var timer: Timer?
    private var animationCounter: Int = 2

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
        addSubview(ringAnimationView)

        ringAnimationView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }

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
            make.left.right.top.equalToSuperview()
        }

        phoneAnimationView.loadAnimation(pattern: "210616_wait_for_transfer_phone_only_00000", numberOfImages: 71)
        phoneAnimationView.startAnimating()

        transferCodeView.transferCode = certificate.transferCode

        addSubview(transferCodeView)
        transferCodeView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview().inset(2.0 * Padding.small)
        }

        update(animated: false)
    }

    public func update(animated _: Bool) {
        accessibilityLabel = [transferCodeView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
    }
}

private class QRCodeView: UIView {
    // MARK: - Inset

    private let titleLabel = Label(.uppercaseBold, textColor: .cc_greyText, textAlignment: .center)
    private let nameView = QRCodeNameView(qrCodeInset: Padding.large)
    private let stateView = CertificateStateView()

    public var certificate: UserCertificate

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

        accessibilityLabel = [nameView.accessibilityLabel, stateView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
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
