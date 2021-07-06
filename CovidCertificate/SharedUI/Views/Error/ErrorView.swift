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

class ErrorView: UIView {
    // MARK: - Subviews

    private let stackView = UIStackView()

    private let backgroundView = UIView()
    private let imageView = UIImageView()
    private let roundImageBackgroundView = UIView()

    private let titleLabel = Label(.textBold, textAlignment: .center)
    private let textLabel = Label(.text, textAlignment: .center)

    private let errorLabel = Label(.smallErrorLight, textAlignment: .center)

    public var error: ErrorViewError? {
        didSet { update(animated: false) }
    }

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
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 2.0 * Padding.small

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.addArrangedView(backgroundView)
        addSubview(roundImageBackgroundView)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(textLabel)

        backgroundView.layer.cornerRadius = 10
        backgroundView.backgroundColor = .cc_orangish
        backgroundView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(76)
        }

        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.backgroundView.snp.top)
            make.centerX.equalToSuperview()
        }

        roundImageBackgroundView.backgroundColor = .cc_white
        roundImageBackgroundView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(32)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView).inset(Padding.medium + 2)
            make.leading.trailing.equalTo(backgroundView).inset(Padding.medium)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Padding.small)
            make.leading.trailing.bottom.equalTo(backgroundView).inset(Padding.medium)
        }

        stackView.addArrangedView(errorLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundImageBackgroundView.layer.cornerRadius = roundImageBackgroundView.frame.size.height * 0.5
    }

    private func update(animated: Bool) {
        // switch animatable states
        let actions = {
            self.imageView.image = self.error?.icon(color: nil)
            self.titleLabel.text = self.error?.errorTitle
            self.textLabel.text = self.error?.errorText
            self.errorLabel.text = self.error?.errorCode
            self.accessibilityLabel = [self.titleLabel.attributedText?.string, self.textLabel.attributedText?.string].compactMap { $0 }.joined(separator: ", ")
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
