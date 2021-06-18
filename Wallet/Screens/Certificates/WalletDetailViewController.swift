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

        addSubviewController(certificateDetailVC)
        addSubviewController(transferCodeDetailVC)

        view.addSubview(loadingView)

        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        update(animated: false)

        addDismissButton()

        UIStateManager.shared.addObserver(self) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.startDownloadIfNeeded()
        }
    }

    private func startDownloadIfNeeded() {
        guard let code = certificate.transferCode?.transferCode,
              certificate.type == .transferCode
        else { return }

        certificateDetailVC.view.alpha = 0.0
        transferCodeDetailVC.view.alpha = 0.0
        loadingView.alpha = 1.0

        loadingView.startLoading()

        TransferManager.shared.addObserver(self, for: code) { [weak self] result in
            guard let strongSelf = self else { return }

            switch result {
            case let .success(certificate):
                strongSelf.certificate.qrCode = certificate.first?.cert
                strongSelf.certificateDetailVC.certificate = strongSelf.certificate
                CertificateStorage.shared.updateCertificate(with: code, qrCode: certificate.first?.cert)

            case let .failure(error):
                switch error {
                case .GET_CERTIFICATE_FAILED:
                    strongSelf.transferCodeDetailVC.updateDate = Date()
                default:
                    strongSelf.transferCodeDetailVC.error = error
                }
            }

            strongSelf.loadingView.stopLoading()
            strongSelf.update(animated: true)
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
