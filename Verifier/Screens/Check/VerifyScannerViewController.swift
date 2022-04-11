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

class VerifyScannerViewController: ViewController {
    // MARK: - Public Callbacks

    public var scanningSucceededCallback: ((HolderModel) -> Void)?
    public var scanModeButtonPressed: ((UIView) -> Void)?

    public var dismissTouchUpCallback: (() -> Void)?

    private var timer: Timer?

    public func restart() {
        cameraErrorView?.alpha = 0.0
        showError(error: nil)
        qrView?.startScanning()
        qrView?.setCameraLight(on: isLightOn)
    }

    public func pauseScanning() {
        qrView?.pauseScanning()
    }

    public var mode: CheckModeUIObject? {
        didSet {
            scanModeButton.mode = mode
            scanModeButton.alpha = (mode == nil || CheckModesHelper.onlyOneMode()) ? 0.0 : 1.0
        }
    }

    // MARK: - Subviews

    private var qrView: QRScannerView?
    private let overlayView = VerifierQRScannerFullOverlayView()

    private var isLightOn: Bool = false
    private let lightButton = ScannerLightButton.verifierButton()

    private let label = Label(.uppercaseBold, textColor: .white, textAlignment: .center)
    private let closeButton = Button(image: UIImage(named: "ic-close")?.ub_image(with: .white), accessibilityKey: .accessibility_close_button)

    private let scanModeButton = ScanModeButton(addSettingsIcon: false)

    private var cameraErrorView: CameraErrorView?

    // MARK: - Init

    override init() {
        super.init()
        qrView = QRScannerView(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupInteraction()

        restart()

        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.restart()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopScanning()
    }

    // MARK: - Setup

    private func setupInteraction() {
        closeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismissTouchUpCallback?()
        }

        lightButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.toggleLight()
        }

        scanModeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.scanModeButtonPressed?(strongSelf.scanModeButton)
        }
    }

    private func setup() {
        if let qv = qrView {
            view.addSubview(qv)
            qv.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }

            view.addSubview(overlayView)

            overlayView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }

        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.cc_black.withAlphaComponent(0.5)

        view.addSubview(backgroundView)

        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height

        backgroundView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(statusBarHeight <= 20.0 ? 90.0 : 110.0)
        }

        backgroundView.addSubview(label)

        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Padding.medium + 2.0)
        }

        label.text = UBLocalized.verifier_title_qr_scan

        backgroundView.addSubview(closeButton)

        closeButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(Padding.small)
            make.centerY.equalTo(label)
            make.size.equalTo(44.0)
        }

        backgroundView.addSubview(scanModeButton)

        scanModeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Padding.small)
            make.right.lessThanOrEqualTo(label.snp.left).offset(-Padding.small)
            make.centerY.equalTo(label)
        }

        if qrView?.canEnableTorch ?? false {
            view.addSubview(lightButton)
            lightButton.snp.makeConstraints { make in
                let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
                if bottomPadding > 0 {
                    make.bottom.equalTo(self.view.snp.bottomMargin).inset(Padding.medium)
                } else {
                    make.bottom.equalToSuperview().inset(Padding.large)
                }

                make.right.equalToSuperview().offset(-Padding.medium - Padding.small)
            }
        }

        cameraErrorView = CameraErrorView(backgroundColor: UIColor(white: 0.6, alpha: 1.0), center: true)
        view.addSubview(cameraErrorView!)
        cameraErrorView?.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }

        cameraErrorView?.alpha = 0.0
    }

    private func toggleLight() {
        isLightOn = !isLightOn
        qrView?.setCameraLight(on: isLightOn)
        lightButton.isOn = isLightOn
    }

    private func showError(error: CovidCertError?) {
        if error != nil {
            overlayView.showErrorView(error: error, animated: true)

            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { [weak self] _ in
                guard let strongSelf = self else { return }
                UIView.animate(withDuration: 0.2) {
                    strongSelf.showError(error: nil)
                }
            })

        } else {
            overlayView.showErrorView(error: error, animated: true)
        }
    }

    private func stopScanning() {
        timer?.invalidate()
        timer = nil
        qrView?.stopScanning()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension VerifyScannerViewController: QRScannerViewDelegate {
    func qrScanningDidFail() {
        cameraErrorView?.alpha = 1.0
    }

    func qrScanningSucceededWithCode(_ str: String?) {
        if let s = str {
            let result = CovidCertificateSDK.Verifier.decode(encodedData: s)

            switch result {
            case let .success(holder):
                qrView?.pauseScanning()

                let feedback = UIImpactFeedbackGenerator(style: .heavy)
                feedback.impactOccurred()

                scanningSucceededCallback?(holder)
            case let .failure(error):
                showError(error: error)
            }
        }
    }

    func qrScanningDidStop() {
        showError(error: nil)
    }
}
