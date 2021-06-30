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

class TransferCodeTableViewCell: UITableViewCell {
    private let icon = UIImageView()
    private let stateLabel = Label(.textBoldLarge)
    private let transferCodeLabel = SmallTransferCodeLabel()

    var certificate: UserCertificate? {
        didSet { update() }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()

        isAccessibilityElement = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(2 * Padding.small)
            make.centerY.equalToSuperview()
        }

        contentView.addSubview(stateLabel)
        stateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.medium + 2)
            make.leading.equalTo(icon.snp.trailing).offset(Padding.medium)
            make.trailing.equalToSuperview().inset(2 * Padding.small)
        }

        contentView.addSubview(transferCodeLabel)
        transferCodeLabel.snp.makeConstraints { make in
            make.top.equalTo(stateLabel.snp.bottom).offset(Padding.small)
            make.leading.equalTo(stateLabel).offset(0)
            make.trailing.lessThanOrEqualToSuperview().inset(2 * Padding.small)
            make.bottom.lessThanOrEqualToSuperview().inset(Padding.medium + 3)
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

        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.cc_touchState
        self.selectedBackgroundView = selectedBackgroundView
    }

    private func update() {
        guard let code = certificate?.transferCode else { return }

        transferCodeLabel.code = code

        switch code.state {
        case .valid, .expired:
            stateLabel.text = UBLocalized.wallet_transfer_code_state_waiting
            icon.image = UIImage(named: "ic-transfer-code")
        case .failed:
            stateLabel.text = UBLocalized.wallet_transfer_code_state_expired
            icon.image = UIImage(named: "ic-transfer-failed")
        }

        accessibilityLabel = [stateLabel.text, transferCodeLabel.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
    }
}
