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
import UIKit

class CertificateRenewViewController: StackScrollViewController {
    private let expiryView = CertificateRenewExpiryView()
    private let summary = CertificateRenewSummaryView()
    private let errorRetryVC = NetworkErrorRetryViewController(title: UBLocalized.wallet_certificate_light_detail_activation_error)

    private let renewButton: Button = Button(titleKey: .wallet_certificate_renew_now_button)
    private var buttonSpacer: UIView?

    private var certificate: UserCertificate
    private var isExpired: Bool

    init(certificate: UserCertificate, isExpired: Bool = true) {
        self.certificate = certificate
        self.isExpired = isExpired
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = UBLocalized.wallet_certificate.uppercased()
        view.backgroundColor = .cc_background
        setupLayout()
        setupInteractions()
        update()
    }

    func setupLayout() {
        stackScrollView.stackView.alignment = .fill

        stackScrollView.addArrangedView(expiryView)

        addArrangedView(expiryView,
                        insets: UIEdgeInsets(top: 0, left: Padding.medium, bottom: 0, right: Padding.medium))

        buttonSpacer = stackScrollView.addSpacerView(Padding.large)

        stackScrollView.stackView.addArrangedViewCentered(renewButton)

        addArrangedView(summary,
                        insets: UIEdgeInsets(top: Padding.medium, left: Padding.medium, bottom: 0, right: Padding.medium))

        stackScrollView.addSpacerView(Padding.large)
    }

    func setupInteractions() {
        errorRetryVC.retryCallback = { [weak self] in
            guard let self = self else { return }
            self.getLightCertitifate()
        }

        renewButton.touchUpCallback = { [weak self] in
            guard let self = self else { return }
            self.getLightCertitifate()
        }
    }

    func update() {
        switch CovidCertificateSDK.Wallet.decode(encodedData: certificate.qrCode ?? "") {
        case let .success(holder):
            expiryView.expiryDate = holder.displayExpiresAt

            guard let certificate = holder.certificate as? DCCCert,
                  let uvci = certificate.vaccinations?.first?.certificateIdentifier ??
                  certificate.pastInfections?.first?.certificateIdentifier ??
                  certificate.tests?.first?.certificateIdentifier else {
                assertionFailure()
                break
            }
            if !isExpired {
                RenewalHistoryManager.shared.addRenewal(uvci: uvci)
            }
        default:
            assertionFailure()
        }

        if isExpired {
            expiryView.state = .info
            summary.mode = .expired
            buttonSpacer?.isHidden = false
            renewButton.isHidden = false
            renewButton.superview?.isHidden = false
        } else {
            expiryView.state = .success
            summary.mode = .renewed
            buttonSpacer?.isHidden = true
            renewButton.isHidden = true
            renewButton.superview?.isHidden = true
        }
    }

    func getLightCertitifate() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
            self.expiryView.state = .loading
        }, completion: nil)
        TransformationManager.renewCertificate(certificate: certificate) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(newUserCertificate):
                self.certificate = newUserCertificate
                self.isExpired = false

                UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
                    self.update()
                }, completion: nil)

                let certVC = WalletDetailViewController(certificate: newUserCertificate)
                self.navigationController?.setViewControllers([certVC, self], animated: false)
                certVC.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
            case let .failure(error):
                self.expiryView.state = .error(error)
                self.renewButton.titleKey = .error_action_retry
            }
        }
    }
}
