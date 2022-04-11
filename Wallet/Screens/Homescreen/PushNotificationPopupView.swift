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

class PushNotificationPopUpView: PopupView {
    // MARK: - Subviews

    private let stackView = UIStackView()

    private let imageView = UIImageView(image: UIImage(named: "illu-notification"))
    private let titleLabel = Label(.title, textAlignment: .center)
    private let textLabel = Label(.text, textAlignment: .center)
    private let button = Button(titleKey: .continue_button, style: .normal(.cc_blue))

    private var buttonView = UIView()

    init() {
        super.init(enableBackgroundDismiss: false)
    }

    // MARK: - Setup

    override internal func setup() {
        super.setup()

        contentView.backgroundColor = .cc_white
        contentView.layer.cornerRadius = 20.0

        addSubview(contentView)

        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Padding.large)
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().inset(3.0 * Padding.large)
            make.bottom.lessThanOrEqualToSuperview().inset(3.0 * Padding.large)
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(Padding.large)
            make.bottom.equalToSuperview().inset(Padding.medium)
        }

        stackView.axis = .vertical

        stackView.addSpacerView(Padding.medium)

        imageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(imageView)

        stackView.addSpacerView(Padding.medium + Padding.small + 2.0)

        titleLabel.text = UBLocalized.wallet_notification_permission_title
        stackView.addArrangedView(titleLabel)
        titleLabel.ub_setContentPriorityRequired()

        stackView.addSpacerView(Padding.medium + Padding.small - 2.0)

        textLabel.text = UBLocalized.wallet_notification_permission_text
        textLabel.ub_setContentPriorityRequired()
        stackView.addArrangedView(textLabel)
        stackView.addSpacerView(Padding.medium + Padding.small + 2.0)

        buttonView.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
            make.bottom.equalToSuperview().inset(Padding.small)
        }

        stackView.addArrangedView(buttonView)

        stackView.addSpacerView(Padding.medium + Padding.small + 2.0)

        button.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.registerForPush()
            strongSelf.dismiss()
        }
    }

    // MARK: - Update

    private func registerForPush() {
        WalletUserStorage.shared.hasCompletedPushRegistration = true
        UBPushManager.shared.requestPushPermissions { result in
            if case UBPushManager.PermissionRequestResult.success = result {
                UBPushManager.shared.setActive(true)
            }
        }
    }
}
