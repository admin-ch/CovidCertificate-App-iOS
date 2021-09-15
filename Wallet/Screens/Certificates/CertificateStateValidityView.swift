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

class CertificateStateValidityView: UIView {
    // MARK: - Validity

    let validityTitleLabel = Label(.text)
    let validityTitleLabelSecondLine = Label(.text)

    let untilTitleLabel = Label(.text, numberOfLines: 1, textAlignment: .right)
    private let untilTextLabel = Label(.textBold, textAlignment: .right)
    private let validityView = UIView()

    // MARK: - Offline

    private let offlineLabel = Label(.text, textAlignment: .center)
    private let offlineView = UIView()

    // MARK: - API

    var untilText: String? {
        didSet { untilTextLabel.text = untilText ?? "–" }
    }

    var textColor: UIColor = .cc_black {
        didSet {
            validityTitleLabel.textColor = textColor
            untilTitleLabel.textColor = textColor
            untilTextLabel.textColor = textColor
        }
    }

    var isOfflineMode: Bool = false {
        didSet {
            validityView.ub_setHidden(isOfflineMode)
            offlineView.ub_setHidden(!isOfflineMode)
        }
    }

    var offlineText: String? {
        didSet { offlineLabel.text = offlineText }
    }

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        layer.cornerRadius = 10

        let stackView = UIStackView()
        stackView.axis = .vertical

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        validityView.addSubview(validityTitleLabel)
        validityView.addSubview(validityTitleLabelSecondLine)

        validityView.addSubview(untilTitleLabel)
        validityView.addSubview(untilTextLabel)

        // we add a second hidden label (second line) to get the length
        // of the second line, so that the date can be layouted meaningfully
        let title = UBLocalized.wallet_certificate_validity
        validityTitleLabel.text = title
        validityTitleLabel.numberOfLines = title.contains("\n") ? 2 : 1
        validityTitleLabelSecondLine.text = title.contains("\n") ? UBLocalized.wallet_certificate_validity.split(separator: "\n").map { String($0) }.last : ""

        validityTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(2 * Padding.small)
            make.leading.equalToSuperview().inset(Padding.medium)
        }

        validityTitleLabelSecondLine.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(2 * Padding.small)
            make.leading.equalToSuperview().inset(Padding.medium)
        }

        validityTitleLabelSecondLine.isHidden = true

        untilTitleLabel.text = UBLocalized.wallet_certificate_valid_until
        untilTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(validityTitleLabel)
            make.trailing.equalToSuperview().inset(Padding.medium)
            make.leading.equalTo(validityTitleLabel.snp.trailing).offset(Padding.small)
        }
        untilTitleLabel.ub_setContentPriorityRequired()

        untilTextLabel.text = "–"
        untilTextLabel.snp.makeConstraints { make in
            make.trailing.equalTo(untilTitleLabel)
            make.leading.equalTo(validityTitleLabelSecondLine.snp.trailing).offset(Padding.small)
            make.top.equalTo(untilTitleLabel.snp.bottom)
            make.bottom.equalToSuperview().inset(2 * Padding.small)
        }

        stackView.addArrangedSubview(validityView)

        offlineView.addSubview(offlineLabel)

        offlineLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(2 * Padding.small)
            make.left.right.equalToSuperview().inset(Padding.medium)
        }

        stackView.addArrangedSubview(offlineView)

        isOfflineMode = false
    }
}
