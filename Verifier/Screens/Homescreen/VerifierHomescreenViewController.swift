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

class VerifierHomescreenViewController: HomescreenBaseViewController {
    // MARK: - Init

    init() {
        super.init(color: .cc_greyish)
    }

    // MARK: - Subviews

    private let headerLabel = Label(.uppercaseBold, textColor: .cc_grey, textAlignment: .center)

    private let titleLabel = Label(.hero, textAlignment: .center)

    private let checkButton = Button(title: UBLocalized.verifier_homescreen_scan_button, style: .normal(.cc_blue))
    private let supportButton = Button(title: UBLocalized.verifier_homescreen_support_button, style: .text(.cc_blue))

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupInteraction()

        UIStateManager.shared.addObserver(self) { [weak self] state in
            guard let strongSelf = self else { return }
            strongSelf.infoBox = state.infoBoxState
        }
    }

    // MARK: - Setup

    private func setupViews() {
        let isSmall = view.frame.size.width <= 375
        let isUltraSmall = view.frame.size.width <= 320

        view.addSubview(supportButton)

        supportButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(isUltraSmall ? Padding.large : 2.0 * Padding.large + Padding.small)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().inset(Padding.large)
            make.right.lessThanOrEqualToSuperview().inset(Padding.large)
        }

        view.addSubview(checkButton)

        checkButton.snp.makeConstraints { make in
            make.bottom.equalTo(supportButton.snp.top).offset(isSmall ? (isUltraSmall ? -Padding.medium : -Padding.large) : -2.0 * Padding.large)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().inset(Padding.large)
            make.right.lessThanOrEqualToSuperview().inset(Padding.large)
        }

        let p = Padding.large + Padding.medium
        view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(p)
            make.top.equalTo(self.backgroundTopLayoutGuide).offset(Padding.large)
        }

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(Padding.medium)
            make.left.right.equalToSuperview().inset(p)
        }

        let v = UIView()
        view.addSubview(v)

        v.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(Padding.large)
            make.bottom.equalTo(checkButton.snp.top).offset(isUltraSmall ? 0 : -Padding.large)
        }

        let infoVC = VerifierHomescreenInfoViewController()
        v.addSubview(infoVC)
        infoVC.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }

        headerLabel.text = UBLocalized.verifier_homescreen_header_title
        titleLabel.text = UBLocalized.verifier_homescreen_title
    }

    private func setupInteraction() {
        supportButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = BasicStaticContentViewController(models: ConfigManager.currentConfig?.viewModels ?? [], title: UBLocalized.verifier_support_header.uppercased())
            vc.presentInNavigationController(from: strongSelf)
        }

        checkButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = VerifyViewController()
            vc.modalPresentationStyle = .fullScreen

            strongSelf.present(vc, animated: true)
        }

        infoButtonCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = VerifierImprintViewController()
            vc.presentInNavigationController(from: strongSelf)
        }
    }
}
