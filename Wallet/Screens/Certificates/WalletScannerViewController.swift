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
import Foundation

class WalletScannerViewController: ViewController {
    // MARK: - Subviews

    private let detailViewController = CertificateAddDetailViewController()

    private var qrView: QRScannerView?
    private var qrOverlay: WalletQRScannerFullOverlayView?

    private let backgroundView = RoundBackgroundView(backgroundColor: UIColor.cc_white, down: false)

    private let imageView = UIImageView(image: UIImage(named: "ic-scan-code"))
    private let explanationLabel = Label(.textBoldLarge, textAlignment: .center)
    private let moreInfoButton = SimpleTextButton(titleKey: .wallet_scanner_info_button, color: .cc_blue)

    private let tooManyScansPopupView = InfoBoxView()

    private var isLightOn: Bool = false
    private let lightButton = ScannerLightButton.walletButton()

    private var timer: Timer?

    private var cameraErrorView: CameraErrorView?

    private var hideCompletion: (() -> Void)?

    // MARK: - Init

    override init() {
        super.init()
        title = UBLocalized.wallet_scanner_title.uppercased()
        qrView = QRScannerView(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupInteraction()

        addDismissButton()

        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.startScanning()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopScanning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startScanning()
    }

    private func setup() {
        if let qv = qrView {
            view.addSubview(qv)
            qv.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }

            let isSmall = view.frame.size.width <= 320

            var additionalInset: CGFloat = 0.0
            if !isSmall {
                additionalInset = Padding.medium
            }

            qrOverlay = WalletQRScannerFullOverlayView(additionalInset: additionalInset)
            qrOverlay?.isAccessibilityElement = true

            view.addSubview(qrOverlay!)
            qrOverlay?.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }

            cameraErrorView = CameraErrorView(backgroundColor: .cc_grey, center: false, isSmall: isSmall)
            view.addSubview(cameraErrorView!)
            cameraErrorView?.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }

            cameraErrorView?.alpha = 0.0
        }

        view.addSubview(backgroundView)

        backgroundView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        backgroundView.addSubview(explanationLabel)
        backgroundView.addSubview(imageView)

        if qrView?.canEnableTorch ?? false {
            backgroundView.addSubview(lightButton)

            lightButton.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(Padding.medium)
                make.centerY.equalTo(self.backgroundView.snp.top)
            }
        }

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.small)
            make.centerX.equalToSuperview()
        }

        explanationLabel.text = UBLocalized.wallet_scanner_explanation

        explanationLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(2.0 * Padding.small)
            make.left.right.equalToSuperview().inset(Padding.large)
        }

        backgroundView.addSubview(moreInfoButton)

        moreInfoButton.snp.makeConstraints { make in
            make.top.equalTo(explanationLabel.snp.bottom).offset(Padding.small)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().offset(Padding.medium)
            make.right.lessThanOrEqualToSuperview().offset(-Padding.medium)

            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
            if bottomPadding > 0 {
                make.bottom.equalTo(self.view.snp.bottomMargin).inset(Padding.medium)
            } else {
                make.bottom.equalToSuperview().inset(Padding.medium)
            }
        }

        addSubviewController(detailViewController) { make in
            make.edges.equalToSuperview()
        }

        detailViewController.view.alpha = 0.0

        tooManyScansPopupView.infoBox = InfoBox(title: UBLocalized.wallet_info_box_certificate_scan_title,
                                                msg: UBLocalized.wallet_info_box_certificate_scan_text,
                                                url: URL(string: UBLocalized.verifier_apple_app_store_url)!,
                                                urlTitle: UBLocalized.wallet_info_box_certificate_scan_button_check_app,
                                                infoId: nil,
                                                isDismissible: true)
        tooManyScansPopupView.closeButton.titleKey = .wallet_info_box_certificate_scan_close

        view.addSubview(tooManyScansPopupView)
        tooManyScansPopupView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupInteraction() {
        detailViewController.addOrOkCertificateTouchUpCallback = { [weak self] certificate in
            guard let strongSelf = self, let c = certificate else { return }

            CertificateStorage.shared.insertCertificate(userCertificate: c)
            strongSelf.dismiss(animated: true, completion: nil)
        }

        detailViewController.scanAgainTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.hideDetail()
        }

        moreInfoButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            let vc = BasicStaticContentViewController(models: [.howItWorks], title: UBLocalized.wallet_scanner_howitworks_header.uppercased())
            vc.presentInNavigationController(from: strongSelf)
        }

        lightButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.toggleLight()
        }
    }

    private func toggleLight() {
        isLightOn = !isLightOn
        qrView?.setCameraLight(on: isLightOn)
        lightButton.isOn = isLightOn
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.updatePath()
    }

    // MARK: - Show/hide

    private func startScanning() {
        cameraErrorView?.alpha = 0.0
        qrView?.startScanning()
        qrView?.setCameraLight(on: isLightOn)

        showError(error: nil)
    }

    private func stopScanning() {
        timer?.invalidate()
        timer = nil
        qrView?.stopScanning()
    }

    private func showDetail(certificate: UserCertificate) {
        hideCompletion = nil
        detailViewController.certificate = certificate

        showError(error: nil)

        UIView.animate(withDuration: 0.25) {
            self.detailViewController.view.alpha = 1.0
        }

        detailViewController.view.accessibilityViewIsModal = true
        UIAccessibility.post(notification: .screenChanged, argument: detailViewController.view)
    }

    private func hideDetail() {
        startScanning()

        // remove the certificate after animation, to remove
        // it from memory, however another showDetail() will
        // clear the completion because a new one is shown.
        hideCompletion = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.detailViewController.certificate = nil
        }

        UIView.animate(withDuration: 0.25) {
            self.detailViewController.view.alpha = 0.0
        } completion: { _ in
            self.hideCompletion?()
        }

        detailViewController.view.accessibilityViewIsModal = false
        UIAccessibility.post(notification: .screenChanged, argument: view)
    }

    private func showError(error: CovidCertError?) {
        if error != nil {
            qrOverlay?.showErrorView(error: error, animated: true)

            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { [weak self] _ in
                guard let strongSelf = self else { return }
                UIView.animate(withDuration: 0.2) {
                    strongSelf.showError(error: nil)
                }
            })

        } else {
            qrOverlay?.showErrorView(error: error, animated: true)
        }
    }

    // MARK: - Many scans warning

    private func showTooManyScansWarningIfNecessary() {
        if WalletScanCounter.shouldShowTooManyScansWarning() {
            tooManyScansPopupView.presentFrom(view: view)
            // Reset scan count whenever the popup is shown
            WalletScanCounter.resetScanCount()
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension WalletScannerViewController: QRScannerViewDelegate {
    func qrScanningDidFail() {
        cameraErrorView?.alpha = 1.0
    }

    func qrScanningSucceededWithCode(_ str: String?) {
        if let s = str {
            let result = CovidCertificateSDK.Wallet.decode(encodedData: s)

            switch result {
            case let .success(holder):
                guard holder.certificate.type != .lightCert else {
                    showError(error: .INVALID_SCHEME_PREFIX)
                    return
                }
                let feedback = UIImpactFeedbackGenerator(style: .heavy)
                feedback.impactOccurred()

                qrView?.stopScanning()

                showDetail(certificate: UserCertificate(qrCode: s, transferCode: nil))

                WalletScanCounter.trackScan(date: Date())
                showTooManyScansWarningIfNecessary()

            case let .failure(error):
                showError(error: error)
            }
        }
    }

    func qrScanningDidStop() {
        showError(error: nil)
    }
}
