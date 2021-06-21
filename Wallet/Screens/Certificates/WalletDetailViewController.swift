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

class WalletDetailViewController: ViewController {
    private let certificateDetailVC: CertificateDetailViewController
    private let transferCodeDetailVC: TransferCodeDetailViewController
    private let loadingView = LoadingView()

    private var certificate: UserCertificate

    // MARK: - Init

    init(certificate: UserCertificate) {
        self.certificate = certificate
        certificateDetailVC = CertificateDetailViewController(certificate: certificate)
        transferCodeDetailVC = TransferCodeDetailViewController(certificate: certificate)
        super.init()
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupInteraction()

        update(animated: false)

        addDismissButton()

        UIStateManager.shared.addObserver(self) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.startDownloadIfNeeded()
        }
    }

    // MARK: - Setup

    private func setup() {
        addSubviewController(certificateDetailVC)
        addSubviewController(transferCodeDetailVC)

        view.addSubview(loadingView)

        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupInteraction() {
        transferCodeDetailVC.refreshCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.startDownloadIfNeeded()
        }
    }

    // MARK: - Download

    private func startDownloadIfNeeded() {
        // only start if it's a not failed transfer-code
        guard certificate.type == .transferCode,
              let transferCode = certificate.transferCode,
              transferCode.state != .failed
        else { return }

        certificateDetailVC.view.alpha = 0.0
        transferCodeDetailVC.view.alpha = 0.0
        loadingView.alpha = 1.0

        loadingView.startLoading()

        TransferManager.shared.addObserver(self, for: transferCode.transferCode) { [weak self] result in
            guard let strongSelf = self else { return }

            switch result {
            case let .success(certificate):
                // TransferManager adds all the certificates, so we
                // just update the UI with the first certificate or
                // update date
                if certificate.count > 0 {
                    strongSelf.certificate.qrCode = certificate.first?.cert
                    strongSelf.certificateDetailVC.certificate = strongSelf.certificate
                } else {
                    strongSelf.transferCodeDetailVC.updateDate = Date()
                }

            case let .failure(error):
                // update error
                strongSelf.transferCodeDetailVC.error = error
            }

            strongSelf.loadingView.stopLoading()
            strongSelf.update(animated: true)

            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }

    private func update(animated: Bool) {
        // switch animatable states
        let actions = {
            switch self.certificate.type {
            case .certificate:
                self.title = self.certificateDetailVC.title
                self.certificateDetailVC.view.alpha = 1.0
                self.transferCodeDetailVC.view.alpha = 0.0
            case .transferCode:
                self.title = self.transferCodeDetailVC.title
                self.certificateDetailVC.view.alpha = 0.0
                self.transferCodeDetailVC.view.alpha = 1.0
            }
        }

        if animated {
            UIView.animate(withDuration: 0.2) {
                actions()
            }
        } else {
            actions()
        }
    }
}
