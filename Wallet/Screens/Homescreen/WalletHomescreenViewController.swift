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
import MobileCoreServices

enum HomescreenState {
    case onboarding
    case certificates
}

class WalletHomescreenViewController: HomescreenBaseViewController {
    // MARK: - Screens

    private var state: HomescreenState? {
        didSet {
            updateState(true)
        }
    }

    let onboardingViewController = HomescreenOnboardingViewController()
    let certificatesViewController = HomescreenCertificatesViewController()

    let bottomView = HomescreenBottomView()
    let loadingView = LoadingView(center: true, white: true)

    let addCertificateButton = Button(image: UIImage(named: "ic-add-certificate"), accessibilityKey: .accessibility_add_button)
    private var actionViewIsShown = false

    let actionPopupView = WalletHomescreenActionPopupView()

    let pushPopupView = PushNotificationPopUpView()

    let documentPickerDelegate = DocumentPickerDelegate()

    init() {
        super.init(color: .cc_blue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UIStateManager.shared.addObserver(self) { [weak self] s in
            guard let strongSelf = self else { return }
            strongSelf.state = s.certificateState.certificates.count == 0 ? .onboarding : .certificates
            strongSelf.infoBox = s.infoBoxState
            strongSelf.actionPopupView.isVaccinationButtonHidden = !s.vaccinationInfoState.showVaccinationHintHomescreen

            // show push if first time there is a transfer code
            let hasTransferCode = s.certificateState.certificates.contains(where: { $0.type == .transferCode })
            if !WalletUserStorage.shared.hasCompletedPushRegistration, hasTransferCode {
                strongSelf.pushPopupView.presentFrom(view: strongSelf.view)
                strongSelf.accessibilityElements = [strongSelf.pushPopupView]
            }
        }

        setupViews()
        setupInteraction()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkStateValidity()
    }

    // MARK: - Update

    private func updateState(_ animated: Bool) {
        let actions = {
            if let s = self.state {
                self.addCertificateButton.alpha = s == .onboarding ? 0.0 : 1.0
                self.certificatesViewController.view.alpha = s == .certificates ? 1.0 : 0.0
                self.onboardingViewController.view.alpha = s == .onboarding ? 1.0 : 0.0
                self.backgroundViewOffset = s == .certificates ? CGPoint(x: -Padding.large, y: 170.0) : .zero
                self.bottomView.state = s
                self.bottomView.alpha = 1.0
                self.loadingView.stopLoading()

            } else {
                self.loadingView.startLoading()
                self.addCertificateButton.alpha = 0.0
                self.certificatesViewController.view.alpha = 0.0
                self.onboardingViewController.view.alpha = 0.0
                self.bottomView.alpha = 0.0
            }
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
        onboardingViewController.addQRCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = WalletScannerViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        onboardingViewController.addPDFCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }

            strongSelf.openDocumentFromPDF()
        }

        actionPopupView.addQRCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.actionPopupView.dismiss()

            let vc = WalletScannerViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        actionPopupView.addPDFCertificateTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.actionPopupView.dismiss()

            strongSelf.openDocumentFromPDF()
        }

        onboardingViewController.addTransferCodeTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = TransferCodeViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        onboardingViewController.showVaccinationAppointmentInformationTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = VaccinationInformationViewController()
            vc.presentInNavigationController(from: strongSelf)
        }
        actionPopupView.addTransferCodeTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.actionPopupView.dismiss()

            let vc = TransferCodeViewController()
            vc.presentInNavigationController(from: strongSelf)
        }

        actionPopupView.showVaccinationAppointmentInformationTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.actionPopupView.dismiss()

            let vc = VaccinationInformationViewController()
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
                strongSelf.actionPopupView.presentFrom(view: strongSelf.addCertificateButton, isPresentedFromCloseButton: true)
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
            let vc = WalletDetailViewController(certificate: cert)
            vc.presentInNavigationController(from: strongSelf)
        }
    }

    private func setupViews() {
        addSubviewController(onboardingViewController) { make in
            make.top.equalTo(self.backgroundTopLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }

        view.addSubview(bottomView)

        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }

        // loading view for start of app
        view.addSubview(loadingView)
        loadingView.backgroundColor = UIColor.clear

        loadingView.snp.makeConstraints { make in
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

        view.addSubview(pushPopupView)
        pushPopupView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func openDocumentFromPDF() {
        let types: [String] = [kUTTypePDF as String]
        let documentPicker = UIDocumentPickerViewController(documentTypes: types, in: .import)
        documentPicker.allowsMultipleSelection = false
        documentPicker.delegate = documentPickerDelegate
        documentPicker.modalPresentationStyle = .formSheet
        present(documentPicker, animated: true, completion: nil)
    }

    // MARK: - Invalid State handling

    private func checkStateValidity() {
        guard let errorCode = CertificateStorage.shared.errorCode() else { return }
        let alert = UIAlertController(title: UBLocalized.error_title,
                                      message: UBLocalized.error_decryption_text.replacingOccurrences(of: "{ERROR_CODE}", with: errorCode),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: UBLocalized.error_action_retry,
                                      style: .default,
                                      handler: { [weak self] _ in
                                          self?.checkStateValidity()
                                      }))
        alert.addAction(UIAlertAction(title: UBLocalized.error_decryption_reset_button, style: .destructive, handler: { _ in
            CertificateStorage.shared.forceSave(generateNewKey: true)
        }))
        present(alert, animated: true, completion: nil)
    }
}

class DocumentPickerDelegate: NSObject, UIDocumentPickerDelegate {
    func documentPicker(_: UIDocumentPickerViewController, didPickDocumentsAt url: [URL]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let firstURL = url.first else {
            return
        }
        appDelegate.importHandler?.handle(url: firstURL)
    }
}
