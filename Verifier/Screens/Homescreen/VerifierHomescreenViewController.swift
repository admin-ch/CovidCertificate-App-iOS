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

    private let bottomView = VerifierHomescreenBottomView()

    private let titleLabel = Label(.hero, textAlignment: .center)

    private let checkButton = Button(title: UBLocalized.verifier_homescreen_scan_button, style: .normal(.cc_blue))

    private let modePopupView = VerifyModePopUpView()

    private var mode: CheckModeUIObject?

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupInteraction()

        UIStateManager.shared.addObserver(self) { [weak self] state in
            guard let strongSelf = self else { return }
            strongSelf.infoBox = state.infoBoxState
            strongSelf.mode = CheckModesHelper.mode(for: state.checkMode.key)
            strongSelf.updateUI()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showModeSelectionIfNeeded()
    }

    // MARK: - Setup

    private func setupViews() {
        let isSmall = view.frame.size.width <= 375
        let isUltraSmall = view.frame.size.width <= 320

        view.addSubview(checkButton)

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

        view.addSubview(bottomView)

        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }

        let v = UIView()
        view.addSubview(v)

        v.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(Padding.large)
            make.bottom.equalToSuperview().offset(-4.0 * Padding.large)
        }

        let infoVC = VerifierHomescreenInfoView()

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = (isSmall ? (isUltraSmall ? Padding.small : Padding.medium) : Padding.large)

        stackView.addArrangedSubview(infoVC)

        let checkContainer = UIView()
        checkContainer.addSubview(checkButton)
        checkButton.snp.makeConstraints { make in
            make.centerX.top.bottom.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }

        stackView.addArrangedView(checkContainer)

        v.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }

        headerLabel.text = UBLocalized.verifier_homescreen_header_title
        titleLabel.text = UBLocalized.verifier_homescreen_title

        view.addSubview(modePopupView)
        modePopupView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupInteraction() {
        checkButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = VerifyViewController(mode: strongSelf.mode)
            vc.modalPresentationStyle = .fullScreen

            strongSelf.present(vc, animated: true)
        }

        infoButtonCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = VerifierImprintViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        bottomView.faqButtonCallback = { [weak self] in
            guard let strongSelf = self else { return }

            let vc = BasicStaticContentViewController(models: ConfigManager.currentConfig?.viewModels ?? [], title: UBLocalized.verifier_support_header.uppercased())
            vc.presentInNavigationController(from: strongSelf)
        }

        bottomView.modeButtonCallback = { [weak self] button in
            guard let strongSelf = self else { return }

            strongSelf.modePopupView.presentFrom(view: button)
        }

        modePopupView.chooseCallback = { modeKey in
            VerifierUserStorage.shared.checkModeKey = modeKey
        }
    }

    private func updateUI() {
        if VerifierUserStorage.shared.checkModeNeedsUpdate() {
            VerifierUserStorage.shared.checkModeKey = nil
            return
        }

        bottomView.setMode(mode: mode)

        let title = mode == nil ? UBLocalized.verifier_homescreen_scan_button : UBLocalized.verifier_homescreen_scan_button_with_mode

        checkButton.title = title.replacingOccurrences(of: "{MODE}", with: mode?.displayName ?? "")
    }

    private func showModeSelectionIfNeeded() {
//        if VerifierUserStorage.shared.lastCheckModeSetDate == nil {
//            modePopupView.presentFrom(view: view, point: view.center)
//        }
    }
}
