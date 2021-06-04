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

class CertificateTableViewCell: UITableViewCell {
    // MARK: - Public API

    public var certificate: UserCertificate? {
        didSet { update() }
    }

    // MARK: - Subviews

    private let qrCodeStateImageView = UIImageView()
    private let nameLabel = Label(.textBoldLarge)
    private let loadingView = UIActivityIndicatorView(style: .gray)

    private let stateLabel = StateLabel()

    private var verifier: Verifier?
    private var state: VerificationState = .loading {
        didSet { self.updateState(animated: true) }
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        contentView.addSubview(qrCodeStateImageView)

        qrCodeStateImageView.ub_setContentPriorityRequired()
        qrCodeStateImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(2.0 * Padding.small)
            make.bottom.lessThanOrEqualToSuperview().inset(2.0 * Padding.small)
        }

        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.medium + 2.0)
            make.left.equalTo(self.qrCodeStateImageView.snp.right).offset(Padding.small)
            make.right.equalToSuperview().inset(2.0 * Padding.small)
        }

        contentView.addSubview(stateLabel)
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Padding.small)
            make.left.equalTo(self.qrCodeStateImageView.snp.right).offset(Padding.small)
            make.right.lessThanOrEqualToSuperview().inset(2.0 * Padding.small)
            make.bottom.lessThanOrEqualToSuperview().inset(2.0 * Padding.small)
        }

        let lineView = UIView()
        lineView.backgroundColor = UIColor.cc_line
        addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1.0)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        let lineViewTop = UIView()
        lineViewTop.backgroundColor = UIColor.cc_line
        addSubview(lineViewTop)
        lineViewTop.snp.makeConstraints { make in
            make.height.equalTo(1.0)
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
        }

        contentView.addSubview(loadingView)

        loadingView.snp.makeConstraints { make in
            make.bottom.equalTo(self.qrCodeStateImageView.snp.bottom).inset(Padding.small + 2.0)
            make.right.equalTo(self.qrCodeStateImageView.snp.right).inset(Padding.small + 2.0)
        }

        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.cc_touchState
        self.selectedBackgroundView = selectedBackgroundView
    }

    private func update() {
        updateState(animated: false)

        guard let cert = certificate else {
            nameLabel.text = nil
            qrCodeStateImageView.image = nil
            return
        }

        let c = CovidCertificateSDK.decode(encodedData: cert.qrCode)

        switch c {
        case let .success(holder):
            nameLabel.text = holder.healthCert.displayFullName
            stateLabel.type = holder.healthCert.certType

            verifier = Verifier(holder: holder)

            verifier?.start(stateUpdate: { [weak self] state in
                guard let strongSelf = self else { return }
                strongSelf.state = state
            })

        case .failure:
            verifier = nil
        }

        accessibilityLabel = [nameLabel.accessibilityLabel, stateLabel.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
    }

    private func updateState(animated: Bool) {
        switch state {
        case .loading:
            loadingView.startAnimating()
        default:
            loadingView.stopAnimating()
        }

        let actions = {
            let normal = UIImage(named: "ic-qrcode-small")
            let notYetValid = UIImage(named: "ic-qrcode-small-temporary")
            let invalid = UIImage(named: "ic-qrcode-small-invalid")
            let load = UIImage(named: "ic-qrcode-small-load")

            switch self.state {
            case .loading:
                self.qrCodeStateImageView.image = load
            case .success, .retry:
                self.qrCodeStateImageView.image = normal
            case let .invalid(errors, _, _):
                if let e = errors.first {
                    switch e {
                    case .signature, .revocation, .otherNationalRules, .unknown:
                        self.qrCodeStateImageView.image = invalid
                    case .expired:
                        self.qrCodeStateImageView.image = invalid
                    case .notYetValid:
                        self.qrCodeStateImageView.image = notYetValid
                    }
                }
            }

            let isInvalid = self.state.isInvalid()
            self.nameLabel.alpha = isInvalid ? UIColor.cc_disabledAlpha : 1.0

            self.stateLabel.enabled = !isInvalid
        }

        if animated {
            UIView.animate(withDuration: 0.2) {
                actions()
            }
        } else {
            actions()
        }
    }
}

private class StateLabel: UIView {
    // MARK: - Subviews

    private let label = Label(.smallUppercaseBold)

    // MARK: - Properties

    public var type: CertType? {
        didSet { update() }
    }

    public var enabled: Bool = true {
        didSet { update() }
    }

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
        layer.cornerRadius = 4.0

        addSubview(label)
        label.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(Padding.small)
            make.top.bottom.equalToSuperview().inset(2.0)
        }

        update()
    }

    private func update() {
        label.text = type?.displayName
        accessibilityLabel = type?.displayName

        if enabled {
            if let r = type {
                switch r {
                case .recovery, .vaccination:
                    backgroundColor = .cc_blue
                    label.textColor = .cc_white
                case .test:
                    backgroundColor = .cc_blueish
                    label.textColor = .cc_blue
                }
            } else {
                backgroundColor = .clear
            }
        } else {
            backgroundColor = .cc_greyBackground
            label.textColor = .cc_greyText
        }
    }

    // Fix for iOS 12:
    // This prevents removal of the background color when this view is in a UITableViewCell that gets selected/highlighted/reordered
    override var backgroundColor: UIColor? {
        didSet {
            if let alpha = backgroundColor?.cgColor.alpha, alpha == 0 {
                backgroundColor = oldValue
            }
        }
    }
}
