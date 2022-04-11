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

class TransferCodeNotificationDisabledView: UIView {
    private let iconView = UIImageView(image: UIImage(named: "ic-push"))
    private let titleLabel = Label(.textBoldLarge, textColor: .cc_blue)
    private let textLabel = Label(.text)
    private let button = Button(titleKey: .wallet_notification_disabled_button, style: .normal(.cc_blue))

    var openSettingsCallback: (() -> Void)? {
        didSet {
            button.touchUpCallback = openSettingsCallback
        }
    }

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        backgroundColor = .cc_blueish
        layer.cornerRadius = 10

        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(button)

        iconView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(Padding.medium)
        }
        iconView.ub_setContentPriorityRequired()

        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Padding.medium)
            make.top.equalTo(iconView.snp.bottom).inset(-Padding.medium)
        }
        titleLabel.text = UBLocalized.wallet_notification_disabled_titel

        textLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Padding.medium)
            make.top.equalTo(titleLabel.snp.bottom).inset(-Padding.medium)
        }
        textLabel.text = UBLocalized.wallet_notification_permission_text

        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(Padding.medium)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().offset(Padding.medium)
            make.right.lessThanOrEqualToSuperview().offset(-Padding.medium)
            make.top.equalTo(textLabel.snp.bottom).inset(-Padding.large)
        }
    }
}
