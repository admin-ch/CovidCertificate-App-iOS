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

import CovidCertificateSDK
import Foundation

protocol ErrorViewError {
    func icon(color: UIColor?) -> UIImage?
    var errorTitle: String { get }
    var errorText: String { get }
    var errorCode: String { get }
}

class NetworkErrorRetryViewController: StackScrollViewController {
    private let titleLabel = Label(.title, textAlignment: .center)

    private let errorView = ErrorView()

    private let retryButton = Button(titleKey: .error_action_retry, style: .normal(.cc_blue))

    private let insets = UIEdgeInsets(top: 0, left: 2 * Padding.medium, bottom: 0, right: 2 * Padding.medium)

    // MARK: - Error

    public var retryCallback: (() -> Void)?

    public var error: ErrorViewError? {
        didSet { update() }
    }

    // MARK: - Setup

    init(title: String) {
        titleLabel.text = title
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        retryButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.retryCallback?()
        }
    }

    private func setup() {
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
