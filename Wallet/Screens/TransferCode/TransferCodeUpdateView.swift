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

class TransferCodeUpdateView: UIView {
    // MARK: Views

    private let textLabel = Label(.text)
    public let refreshButton = Button(image: UIImage(named: "ic-refresh-blue"), accessibilityKey: .accessibility_refresh_button)

    public var date: Date? {
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
        backgroundColor = .cc_blueish
        layer.cornerRadius = 10

        addSubview(textLabel)
        addSubview(refreshButton)

        refreshButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(Padding.medium)
            make.top.equalToSuperview().inset(Padding.medium - 3.0)
            make.bottom.lessThanOrEqualToSuperview().inset(2.0 * Padding.small)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.medium - 3.0)
            make.left.equalToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualTo(refreshButton.snp.left).offset(-Padding.medium)
            make.bottom.equalToSuperview().inset(2.0 * Padding.small)
        }
    }

    private func update() {
        guard let d = date else {
            textLabel.text = nil
            return
        }

        let date = DateFormatter.ub_dayTimeString(from: d)
        let text = UBLocalized.wallet_transfer_code_state_updated
        let attributed = text.replacingOccurrences(of: "{DATE}", with: date).formattingOccurrenceBold(date)
        textLabel.attributedText = attributed
        textLabel.accessibilityLabel = text.replacingOccurrences(of: "{DATE}", with: DateFormatter.ub_accessibilityDateString(dateString: date) ?? date)
    }
}
