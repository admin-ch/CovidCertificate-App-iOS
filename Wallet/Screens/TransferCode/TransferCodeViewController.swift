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

class TransferCodeViewController: ViewController {

    private let infoVC = TransferCodeOnboardingViewController()
    private let nextStepsVC = TransferCodeNextStepsViewController()
    private let errorRetryVC = TransferCodeErrorRetryViewController()

    private let loadingView = LoadingView()

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        title = UBLocalized.wallet_transfer_code_card_title.uppercased()
        addDismissButton()

        addChildViewControllers()
        setupInteraction()
    }

    // MARK: - Setup

    private func addChildViewControllers() {
        addSubviewController(infoVC)
        addSubviewController(nextStepsVC)
        addSubviewController(errorRetryVC)

        view.addSubview(loadingView)

        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        nextStepsVC.view.alpha = 0
        errorRetryVC.view.alpha = 0
        loadingView.alpha = 0.0
    }

    private func setupInteraction() {
        infoVC.createCodeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.startLoading()
        }

        errorRetryVC.retryCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.startLoading()
        }
    }

    // MARK: - Start

    private func startLoading() {
        loadingView.startLoading()

        UIView.animate(withDuration: 0.25) {
            self.infoVC.view.alpha = 0
            self.errorRetryVC.view.alpha = 0.0
            self.nextStepsVC.view.alpha = 0.0
        }

        InAppDelivery.shared.registerNewCode { [weak self] result in
            guard let strongSelf = self else { return }

            switch result {
            case let .success(code):
                let code = UserTransferCode(transferCode: code, created: Date())
                let cert = UserCertificate(qrCode: nil, transferCode: code)
                CertificateStorage.shared.insertCertificate(userCertificate: cert)
                strongSelf.nextStepsVC.transferCode = code

                UIView.animate(withDuration: 0.25) {
                    strongSelf.nextStepsVC.view.alpha = 1.0
                }

            case let .failure(error):
                strongSelf.errorRetryVC.error = error

                UIView.animate(withDuration: 0.25) {
                    strongSelf.errorRetryVC.view.alpha = 1.0
                }
            }

            strongSelf.loadingView.stopLoading()
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }
}
