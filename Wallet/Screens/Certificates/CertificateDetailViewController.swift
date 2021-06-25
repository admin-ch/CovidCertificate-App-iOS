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

enum TemporaryVerifierState: Equatable {
    case idle
    case verifying
    case success(String?)
    case failure
    case retry(RetryError, [String])
}

class CertificateDetailViewController: ViewController {
    private let stackScrollView = StackScrollView()
    private let qrCodeNameView = QRCodeNameView()

    private lazy var stateView = CertificateStateView(isHomescreen: false, showValidity: true)
    private lazy var detailView = CertificateDetailView(showEnglishLabelsIfNeeded: true)

    private let removeButton = Button(title: UBLocalized.delete_button, style: .normal(.cc_bund))

    private let verifyButton = Button(image: UIImage(named: "ic-load")?.withRenderingMode(.alwaysTemplate), accessibilityName: UBLocalized.accessibility_refresh_button)

    private lazy var qrCodeStateView = CertificateQRCodeStateView(initialState: temporaryVerifierState)

    private let brightnessQRScanning = BrightnessQRScanning()

    private var state: VerificationState = .loading {
        didSet {
            update()
        }
    }

    private var temporaryVerifierState: TemporaryVerifierState = .idle {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.qrCodeStateView.state = self.temporaryVerifierState
            }
            if temporaryVerifierState != .idle && temporaryVerifierState != .verifying {
                DispatchQueue.main.asyncAfter(deadline: .now() + .pi) { [weak self] in
                    guard let strongSelf = self else { return }
                    UIView.animate(withDuration: 0.2) {
                        strongSelf.temporaryVerifierState = .idle
                        strongSelf.verifyButton.alpha = 1
                        strongSelf.update()
                    }
                }
            }
        }
    }

    public var certificate: UserCertificate? {
        didSet { updateCertificate() }
    }

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init()

        title = UBLocalized.wallet_certificate.uppercased()

        let c = CovidCertificateSDK.decode(encodedData: certificate.qrCode ?? "")
        switch c {
        case let .success(holder):
            let vaccinations = holder.healthCert.vaccinations ?? []
            if !vaccinations.allSatisfy({ $0.doseNumber == $0.totalDoses }) {
                title = UBLocalized.wallet_certificate_evidence_title.uppercased()
            }
        case .failure:
            break
        }
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupInteraction()
        updateCertificate()

        addDismissButton()

        // start check of certificate
        // also starts again when lists are updated
        UIStateManager.shared.addObserver(self) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.startCheck()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        brightnessQRScanning.isEnabled = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        brightnessQRScanning.isEnabled = false
    }

    // MARK: - Setup

    private func setup() {
        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.large + Padding.medium
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)

        view.addSubview(stackScrollView)

        stackScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackScrollView.addSpacerView(Padding.large)
        stackScrollView.addArrangedView(qrCodeNameView)

        view.addSubview(qrCodeStateView)
        qrCodeStateView.snp.makeConstraints { make in
            make.edges.equalTo(qrCodeNameView.qrCodeLayoutGuide)
        }
        qrCodeStateView.alpha = 0

        stackScrollView.addSpacerView(2.0 * Padding.large)
        stackScrollView.addArrangedView(stateView)

        stackScrollView.addSpacerView(2.0 * Padding.large)
        stackScrollView.addArrangedView(detailView)

        stackScrollView.addSpacerView(2.0 * Padding.large + 2.0 * Padding.small)
        stackScrollView.addArrangedView(CertificateNoteView())

        stackScrollView.addSpacerView(3.0 * Padding.large + Padding.medium)
        stackScrollView.addArrangedViewCentered(removeButton)

        stackScrollView.addSpacerView(5.0 * Padding.large)

        verifyButton.backgroundColor = .cc_blue
        verifyButton.tintColor = .cc_white
        let size: CGFloat = 50.0
        verifyButton.layer.cornerRadius = size * 0.5
        verifyButton.highlightCornerRadius = size * 0.5
        verifyButton.ub_addShadow(radius: 4.0, opacity: 0.2, xOffset: 0.0, yOffset: 0.0)
        view.addSubview(verifyButton)
        verifyButton.snp.makeConstraints { make in
            make.size.equalTo(size)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(Padding.large)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(Padding.large + Padding.small)
        }

        update()
    }

    private func setupInteraction() {
        verifyButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }

            strongSelf.stackScrollView.scrollToTop(animated: true)
            strongSelf.startTemporaryCheck()
        }

        removeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.removeCertificate()
        }
    }

    private func updateCertificate() {
        detailView.certificate = certificate
        qrCodeNameView.certificate = certificate
        startCheck()
    }

    // MARK: - Check

    private func startTemporaryCheck() {
        temporaryVerifierState = .verifying
        state = .loading
        UIView.animate(withDuration: 0.2) {
            self.verifyButton.alpha = 0
            self.qrCodeStateView.state = self.temporaryVerifierState
        }

        guard let qrCode = certificate?.qrCode else { return }

        VerifierManager.shared.addObserver(self, for: qrCode, forceUpdate: true) { [weak self] state in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                guard let strongSelf = self else { return }
                switch state {
                case .loading: strongSelf.temporaryVerifierState = .verifying
                case let .success(validUntil): strongSelf.temporaryVerifierState = .success(validUntil)
                case .invalid: strongSelf.temporaryVerifierState = .failure
                case let .retry(error, errorCodes): strongSelf.temporaryVerifierState = .retry(error, errorCodes)
                }

                strongSelf.state = state
            }
        }
    }

    private func startCheck() {
        guard let qrCode = certificate?.qrCode else { return }

        state = .loading

        VerifierManager.shared.addObserver(self, for: qrCode) { [weak self] state in
            guard let strongSelf = self else { return }
            strongSelf.qrCodeStateView.alpha = 0
            strongSelf.verifyButton.alpha = 1
            strongSelf.state = state
        }
    }

    private func removeCertificate() {
        let alert = UIAlertController(title: nil, message: UBLocalized.wallet_certificate_delete_confirm_text, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: UBLocalized.delete_button, style: .destructive, handler: { _ in
            CertificateStorage.shared.userCertificates = CertificateStorage.shared.userCertificates.filter { $0 != self.certificate }
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: UBLocalized.cancel_button, style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    private func update() {
        stateView.states = (state, temporaryVerifierState)
        detailView.states = (state, temporaryVerifierState)
        qrCodeNameView.enabled = temporaryVerifierState != .idle || !state.isInvalid()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
