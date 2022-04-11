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

class TransferCodeErrorRetryViewController: StackScrollViewController {
    private let titleLabel = Label(.title, textAlignment: .center)

    private let errorView = TransferCodeErrorView()

    private let retryButton = Button(titleKey: .error_action_retry, style: .normal(.cc_blue))

    private let insets = UIEdgeInsets(top: 0, left: 2 * Padding.medium, bottom: 0, right: 2 * Padding.medium)

    // MARK: - Error

    public var retryCallback: (() -> Void)?

    public var error: TransferError? {
        didSet { self.update() }
    }

    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        retryButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.retryCallback?()
        }
    }

    private func setup() {
        titleLabel.text = UBLocalized.wallet_transfer_code_error_title

        addArrangedView(titleLabel, insets: insets)

        stackScrollView.addSpacerView(3.0 * Padding.medium)

        addArrangedView(errorView, insets: insets)

        stackScrollView.addSpacerView(Padding.medium + Padding.large)

        addArrangedView(retryButton, insets: insets)

        stackScrollView.addSpacerView(Padding.large)
    }

    // MARK: - Update

    private func update() {
        errorView.error = error
    }
}
