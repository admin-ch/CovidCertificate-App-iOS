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

class CertificateAddDetailView: UIView {
    // MARK: - Public API

    public var certificate: UserCertificate? {
        didSet { update() }
    }

    // MARK: - Subviews

    private var stackScrollView = StackScrollView()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        addSubview(stackScrollView)

        stackScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.large + Padding.medium
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)
    }

    // MARK: - Update

    private func update() {
        stackScrollView.removeAllViews()

        stackScrollView.addSpacerView(Padding.large + Padding.medium)

        if let cert = certificate {
            if CertificateStorage.shared.userCertificates.contains(where: { $0.qrCode == cert.qrCode }) {
                stackScrollView.addSpacerView(Padding.medium)
                stackScrollView.addArrangedView(CertificateAlreadyAddedView())
            }
        }

        stackScrollView.addSpacerView(Padding.large + Padding.medium)

        let imageView = UIImageView.centered(with: UIImage(named: "ic-qrcode"))
        imageView.accessibilityLabel = UBLocalized.accessibility_qr_code
        imageView.isAccessibilityElement = true

        stackScrollView.addArrangedView(imageView)
        stackScrollView.addSpacerView(Padding.large + Padding.medium)

        let nameLabel = Label(.title, textAlignment: .center)
        let birthdayLabel = Label(.text, textAlignment: .center)

        if let qrCode = certificate?.qrCode {
            let c = CovidCertificateSDK.Wallet.decode(encodedData: qrCode)
            switch c {
            case let .success(holder):
                nameLabel.text = holder.certificate.displayFullName
                birthdayLabel.text = holder.certificate.dateOfBirthFormatted
                birthdayLabel.accessibilityLabel = DateFormatter.ub_accessibilityDateString(dateString: holder.certificate.dateOfBirthFormatted) ?? birthdayLabel.text
            case .failure:
                break
            }
        }

        stackScrollView.addArrangedView(nameLabel)
        stackScrollView.addSpacerView(Padding.small * 2.0)

        stackScrollView.addArrangedView(birthdayLabel)
        stackScrollView.addSpacerView(2.0 * Padding.large)

        if let cert = certificate {
            let v = CertificateDetailView(showEnglishLabelsIfNeeded: false)
            v.certificate = cert
            v.states = (.success(nil), .idle)
            stackScrollView.addArrangedView(v)
        }

        // adds enough padding to scroll further than linear gradient
        stackScrollView.addSpacerView(4.0 * Padding.large)
    }
}
