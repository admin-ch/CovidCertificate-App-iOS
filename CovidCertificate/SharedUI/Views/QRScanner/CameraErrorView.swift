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

class CameraErrorView: UIView {
    // MARK: - Subviews

    private let titleLabel = Label(.title, textAlignment: .center)
    private let errorLabel = Label(.text, textAlignment: .center)
    private let button = Button(titleKey: .ios_settings_open)

    private let centerYAxis: Bool
    private let isSmall: Bool

    // MARK: - Init

    init(backgroundColor: UIColor, center: Bool = false, isSmall: Bool = false) {
        centerYAxis = center
        self.isSmall = isSmall
        super.init(frame: .zero)

        self.backgroundColor = backgroundColor

        setup()

        button.touchUpCallback = {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        titleLabel.text = UBLocalized.error_camera_permission_title
        errorLabel.text = UBLocalized.error_camera_permission_text

        let contentView = UIView()
        contentView.layer.cornerRadius = 20.0
        contentView.backgroundColor = .cc_white
        addSubview(contentView)

        if centerYAxis {
            contentView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.right.equalToSuperview().inset(Padding.large)
                make.bottom.lessThanOrEqualToSuperview()
            }
        } else {
            contentView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(isSmall ? Padding.large : 2.0 * Padding.large)
                make.left.right.equalToSuperview().inset(Padding.large)
                make.bottom.lessThanOrEqualToSuperview()
            }
        }

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Padding.medium

        contentView.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Padding.large)
        }

        stackView.addArrangedView(titleLabel)
        stackView.addArrangedView(errorLabel)

        let v = UIView()
        v.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.medium)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().priority(.medium)
            make.right.lessThanOrEqualToSuperview().priority(.medium)
        }

        stackView.addArrangedView(v)
    }
}
