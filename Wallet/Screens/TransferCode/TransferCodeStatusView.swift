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
    private let validLabel = Label(.text, textColor: .cc_blue, textAlignment: .center)
    private let codeLabel = TransferCodeLabel()
    private let createdAtLabel = Label(.text, textAlignment: .center)

    private let errorCorner = UIImageView()

    private var isNewlyCreated: Bool

    var transferCode: UserTransferCode? {
        didSet { update() }
    }

    var error: CryptoError? {
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
        addSubview(validLabel)
        addSubview(codeLabel)
        addSubview(createdAtLabel)
        addSubview(errorCorner)

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

        validLabel.snp.makeConstraints { make in
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

        errorCorner.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
        }

        errorCorner.alpha = 0.0
    }

    private func update() {
        guard let code = transferCode else { return }
        if isNewlyCreated {
            imageView.image = UIImage(named: "ic-check-mark")
            validLabel.isHidden = true
            titleLabel.isHidden = false
            titleLabel.text = UBLocalized.wallet_transfer_code_title
            codeLabel.snp.remakeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(Padding.medium)
                make.centerX.equalToSuperview()
            }
            codeLabel.code = code.transferCode
            createdAtLabel.text = UBLocalized.wallet_transfer_code_createdat.replacingOccurrences(of: "{DATE}", with: DateFormatter.ub_dayTimeString(from: code.created))

        } else {
            if let img = error?.cornerIcon {
                // alpha handling is done afterwards
                // and will correctly fade when icon
                // should disappear
                errorCorner.image = img
            }

            errorCorner.alpha = error?.cornerIcon == nil ? 0.0 : 1.0

            imageView.image = code.validityIcon
            validLabel.isHidden = false
            titleLabel.isHidden = true
            validLabel.attributedText = code.validDaysText
            codeLabel.snp.remakeConstraints { make in
                make.top.equalTo(validLabel.snp.bottom).offset(Padding.medium)
                make.centerX.equalToSuperview()
            }
            codeLabel.code = code.transferCode
            createdAtLabel.text = UBLocalized.wallet_transfer_code_createdat.replacingOccurrences(of: "{DATE}", with: DateFormatter.ub_dayTimeString(from: code.created))
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundImageBackgroundView.layer.cornerRadius = roundImageBackgroundView.frame.size.height * 0.5
    }
}
