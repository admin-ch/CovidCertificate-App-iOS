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

class CertificateStateView: UIView {
    // MARK: - Subviews

    private let backgroundView = UIView()
    private let imageView = UIImageView()
    private let roundImageBackgroundView = UIView()
    private let loadingView = UIActivityIndicatorView(style: .gray)
    private let textLabel = Label(.text, textAlignment: .center)

    private let validityView = CertificateStateValidityView()
    private let errorLabel = Label(.smallErrorLight, textAlignment: .center)
    private let certificate: UserCertificate?
    private var hasValidityView: Bool {
        certificate != nil
    }

    var states: (state: VerificationState, temporaryVerifierState: TemporaryVerifierState) = (.loading, .idle) {
        didSet { update(animated: true) }
    }

    private let isHomescreen: Bool

    // MARK: - Init

    init(certificate: UserCertificate? = nil, isHomescreen: Bool = true) {
        self.isHomescreen = isHomescreen
        self.certificate = certificate

        super.init(frame: .zero)

        setup()
        isAccessibilityElement = true

        update(animated: false)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        addSubview(backgroundView)
        addSubview(roundImageBackgroundView)
        addSubview(imageView)
        addSubview(loadingView)
        addSubview(textLabel)

        backgroundView.layer.cornerRadius = 10
        backgroundView.backgroundColor = .cc_blueish
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            if !hasValidityView {
                make.bottom.equalToSuperview()
            }
            make.height.greaterThanOrEqualTo(76)
        }

        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.backgroundView.snp.top)
            make.centerX.equalToSuperview()
        }

        loadingView.snp.makeConstraints { make in
            make.center.equalTo(self.imageView)
        }

        roundImageBackgroundView.backgroundColor = .cc_white
        roundImageBackgroundView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(32)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).inset(Padding.medium + 2)
            make.leading.trailing.bottom.equalTo(backgroundView).inset(Padding.medium)
        }

        if hasValidityView {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 2.0 * Padding.small

            addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(backgroundView.snp.bottom).offset(Padding.small)
                make.bottom.equalToSuperview()
            }

            stackView.addArrangedSubview(validityView)
            stackView.addArrangedSubview(errorLabel)

            validityView.backgroundColor = .cc_greyBackground
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundImageBackgroundView.layer.cornerRadius = roundImageBackgroundView.frame.size.height * 0.5
    }

    private func update(animated: Bool) {
        // switch non-animatable states
        switch states.state {
        case .loading:
            loadingView.startAnimating()
        default:
            loadingView.stopAnimating()
        }

        // switch animatable states
        let actions = {
            self.validityView.isOfflineMode = false
            self.errorLabel.ub_setHidden(true)

            switch self.states.temporaryVerifierState {
            case let .success(validUntil):
                self.imageView.image = UIImage(named: "ic-check-filled")
                self.textLabel.attributedText = UBLocalized.wallet_certificate_verify_success.bold()
                self.backgroundView.backgroundColor = .cc_greenish
                self.validityView.backgroundColor = .cc_greenish
                self.validityView.textColor = .cc_black
                self.validityView.untilText = validUntil
            case .failure:
                if case let .invalid(errors, errorCodes, validUntil) = self.states.state {
                    self.imageView.image = errors.first?.icon(with: .cc_red)
                    self.textLabel.attributedText = errors.first?.displayName()
                    self.backgroundView.backgroundColor = .cc_redish
                    self.validityView.backgroundColor = .cc_redish
                    self.validityView.textColor = .cc_grey
                    self.validityView.untilText = validUntil

                    let codes = errorCodes.joined(separator: ", ")
                    if codes.count > 0 {
                        self.errorLabel.ub_setHidden(false)
                        self.errorLabel.text = codes
                    }
                }
            case let .retry(error, errorCodes):
                self.imageView.image = UIImage(named: "ic-info-outline")?.ub_image(with: .cc_orange)
                self.textLabel.attributedText = error.displayTitle(isReload: true, isHomescreen: self.isHomescreen)
                self.backgroundView.backgroundColor = .cc_orangish
                self.validityView.backgroundColor = .cc_orangish
                self.validityView.offlineText = error.displayText(isReload: true)
                self.validityView.isOfflineMode = true

                let codes = errorCodes.joined(separator: ", ")
                if codes.count > 0 {
                    self.errorLabel.ub_setHidden(false)
                    self.errorLabel.text = codes
                }

            case .verifying:
                self.imageView.image = nil
                self.textLabel.attributedText = NSAttributedString(string: UBLocalized.wallet_certificate_verifying)
                self.backgroundView.backgroundColor = .cc_greyish
                self.validityView.backgroundColor = .cc_greyish
                self.validityView.textColor = .cc_grey

            case .idle:
                switch self.states.state {
                case .loading:
                    self.imageView.image = nil
                    self.textLabel.text = nil
                    self.backgroundView.backgroundColor = .cc_greyish
                    self.validityView.backgroundColor = .cc_greyish
                    self.validityView.textColor = .cc_grey

                case let .success(validUntil):
                    self.imageView.image = UIImage(named: "ic-info-filled")
                    self.textLabel.attributedText = NSAttributedString(string: UBLocalized.verifier_verify_success_info)
                    self.backgroundView.backgroundColor = .cc_blueish
                    self.validityView.backgroundColor = .cc_blueish
                    self.validityView.textColor = .cc_black
                    self.validityView.untilText = validUntil

                case let .invalid(errors, errorCodes, validUntil):
                    self.imageView.image = errors.first?.icon()
                    self.textLabel.attributedText = errors.first?.displayName()
                    self.backgroundView.backgroundColor = .cc_greyish
                    self.validityView.backgroundColor = .cc_greyish
                    self.validityView.textColor = .cc_grey
                    self.validityView.untilText = validUntil

                    let codes = errorCodes.joined(separator: ", ")
                    if codes.count > 0 {
                        self.errorLabel.ub_setHidden(false)
                        self.errorLabel.text = codes
                    }

                case let .retry(error, errorCodes):
                    self.imageView.image = error.icon(with: nil)
                    self.textLabel.attributedText = error.displayTitle(isReload: false, isHomescreen: self.isHomescreen)
                    self.backgroundView.backgroundColor = .cc_greyish
                    self.validityView.backgroundColor = .cc_greyish
                    self.validityView.textColor = .cc_text
                    self.validityView.offlineText = error.displayText(isReload: false)
                    self.validityView.isOfflineMode = true

                    let codes = errorCodes.joined(separator: ", ")
                    if codes.count > 0 {
                        self.errorLabel.ub_setHidden(false)
                        self.errorLabel.text = codes
                    }
                }
            }

            self.accessibilityLabel = self.textLabel.attributedText?.string
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
