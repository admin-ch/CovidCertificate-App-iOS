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
import UIKit
import UserNotifications

extension Notification.Name {
    static let userScannedWithUnknownMode = Notification.Name(rawValue: "ch.admin.bag.covidcertificate.verifier.unknown.mode")
}

class VerifierHomescreenViewController: HomescreenBaseViewController {
    // MARK: - Init

    init() {
        super.init(color: .cc_greyish)
    }

    // MARK: - Subviews

    private let headerLabel = Label(.uppercaseBold, textColor: .cc_grey, textAlignment: .center)

    private let bottomView = VerifierHomescreenBottomView()

    private let titleLabel = Label(.hero, textAlignment: .center)

    private let checkButton = Button(titleKey: .verifier_homescreen_scan_button, style: .normal(.cc_blue))

    private let modePopupView = VerifyModePopUpView()
    private var modePopupIsShown: Bool = false

    private let infoButtonContainerView = UIView()
    private let infoButton = LeadingTrailingIconButton(text: "", trailingIcon: UIImage(named: "ic-info-outline")?.ub_image(with: .cc_blue), hasBorder: false)
    private var infoPopupView: IconTextInfoBoxView?

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

            if CheckModesHelper.onlyOneMode() {
                strongSelf.mode = CheckModesHelper.allModes().first
            }

            strongSelf.updateUI()
        }

        NotificationCenter.default.addObserver(self, selector: #selector(userScannedWithUnknownMode), name: .userScannedWithUnknownMode, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.bringSubviewToFront(modePopupView)
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

        let titleInfoStackView = UIStackView()
        titleInfoStackView.spacing = p
        titleInfoStackView.axis = .vertical

        view.addSubview(titleInfoStackView)
        titleInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(Padding.medium)
            make.left.right.equalToSuperview()
        }

        titleInfoStackView.addArrangedViewCentered(titleLabel)

        infoButtonContainerView.addSubview(infoButton)
        infoButton.snp.makeConstraints { make in
            make.centerX.top.bottom.equalToSuperview()
            make.right.lessThanOrEqualToSuperview()
            make.left.greaterThanOrEqualToSuperview()
        }

        infoButtonContainerView.ub_setHidden(true)

        titleInfoStackView.addArrangedViewCentered(infoButtonContainerView)

        view.addSubview(bottomView)

        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }

        let v = UIView()
        view.addSubview(v)

        v.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleInfoStackView.snp.bottom).offset(Padding.large)
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
            make.left.greaterThanOrEqualToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualToSuperview().inset(Padding.medium)
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

            strongSelf.modePopupView.selectedKey = strongSelf.mode?.id
            strongSelf.modePopupView.presentFrom(view: button)
        }

        modePopupView.chooseCallback = { modeKey in
            VerifierUserStorage.shared.checkModeKey = modeKey
        }

        modePopupView.showCallback = { [weak self] show in
            guard let strongSelf = self else { return }
            strongSelf.modePopupIsShown = show
        }

        infoButton.touchUpCallback = { [weak self] in
            guard let self = self else { return }
            self.presentInfoBox()
        }
    }

    private func updateUI() {
        if VerifierUserStorage.shared.checkModeNeedsUpdate() {
            VerifierUserStorage.shared.checkModeKey = nil
            return
        }

        bottomView.setMode(mode: mode)

        let title = (mode == nil || CheckModesHelper.onlyOneMode()) ? UBLocalized.verifier_homescreen_scan_button : UBLocalized.verifier_homescreen_scan_button_with_mode

        checkButton.title = title.replacingOccurrences(of: "{MODE}", with: mode?.displayName ?? "")

        var hasInfoButton = false
        if let config = ConfigManager.currentConfig {
            hasInfoButton = config.hasNews
        }

        infoButton.text = ConfigManager.currentConfig?.covidCertificateNewsText?.value
        infoButtonContainerView.ub_setHidden(!hasInfoButton)

        if shouldShowNewsInfoBox() {
            presentInfoBox()
        }
    }

    @objc private func userScannedWithUnknownMode() {
        VerifierUserStorage.shared.checkModeKey = nil
        presentedViewController?.dismiss(animated: true, completion: nil)

        let alert = UIAlertController(title: nil, message: UBLocalized.verifier_error_mode_no_longer_exists, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: UBLocalized.ok_button, style: .default))
        present(alert, animated: true)
    }

    private func shouldShowNewsInfoBox() -> Bool {
        // check if there are news
        guard let config = ConfigManager.currentConfig, config.hasNews else { return false }

        if let lastNews = VerifierUserStorage.shared.lastShownNews, let key = config.newsKey,
           key == lastNews {
            return false
        }

        return true
    }

    private func presentInfoBox() {
        guard let config = ConfigManager.currentConfig,
              let news = config.infoCovidCertificateNews?.value
        else { return }

        VerifierUserStorage.shared.lastShownNews = config.newsKey

        infoPopupView?.removeFromSuperview()
        let iconTexts: [IconText] = news.newsItems.compactMap {
            guard let img = UIImage(named: $0.iconIos) else { return nil }
            return IconText(text: $0.text, icon: img, iconAccessibility: nil)
        }

        infoPopupView = IconTextInfoBoxView(title: news.title, iconTextSource: iconTexts, imageHeight: 24.0)
        infoPopupView?.addAndPresent(to: view, from: infoButton)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
