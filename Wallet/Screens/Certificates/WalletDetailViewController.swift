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

    private let certificate: UserCertificate

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
        update(animated: false)

        addDismissButton()
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
