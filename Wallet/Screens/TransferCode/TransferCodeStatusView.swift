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

    private let titleValidStackView = UIStackView()

    private let expiredLabel = Label(.title, textAlignment: .center)
    let contactSupportView = ContactSupportView()
    private let titleLabel = Label(.textBold, textAlignment: .center)
    private let validLabel = Label(.text, textColor: .cc_blue, textAlignment: .center)

    private let codeLabel = TransferCodeLabel()
    private let codeContainer = UIView()

    private let createdAtLabel = Label(.text, textAlignment: .center)

    private let errorCorner = UIImageView()

    private var isNewlyCreated: Bool

    var transferCode: UserTransferCode? {
        didSet { update() }
    }

    var error: TransferError? {
        didSet { update() }
    }

    init(isNewlyCreated: Bool = false) {
        self.isNewlyCreated = isNewlyCreated
        super.init(frame: .zero)
        isAccessibilityElement = true

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

        titleValidStackView.axis = .vertical
        titleValidStackView.spacing = 0.0
        titleValidStackView.addArrangedSubview(titleLabel)
        titleValidStackView.addArrangedSubview(validLabel)
        titleValidStackView.addArrangedSubview(codeContainer)
        titleValidStackView.addArrangedSubview(expiredLabel)
        titleValidStackView.addArrangedSubview(contactSupportView)
        contactSupportView.ub_setHidden(true)
        titleValidStackView.ub_setContentPriorityRequired()

        codeContainer.addSubview(codeLabel)
        codeLabel.snp.makeConstraints { make in
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
            make.top.equalToSuperview().inset(Padding.medium)
            make.centerX.bottom.equalToSuperview()
        }

        addSubview(titleValidStackView)

        titleValidStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Padding.medium)
            make.top.equalTo(imageView.snp.bottom).offset(10)
        }

        createdAtLabel.snp.makeConstraints { make in
            make.top.equalTo(titleValidStackView.snp.bottom).offset(Padding.medium)
            make.leading.trailing.equalToSuperview().inset(Padding.medium)
            make.bottom.equalToSuperview().inset(Padding.medium)
        }

        errorCorner.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
        }

        errorCorner.alpha = 0.0

        let p = UILayoutPriority.defaultMedium
        let p2 = UILayoutPriority(rawValue: p.rawValue + 50.0)
        createdAtLabel.setContentCompressionResistancePriority(p, for: .vertical)
        validLabel.setContentCompressionResistancePriority(p2, for: .vertical)
    }

    private func update() {
        guard let code = transferCode else { return }

        let dateString = DateFormatter.ub_dayTimeString(from: code.created)
        createdAtLabel.text = UBLocalized.wallet_transfer_code_createdat.replacingOccurrences(of: "{DATE}", with: dateString)
        createdAtLabel.accessibilityLabel = UBLocalized.wallet_transfer_code_createdat.replacingOccurrences(of: "{DATE}", with: DateFormatter.ub_accessibilityDateString(dateString: dateString) ?? dateString)

        if isNewlyCreated {
            imageView.image = UIImage(named: "ic-check-mark")
            validLabel.isHidden = true
            titleLabel.isHidden = false
            titleLabel.text = UBLocalized.wallet_transfer_code_title

            codeLabel.code = code.transferCode
            expiredLabel.ub_setHidden(true)

            accessibilityLabel = [titleLabel.text, codeLabel.accessibilityLabel, createdAtLabel.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")
        } else {
            if let img = error?.cornerIcon {
                // alpha handling is done afterwards
                // and will correctly fade when icon
                // should disappear
                errorCorner.image = img
            }

            errorCorner.alpha = error?.cornerIcon == nil ? 0.0 : 1.0

            switch code.state {
            case .valid:
                imageView.image = code.validityIcon
                validLabel.ub_setHidden(false)
                titleLabel.ub_setHidden(true)
                codeContainer.ub_setHidden(false)
                expiredLabel.ub_setHidden(true)
                contactSupportView.ub_setHidden(true)
                validLabel.attributedText = code.validDaysText

                backgroundColor = .cc_blueish
                codeLabel.code = code.transferCode

                DispatchQueue.global().async {
                    TransferManager.shared.addObserver(self, for: code.transferCode) { [weak self] result in
                        DispatchQueue.main.async {
                            guard let self = self else { return }
                            switch result {
                            case let .failure(error) where !error.isRecovarable:
                                self.backgroundColor = .cc_redish
                                self.imageView.image = UIImage(named: "ic-info-outline")?.ub_image(with: .cc_red)

                                self.createdAtLabel.ub_setHidden(true)
                                self.createdAtLabel.snp.remakeConstraints { make in
                                    make.height.equalTo(0)
                                    make.top.equalTo(self.titleValidStackView.snp.bottom)
                                    make.leading.trailing.equalToSuperview()
                                    make.bottom.equalToSuperview()
                                }
                                self.validLabel.ub_setHidden(true)
                                self.titleLabel.ub_setHidden(true)
                                self.codeContainer.ub_setHidden(true)
                                self.expiredLabel.ub_setHidden(true)
                                self.contactSupportView.ub_setHidden(false)
                                self.contactSupportView.errorCode = error.errorCode
                                self.contactSupportView.transferCode = code.transferCode
                                self.expiredLabel.textColor = .cc_red

                                self.accessibilityLabel = [self.expiredLabel.text, self.codeLabel.accessibilityLabel, self.createdAtLabel.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")

                                self.errorCorner.image = nil
                                self.errorCorner.alpha = 0.0
                            default:
                                break
                            }
                        }
                    }
                }

                accessibilityLabel = [validLabel.text, codeLabel.accessibilityLabel, createdAtLabel.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")

            case .expired, .failed:
                backgroundColor = code.state == .expired ? .cc_blueish : .cc_redish
                imageView.image = UIImage(named: "ic-info-outline")?.ub_image(with: code.state == .expired ? .cc_blue : .cc_red)

                validLabel.ub_setHidden(true)
                titleLabel.ub_setHidden(true)
                codeContainer.ub_setHidden(true)
                expiredLabel.ub_setHidden(false)
                contactSupportView.ub_setHidden(true)

                expiredLabel.text = UBLocalized.wallet_transfer_code_old_code
                expiredLabel.textColor = code.state == .expired ? .cc_blue : .cc_red

                accessibilityLabel = [expiredLabel.text, codeLabel.accessibilityLabel, createdAtLabel.accessibilityLabel].compactMap { $0 }.joined(separator: ", ")

                if code.state == .failed {
                    errorCorner.image = nil
                    errorCorner.alpha = 0.0
                }
            }
        }

        layoutIfNeeded()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundImageBackgroundView.layer.cornerRadius = roundImageBackgroundView.frame.size.height * 0.5
    }
}

class ContactSupportView: UIView {
    private let textLabel = Label(.textBoldLarge, textAlignment: .center)
    let phoneNumber = ExternalLinkButton(titleKey: .wallet_transfer_code_unexpected_error_phone_number,
                                         mode: .phone,
                                         tintColor: .cc_red)
    private let transfercodeLabel = Label(.smallError, textColor: .cc_greyText, textAlignment: .center)
    private let errorLabel = Label(.smallErrorLight, textAlignment: .center)

    var errorCode: String? {
        didSet {
            errorLabel.text = errorCode ?? ""
        }
    }

    var transferCode: String? {
        didSet {
            transfercodeLabel.text = UBLocalized.wallet_transfer_code_title + ": " + (transferCode ?? "")
        }
    }

    init() {
        super.init(frame: .zero)
        textLabel.text = UBLocalized.wallet_transfer_code_unexpected_error_text

        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }

        addSubview(phoneNumber)
        phoneNumber.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(textLabel.snp.bottom).inset(-Padding.small)
        }

        addSubview(transfercodeLabel)
        transfercodeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(phoneNumber.snp.bottom).inset(-Padding.medium)
        }

        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(Padding.medium)
            make.top.equalTo(transfercodeLabel.snp.bottom).inset(-Padding.small)
        }

        phoneNumber.touchUpCallback = {
            PhoneCallHelper.call(UBLocalized.wallet_transfer_code_unexpected_error_phone_number)
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
