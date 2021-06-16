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

class TransferCodeStatusView: UIView {
    private let imageView = UIImageView()
    private let roundImageBackgroundView = UIView()

    private let titleLabel = Label(.textBold, textAlignment: .center)
    private let codeLabel = TransferCodeLabel()
    private let createdAtLabel = Label(.text, textAlignment: .center)

    private var isNewlyCreated: Bool

    var transferCode: UserTransferCode? {
        didSet { update() }
    }

    init(isNewlyCreated: Bool = false) {
        self.isNewlyCreated = isNewlyCreated
        super.init(frame: .zero)

        setupView()

        update()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .cc_blueish
        layer.cornerRadius = 10

        addSubview(roundImageBackgroundView)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(codeLabel)
        addSubview(createdAtLabel)

        roundImageBackgroundView.backgroundColor = .cc_white
        roundImageBackgroundView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(32)
        }

        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(snp.top)
            make.centerX.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

        codeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Padding.medium)
            make.centerX.equalToSuperview()
        }

        createdAtLabel.snp.makeConstraints { make in
            make.top.equalTo(codeLabel.snp.bottom).offset(Padding.medium)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Padding.medium)
        }
    }

    private func update() {
        guard let code = transferCode else { return }
        if isNewlyCreated {
            imageView.image = UIImage(named: "ic-check-mark")
            titleLabel.text = UBLocalized.wallet_transfer_code_title
            codeLabel.code = code.transferCode
            createdAtLabel.text = UBLocalized.wallet_transfer_code_createdat.replacingOccurrences(of: "{DATE}", with: DateFormatter.ub_dayTimeString(from: code.created))

        } else {
            imageView.image = code.validityIcon
            titleLabel.text = code.validDaysText
            codeLabel.code = code.transferCode
            createdAtLabel.text = UBLocalized.wallet_transfer_code_createdat.replacingOccurrences(of: "{DATE}", with: DateFormatter.ub_dayTimeString(from: code.created))
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundImageBackgroundView.layer.cornerRadius = roundImageBackgroundView.frame.size.height * 0.5
    }
}
