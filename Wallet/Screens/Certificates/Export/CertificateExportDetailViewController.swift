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

class CertificateExportDetailViewController: StackScrollViewController {
    private let loadingView = LoadingView()
    private let errorRetryVC = NetworkErrorRetryViewController(title: UBLocalized.wallet_certificate_export_detail_error_title)
    private let summary = CertificateExportSummaryView()
    private let certificate: UserCertificate

    var sharePDFCallback: ((Data) -> Void)?

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = UBLocalized.wallet_certificate.uppercased()
        view.backgroundColor = .cc_background
        setupLayout()
        setupInteractions()
    }

    func setupInteractions() {
        summary.exportCallback = { [weak self] in
            guard let self = self else { return }
            self.getPDF()
        }
        errorRetryVC.retryCallback = { [weak self] in
            guard let self = self else { return }
            self.getPDF()
        }
    }

    func setupLayout() {
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        addSubviewController(errorRetryVC) { make in
            make.edges.equalToSuperview()
        }
        errorRetryVC.view.backgroundColor = .cc_background
        errorRetryVC.view.alpha = 0

        let p = Padding.large + Padding.medium

        let title = Label(.title, textAlignment: .center)
        title.text = UBLocalized.wallet_certificate_export_title
        addArrangedView(title,
                        insets: UIEdgeInsets(top: 0, left: p, bottom: 0, right: p))

        addArrangedView(summary,
                        insets: UIEdgeInsets(top: Padding.large, left: Padding.medium, bottom: 0, right: Padding.medium))
    }

    func getPDF() {
        guard let qrCode = certificate.qrCode else { return }
        UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
            self.loadingView.startLoading()
            self.errorRetryVC.view.alpha = 0.0
        }, completion: nil)
        TransformationService.getPdf(qrCode: qrCode) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case let .success(pdf):
                    self.loadingView.stopLoading()
                    self.navigationController?.popViewController(animated: true) { [weak self] in
                        guard let self = self else { return }
                        self.sharePDFCallback?(pdf)
                    }

                case let .failure(error):
                    self.errorRetryVC.error = error

                    self.loadingView.stopLoading()

                    UIView.animate(withDuration: 0.25) {
                        self.errorRetryVC.view.alpha = 1.0
                    }
                }
            }
        }
    }
}
