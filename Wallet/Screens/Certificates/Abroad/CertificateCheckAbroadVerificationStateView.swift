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

import UIKit

class CertificateCheckAbroadVerificationStateView: UIView {
    // MARK: - Public API

    var state: (state: VerificationState, country: ArrivalCountry, checkDate: Date)? {
        didSet {
            update(animated: true)
        }
    }

    var useDateAndTime: Bool = false {
        didSet {
            update(animated: false)
        }
    }

    var touchUpCallback: (() -> Void)?

    // MARK: - Subviews

    private let backgroundView = UIView()
    private let imageView = UIImageView()
    private let roundImageBackgroundView = UIView()
    private let loadingView = UIActivityIndicatorView(style: .gray)
    private let textLabel = Label(.textBold, textAlignment: .center)
    private let errorLabel = Label(.smallErrorLight, textAlignment: .center)

    private let reloadButton = UBButton()

    // MARK: - Init

    init() {
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

        addSubview(errorLabel)

        backgroundView.layer.cornerRadius = 10
        backgroundView.backgroundColor = .cc_blueish
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            // make.bottom.equalToSuperview()
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

        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.bottom).offset(Padding.small)
            make.leading.trailing.equalTo(backgroundView).inset(Padding.medium)
            make.bottom.equalToSuperview()
        }

        backgroundView.addSubview(reloadButton)

        reloadButton.layer.cornerRadius = backgroundView.layer.cornerRadius
        reloadButton.highlightCornerRadius = backgroundView.layer.cornerRadius
        reloadButton.highlightedBackgroundColor = .cc_touchState

        reloadButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        reloadButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.touchUpCallback?()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundImageBackgroundView.layer.cornerRadius = roundImageBackgroundView.frame.size.height * 0.5
    }

    private func update(animated: Bool) {
        guard let state = state else {
            textLabel.text = UBLocalized.wallet_foreign_rules_check_state_empty
            backgroundView.backgroundColor = .cc_blueish
            imageView.image = UIImage(named: "ic-info-filled")
            return
        }

        // switch non-animatable states
        switch state.state {
        case .loading:
            loadingView.startAnimating()
        default:
            loadingView.stopAnimating()
        }

        // switch animatable states
        let actions = {
            self.errorLabel.ub_setHidden(true)
            switch state.state {
            case .loading:
                self.imageView.image = nil
                self.textLabel.attributedText = NSAttributedString(string: UBLocalized.wallet_certificate_verifying)
                self.backgroundView.backgroundColor = .cc_greyish
            case .skipped:
                self.imageView.image = UIImage(named: "ic-info-filled")
                self.textLabel.attributedText = NSAttributedString(string: UBLocalized.verifier_verify_success_info)
                self.backgroundView.backgroundColor = .cc_blueish

            case .success:
                let text = UBLocalized.wallet_foreign_rules_check_state_valid.bold()
                text.append(NSAttributedString(string: "\n"))
                text.append(UBLocalized.wallet_foreign_rules_check_state_country_and_date.replacingOccurrences(of: "{COUNTRY}", with: state.country.localizedString).replacingOccurrences(of: "{DATE}", with: self.useDateAndTime ? DateFormatter.ub_dayTimeString(from: state.checkDate) : DateFormatter.ub_dayString(from: state.checkDate)).regular())
                self.textLabel.attributedText = text
                self.imageView.image = UIImage(named: "ic-check-filled")
                self.backgroundView.backgroundColor = .cc_greenish
            case let .invalid(errors, errorCodes, _, _, _):
                let first = state.state.getFirstError()

                self.imageView.image = first?.icon(with: .cc_red)
                let text = UBLocalized.wallet_foreign_rules_check_state_invalid.bold()
                text.append(NSMutableAttributedString(string: "\n"))
                text.append(UBLocalized.wallet_foreign_rules_check_state_country_and_date.replacingOccurrences(of: "{COUNTRY}", with: state.country.localizedString).replacingOccurrences(of: "{DATE}", with: self.useDateAndTime ? DateFormatter.ub_dayTimeString(from: state.checkDate) : DateFormatter.ub_dayString(from: state.checkDate)).regular())
                self.textLabel.attributedText = text
                self.backgroundView.backgroundColor = .cc_redish

                let hasNationalError = errors.contains { e in
                    switch e {
                    case .otherNationalRules: return true
                    default: return false
                    }
                }

                let codes = errorCodes.joined(separator: ", ")
                if codes.count > 0, hasNationalError {
                    self.errorLabel.ub_setHidden(false)
                    self.errorLabel.text = codes
                }

            case let .retry(error, errorCodes):
                self.imageView.image = error.icon(with: .cc_orange)
                self.textLabel.attributedText = UBLocalized.wallet_detail_network_error_title.bold()
                self.backgroundView.backgroundColor = .cc_orangish

                let codes = errorCodes.joined(separator: ", ")
                if codes.count > 0 {
                    self.errorLabel.ub_setHidden(false)
                    self.errorLabel.text = codes
                }
            }

            let accText = String(with: self.textLabel.attributedText?.string.filter { $0 != "\n" } ?? self.textLabel.attributedText?.string ?? "")
            self.accessibilityLabel = accText
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
