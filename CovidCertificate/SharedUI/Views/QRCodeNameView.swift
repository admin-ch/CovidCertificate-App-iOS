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

class QRCodeNameView: UIView {
    // MARK: - Public API

    public var certificate: UserCertificate? {
        didSet { update() }
    }

    public var enabled: Bool = true {
        didSet { alpha = enabled ? 1.0 : UIColor.cc_disabledAlpha }
    }

    // MARK: - Subviews

    private let imageView = UIImageView()
    private lazy var certificateTimer = CertificateLightExpirationTimer()
    private let nameView = Label(.title, numberOfLines: 3, textAlignment: .center)
    private let birthdayLabelView = Label(.text, textAlignment: .center)

    private let qrCodeInset: CGFloat
    private let isLightCertificate: Bool
    let qrCodeLayoutGuide = UILayoutGuide()

    var didExpireCallback: (() -> Void)?

    // MARK: - Init

    init(qrCodeInset: CGFloat = 0, isLightCertificate: Bool = false) {
        self.qrCodeInset = qrCodeInset
        self.isLightCertificate = isLightCertificate
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
        // prohibits changing of colors with Apple's 'Smart Invert Colors'
        imageView.accessibilityIgnoresInvertColors = true

        addSubview(imageView)
        if isLightCertificate {
            addSubview(certificateTimer)
        }
        addSubview(nameView)
        addSubview(birthdayLabelView)

        imageView.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(self.qrCodeInset).priority(.medium)
            make.trailing.lessThanOrEqualToSuperview().inset(self.qrCodeInset)
            make.leading.greaterThanOrEqualToSuperview().inset(self.qrCodeInset)
            make.width.equalTo(self.imageView.snp.height)
        }

        addLayoutGuide(qrCodeLayoutGuide)
        qrCodeLayoutGuide.snp.makeConstraints { make in
            make.edges.equalTo(imageView)
        }

        if isLightCertificate {
            certificateTimer.snp.makeConstraints { make in
                make.top.equalTo(self.imageView.snp.bottom).offset(Padding.medium)
                make.centerX.equalToSuperview()
            }
            certificateTimer.didExpireCallback = { [weak self] in
                self?.didExpireCallback?()
            }
        }

        nameView.snp.makeConstraints { make in
            if isLightCertificate {
                make.top.equalTo(self.certificateTimer.snp.bottom).offset(Padding.medium)
            } else {
                make.top.equalTo(self.imageView.snp.bottom).offset(Padding.medium)
            }
            make.leading.trailing.equalToSuperview().inset(self.qrCodeInset)
        }

        birthdayLabelView.snp.makeConstraints { make in
            make.top.equalTo(self.nameView.snp.bottom).offset(2.0 * Padding.small)
            make.leading.trailing.equalToSuperview().inset(self.qrCodeInset)
            make.bottom.equalToSuperview()
        }

        imageView.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)

        nameView.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .vertical)
        birthdayLabelView.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .vertical)
    }

    // MARK: - Update

    private func update() {
        guard let qrCode = isLightCertificate ? certificate?.lightCertificate?.certificate : certificate?.qrCode else { return }

        if isLightCertificate {
            certificateTimer.certificate = certificate?.lightCertificate
        }

        let c = CovidCertificateSDK.Wallet.decode(encodedData: qrCode)

        switch c {
        case let .success(holder):
            nameView.text = holder.certificate.displayFullName
            birthdayLabelView.text = holder.certificate.dateOfBirthFormatted

            birthdayLabelView.accessibilityLabel = DateFormatter.ub_accessibilityDateString(dateString: holder.certificate.dateOfBirthFormatted) ?? birthdayLabelView.text

        case .failure:
            break
        }

        if isLightCertificate,
           let image = certificate?.lightCertificate {
            imageView.image = image.qrCodeImage
        } else {
            imageView.setQrCode(qrCode)
        }
    }

    override var accessibilityLabel: String? {
        set {}
        get {
            return [UBLocalized.accessibility_qr_code,
                    certificateTimer.accessibilityLabel,
                    nameView.text,
                    birthdayLabelView.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
        }
    }
}
