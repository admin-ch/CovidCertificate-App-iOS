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

class WalletDetailViewController: ViewController {
    private let certificateDetailVC: CertificateDetailViewController
    private let lightCertificateDetailVC: CertificateLightDetailViewController
    private let transferCodeDetailVC: TransferCodeDetailViewController
    private let loadingView = LoadingView()

    private let brightnessQRScanning = BrightnessQRScanning()

    private var certificate: UserCertificate

    // MARK: - Init

    init(certificate: UserCertificate) {
        self.certificate = certificate
        certificateDetailVC = CertificateDetailViewController(certificate: certificate)
        transferCodeDetailVC = TransferCodeDetailViewController(certificate: certificate)
        lightCertificateDetailVC = CertificateLightDetailViewController(certificate: certificate)
        super.init()
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupInteraction()

        update(animated: false)

        UIStateManager.shared.addObserver(self) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.startDownloadIfNeeded()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addDismissButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        switch certificate.type {
        case .lightCertificate, .certificate:
            brightnessQRScanning.isEnabled = true
        default:
            break
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        brightnessQRScanning.isEnabled = false
    }

    // MARK: - Setup

    private func setup() {
        addSubviewController(certificateDetailVC)
        addSubviewController(transferCodeDetailVC)
        addSubviewController(lightCertificateDetailVC)

        view.addSubview(loadingView)

        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupInteraction() {
        transferCodeDetailVC.refreshCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.startDownloadIfNeeded(forceUpdate: true)
        }
        lightCertificateDetailVC.didDisableLightCertificate = { [weak self] certificate in
            guard let strongSelf = self else { return }
            strongSelf.certificate = certificate
            strongSelf.update(animated: true)
            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }

    // MARK: - Download

    private func startDownloadIfNeeded(forceUpdate: Bool = false) {
        // only start if it's a not failed transfer-code
        guard certificate.type == .transferCode,
              let transferCode = certificate.transferCode,
              transferCode.state != .failed
        else { return }

        lightCertificateDetailVC.view.alpha = 0.0
        certificateDetailVC.view.alpha = 0.0
        transferCodeDetailVC.view.alpha = 0.0
        loadingView.alpha = 1.0

        loadingView.startLoading()

        updateLastLoad()

        TransferManager.shared.addObserver(self, for: transferCode.transferCode, forceUpdate: forceUpdate) { [weak self] result in
            guard let strongSelf = self else { return }

            switch result {
            case let .success(certificate):
                // TransferManager adds all the certificates, so we
                // just update the UI with the first certificate or
                // update date
                if certificate.count > 0 {
                    strongSelf.certificate.qrCode = certificate.first?.cert
                    strongSelf.certificateDetailVC.certificate = strongSelf.certificate
                } else {
                    strongSelf.updateLastLoad()
                }

            case let .failure(error):
                // update error
                strongSelf.transferCodeDetailVC.error = error
            }

            strongSelf.loadingView.stopLoading()
            strongSelf.update(animated: true)

            UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
    }

    private func updateLastLoad() {
        guard certificate.type == .transferCode,
              let transferCode = certificate.transferCode,
              transferCode.state != .failed
        else { return }

        if let lastLoad = TransferManager.shared.getLastLoad(code: transferCode.transferCode) {
            transferCodeDetailVC.updateDate = lastLoad
        }
    }

    private func update(animated: Bool) {
        // switch animatable states
        let actions = {
            switch self.certificate.type {
            case .lightCertificate:
                self.title = self.lightCertificateDetailVC.title
                self.certificateDetailVC.view.alpha = 0.0
                self.transferCodeDetailVC.view.alpha = 0.0
                self.lightCertificateDetailVC.view.alpha = 1.0
                self.brightnessQRScanning.isEnabled = true
            case .certificate:
                self.title = self.certificateDetailVC.title
                self.certificateDetailVC.view.alpha = 1.0
                self.transferCodeDetailVC.view.alpha = 0.0
                self.lightCertificateDetailVC.view.alpha = 0.0
                self.brightnessQRScanning.isEnabled = true
            case .transferCode:
                self.title = self.transferCodeDetailVC.title
                self.certificateDetailVC.view.alpha = 0.0
                self.lightCertificateDetailVC.view.alpha = 0.0
                self.transferCodeDetailVC.view.alpha = 1.0
                self.brightnessQRScanning.isEnabled = false
            }
        }

        if animated {
            UIView.animate(withDuration: 0.2) {
                actions()
            }
        } else {
            actions()
        }
    }
}
