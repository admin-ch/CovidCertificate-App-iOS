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

    init() {
        super.init(color: .cc_blue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupInteraction()

        UIStateManager.shared.addObserver(self) { [weak self] s in
            guard let strongSelf = self else { return }
            strongSelf.state = s.certificateState.certificates.count == 0 ? .onboarding : .certificates
            strongSelf.infoBox = s.infoBoxState
        }
    }

    // MARK: - Update

    private func updateState(_ animated: Bool) {
        let actions = {
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
        onboardingViewController.addTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
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

        bottomView.addButtonCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = WalletScannerViewController()
            vc.presentInNavigationController(from: strongSelf)
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

        updateState(false)
    }
}
