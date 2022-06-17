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

class CertificateRenewExpiryView: UIView {
    private let dateView = UIView()
    private let title = Label(.textBoldLarge, textAlignment: .center)
    private let expiry = Label(.textLarge, textAlignment: .center)

    private let imageView = UIImageView()
    private let roundImageBackgroundView = UIView()

    private let textView = UIView()
    private let textLabel = Label(.text, textAlignment: .center)

    private let errorView = ErrorView()

    enum State {
        case info
        case loading
        case error(ErrorViewError)
        case success
    }

    var expiryDate: String? {
        didSet {
            update()
        }
    }

    var state: State? {
        didSet {
            update()
        }
    }

    init() {
        super.init(frame: .zero)
        setupLayout()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        title.text = UBLocalized.wallet_certificate_renewal_qr_code_expiration
        dateView.addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(Padding.medium)
        }

        dateView.addSubview(expiry)
        expiry.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).inset(-Padding.small)
            make.leading.trailing.equalToSuperview().inset(Padding.medium)
            make.bottom.equalToSuperview().inset(Padding.large)
        }

        dateView.layer.cornerRadius = 10
        dateView.clipsToBounds = true

        addSubview(dateView)
        dateView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(Padding.medium)
        }

        textView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.large)
            make.leading.trailing.bottom.equalToSuperview().inset(Padding.medium)
        }
        addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalTo(dateView.snp.bottom).inset(-Padding.small)
            make.leading.trailing.equalToSuperview().inset(Padding.medium)
            make.bottom.equalToSuperview().inset(Padding.large)
        }
        textView.layer.cornerRadius = 10
        textView.clipsToBounds = true

        addSubview(roundImageBackgroundView)
        roundImageBackgroundView.backgroundColor = .cc_white
        roundImageBackgroundView.layer.cornerRadius = 32.0 / 2.0
        roundImageBackgroundView.clipsToBounds = true
        roundImageBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(textView.snp.top).inset(-(Padding.small / 2.0))
            make.size.equalTo(32)
        }

        roundImageBackgroundView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(25)
        }

        addSubview(errorView)
        errorView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(textView)
            make.bottom.equalToSuperview()
        }
    }

    override var backgroundColor: UIColor? {
        set {
            dateView.backgroundColor = newValue
            textView.backgroundColor = newValue
            super.backgroundColor = .clear
        }
        get { nil }
    }

    private func update() {
        expiry.text = expiryDate
        switch state {
        case .info:
            backgroundColor = .cc_redish
            roundImageBackgroundView.isHidden = false
            imageView.layer.removeAllAnimations()
            imageView.image = UIImage(named: "ic-info-alert-red")
            textLabel.text = UBLocalized.wallet_certificate_renewal_required_info
            errorView.isHidden = true
        case .loading:
            backgroundColor = .cc_greyish
            roundImageBackgroundView.isHidden = false
            imageView.rotate(time: 1.0)
            imageView.image = UIImage(named: "ic-load")
            textLabel.text = UBLocalized.wallet_certificate_renewal_in_progress_info
            errorView.isHidden = true
        case .success:
            backgroundColor = .cc_greenish
            roundImageBackgroundView.isHidden = false
            imageView.layer.removeAllAnimations()
            imageView.image = UIImage(named: "ic-check-filled")
            textLabel.text = UBLocalized.wallet_certificate_renewal_successful_info
            errorView.isHidden = true
        case let .error(error):
            imageView.layer.removeAllAnimations()
            backgroundColor = .cc_greyish
            roundImageBackgroundView.isHidden = true
            imageView.image = nil
            errorView.isHidden = false
            errorView.error = error
        case .none:
            break
        }
    }
}
