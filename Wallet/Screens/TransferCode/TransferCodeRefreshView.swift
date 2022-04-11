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

class TransferCodeRefreshView: UIView {
    // MARK: Views

    private let titleLabel = Label(.textBold)
    private let textLabel = Label(.text)

    public let refreshButton = Button(image: UIImage(named: "ic-refresh"), accessibilityKey: .accessibility_refresh_button)

    public var error: TransferError? {
        didSet { update() }
    }

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        backgroundColor = .cc_orangish
        layer.cornerRadius = 10

        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(refreshButton)

        refreshButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(Padding.medium)
            make.top.equalToSuperview().inset(Padding.medium - 3.0)
            make.bottom.lessThanOrEqualToSuperview().inset(2.0 * Padding.small)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.medium - 3.0)
            make.left.equalToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualTo(refreshButton.snp.left).offset(-Padding.medium)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(Padding.small)
            make.left.equalToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualTo(refreshButton.snp.left).offset(-Padding.medium)
            make.bottom.equalToSuperview().inset(2.0 * Padding.small)
        }
    }

    private func update() {
        titleLabel.text = error?.updateErrorTitle
        textLabel.text = error?.updateErrorText
    }
}
