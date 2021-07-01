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

class CertificateLightCreationViewController: StackScrollViewController {
    private let summary = CertificateLightSummaryView(isActive: false)
    private let loadingView = LoadingView()
    private let errorRetryVC = NetworkErrorRetryViewController(title: UBLocalized.wallet_certificate_light_detail_activation_error)

    private let certificate: UserCertificate

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
        title.text = UBLocalized.wallet_certificate_light_detail_title
        addArrangedView(title,
                        insets: UIEdgeInsets(top: 0, left: p, bottom: 0, right: p))

        let text = Label(.text)
        let attributedString = NSMutableAttributedString(string: UBLocalized.wallet_certificate_light_detail_text_1 + "\n\n")
        attributedString.append(UBLocalized.wallet_certificate_light_detail_text_2.formattingOccurrencesBold(UBLocalized.wallet_certificate_light_detail_text_2_bold))
        text.attributedText = attributedString

        addArrangedView(text,
                        insets: UIEdgeInsets(top: Padding.large, left: p, bottom: 0, right: p))

        addArrangedView(summary,
                        insets: UIEdgeInsets(top: Padding.large, left: Padding.medium, bottom: 0, right: Padding.medium))
    }

    func setupInteractions() {
        summary.activateCallback = { [weak self] in
            guard let self = self else { return }
            self.getLightCertitifate()
        }

        errorRetryVC.retryCallback = { [weak self] in
            guard let self = self else { return }
            self.getLightCertitifate()
        }
    }

    func getLightCertitifate() {
        UIView.animate(withDuration: 0.25) {
            self.errorRetryVC.view.alpha = 0.0
        }
        loadingView.startLoading()
        TransformationManager.getLightCertificate(certificate: certificate) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(newUserCertificate):
                self.navigationController?.setViewControllers([WalletDetailViewController(certificate: newUserCertificate)], animated: true)
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
