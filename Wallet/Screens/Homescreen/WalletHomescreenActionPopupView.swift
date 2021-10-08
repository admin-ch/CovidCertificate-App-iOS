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

class WalletHomescreenActionPopupView: PopupView {
    // MARK: - Subviews

    public let actionView = WalletHomescreenActionView()

    // MARK: - API

    public var addQRCertificateTouchUpCallback: (() -> Void)?
    public var addPDFCertificateTouchUpCallback: (() -> Void)?
    public var addTransferCodeTouchUpCallback: (() -> Void)?
    public var showVaccinationAppointmentInformationTouchUpCallback: (() -> Void)?

    public var isVaccinationButtonHidden: Bool = true {
        didSet {
            actionView.isVaccinationButtonHidden = isVaccinationButtonHidden
        }
    }

    // MARK: - Setup

    override func layoutSubviews() {
        super.layoutSubviews()

        let isUltraSmall = frame.size.width <= 320
        let bottomInset = isUltraSmall ? 3.0 * Padding.large + Padding.medium : 5.0 * Padding.large + Padding.medium

        contentView.snp.remakeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(Padding.small)
            make.bottom.equalToSuperview().inset(bottomInset)
            make.left.right.equalToSuperview().inset(Padding.large)
        }
    }

    override func setup() {
        super.setup()

        let stackScrollView = StackScrollView()
        stackScrollView.addArrangedView(actionView)
        stackScrollView.scrollView.alwaysBounceVertical = false

        contentView.addSubview(stackScrollView)

        stackScrollView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualToSuperview().priority(.medium)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(actionView).priority(.low)
        }

        actionView.addQRCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addQRCertificateTouchUpCallback?()
        }

        actionView.addPDFCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addPDFCertificateTouchUpCallback?()
        }

        actionView.addTransferCodeTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addTransferCodeTouchUpCallback?()
        }

        actionView.showVaccinationAppointmentInformationTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showVaccinationAppointmentInformationTouchUpCallback?()
        }
    }
}
