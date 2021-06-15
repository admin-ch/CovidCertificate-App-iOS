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

enum HomescreenState {
    case onboarding
    case certificates
}

class WalletHomescreenViewController: HomescreenBaseViewController {
    // MARK: - Screens

    private var state: HomescreenState = .onboarding {
        didSet {
            updateState(true)
        }
    }

    let onboardingViewController = HomescreenOnboardingViewController()
    let certificatesViewController = HomescreenCertificatesViewController()

    let bottomView = HomescreenBottomView()

    let addCertificateButton = Button(image: UIImage(named: "ic-add-certificate"), accessibilityName: UBLocalized.accessibility_add_button)
    private var actionViewIsShown = false

    let actionPopupView = WalletHomescreenActionPopupView()

    init() {
        super.init(color: .cc_blue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UIStateManager.shared.addObserver(self) { [weak self] s in
            guard let strongSelf = self else { return }
            strongSelf.state = s.certificateState.certificates.count == 0 ? .onboarding : .certificates
            strongSelf.infoBox = s.infoBoxState
        }

        setupViews()
        setupInteraction()
    }

    // MARK: - Update

    private func updateState(_ animated: Bool) {
        let actions = {
            self.addCertificateButton.alpha = self.state == .onboarding ? 0.0 : 1.0
            self.certificatesViewController.view.alpha = self.state == .certificates ? 1.0 : 0.0
            self.onboardingViewController.view.alpha = self.state == .onboarding ? 1.0 : 0.0

            self.backgroundViewOffset = self.state == .certificates ? CGPoint(x: -Padding.large, y: 170.0) : .zero

            self.bottomView.state = self.state
        }

        if animated {
            UIView.animate(withDuration: 0.3) {
                actions()
            } completion: { _ in }
        } else {
            actions()
        }
    }

    // MARK: - Setup

    private func setupInteraction() {
        onboardingViewController.addCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = WalletScannerViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        actionPopupView.addCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.actionPopupView.dismiss()

            let vc = WalletScannerViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        onboardingViewController.addTransferCodeTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            // TODO: add correct viewcontroller
            let vc = ViewController()
            vc.addDismissButton()
            vc.presentInNavigationController(from: strongSelf)
        }

        actionPopupView.addTransferCodeTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.actionPopupView.dismiss()

            let vc = WalletScannerViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        bottomView.faqButtonCallback = { [weak self] in
            guard let strongSelf = self else { return }

            let vc = BasicStaticContentViewController(models: ConfigManager.currentConfig?.viewModels ?? [], title: UBLocalized.wallet_faq_header.uppercased())
            vc.presentInNavigationController(from: strongSelf)
        }

        bottomView.listButtonCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = CertificateListViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        addCertificateButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            if strongSelf.actionViewIsShown {
                strongSelf.actionPopupView.dismiss()
            } else {
                strongSelf.actionPopupView.presentFrom(view: strongSelf.addCertificateButton)
            }
        }

        actionPopupView.showCallback = { [weak self] show in
            guard let strongSelf = self else { return }
            strongSelf.actionViewIsShown = show

            UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseInOut]) {
                strongSelf.addCertificateButton.transform = CGAffineTransform(rotationAngle: show ? CGFloat.pi * 0.25 : 0.0)
            } completion: { _ in }
        }

        infoButtonCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = WalletImprintViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        certificatesViewController.touchedCertificateCallback = { [weak self] cert in
            guard let strongSelf = self else { return }
            let vc = CertificateDetailViewController(certificate: cert)
            vc.presentInNavigationController(from: strongSelf)
        }
    }

    private func setupViews() {
        view.addSubview(bottomView)

        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }

        addSubviewController(onboardingViewController) { make in
            make.top.equalTo(self.backgroundTopLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomView.snp.top)
        }

        addSubviewController(certificatesViewController) { make in
            make.top.equalTo(self.backgroundTopLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomView.snp.top)
        }

        view.addSubview(actionPopupView)
        actionPopupView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.addSubview(addCertificateButton)
        addCertificateButton.snp.makeConstraints { make in
            make.center.equalTo(self.bottomView.addButtonGuide.snp.center)
        }

        updateState(false)
    }
}
