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

    private let certificateLightRow = IconImageRowView(icon: UIImage(named: "ic-qr-certificate-light")!,
                                                       text: UBLocalized.wallet_certificate_detail_certificate_light_button)

    private let exportRow = IconImageRowView(icon: UIImage(named: "ic-pdf")!,
                                             text: UBLocalized.wallet_certificate_detail_export_button)

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
                UIAccessibility.post(notification: .screenChanged, argument: stateView)

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

        let c = CovidCertificateSDK.Wallet.decode(encodedData: certificate.qrCode ?? "")
        switch c {
        case let .success(holder):
            guard let certificate = holder.certificate as? DCCCert else { break }
            let vaccinations = certificate.vaccinations ?? []
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

    // MARK: - Setup

    private func setup() {
        let p = Padding.large + Padding.medium
        let padding = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)

        view.addSubview(stackScrollView)

        stackScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackScrollView.addSpacerView(Padding.large)
        stackScrollView.addArrangedView(qrCodeNameView, inset: padding)

        view.addSubview(qrCodeStateView)
        qrCodeStateView.snp.makeConstraints { make in
            make.edges.equalTo(qrCodeNameView.qrCodeLayoutGuide)
        }
        qrCodeStateView.alpha = 0

        stackScrollView.addSpacerView(2.0 * Padding.large)
        stackScrollView.addArrangedView(stateView, inset: padding)

        stackScrollView.addSpacerView(2.0 * Padding.large)
        stackScrollView.addArrangedView(detailView, inset: padding)

        stackScrollView.addSpacerView(2.0 * Padding.large + 2.0 * Padding.small)
        stackScrollView.addArrangedView(CertificateNoteView(), inset: padding)

        stackScrollView.addSpacerView(2.0 * Padding.large + 2.0 * Padding.small)
        stackScrollView.addSpacerView(2.0, color: .cc_blueish)

        if ConfigManager.currentConfig?.lightCertificateActive ?? false {
            stackScrollView.addArrangedView(certificateLightRow)
            stackScrollView.addSpacerView(2.0, color: .cc_blueish)
        }

        if ConfigManager.currentConfig?.pdfGenerationActive ?? false {
            stackScrollView.addArrangedView(exportRow)
            stackScrollView.addSpacerView(2.0, color: .cc_blueish)
        }

        let spacer = stackScrollView.addSpacerView(3.0 * Padding.large + Padding.medium)
        stackScrollView.addArrangedViewCentered(removeButton)

        stackScrollView.addSpacerView(5.0 * Padding.large)

        let bottomBackgroundView = UIView()
        bottomBackgroundView.backgroundColor = .cc_blueish
        view.insertSubview(bottomBackgroundView, belowSubview: stackScrollView)
        bottomBackgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(3)
            make.top.equalTo(spacer.snp.top)
        }

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

        certificateLightRow.touchUpCallback = { [weak self] in
            guard let strongSelf = self,
                  let certificate = strongSelf.certificate else { return }
            strongSelf.navigationController?.pushViewController(CertificateLightCreationViewController(certificate: certificate), animated: true)
        }

        exportRow.touchUpCallback = { [weak self] in
            guard let strongSelf = self,
                  let certificate = strongSelf.certificate else { return }

            let vc = CertificateExportDetailViewController(certificate: certificate)
            vc.sharePDFCallback = { [weak self] certificate in
                guard let self = self else { return }
                self.certificate = certificate
                guard let pdf = certificate.pdf else { return }
                self.sharePDF(pdf)
            }
            strongSelf.navigationController?.pushViewController(vc, animated: true)
        }
    }

    private func updateCertificate() {
        detailView.certificate = certificate
        qrCodeNameView.certificate = certificate
        startCheck()
    }

    private func sharePDF(_ pdf: Data) {
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(UBLocalized.covid_certificate_title).pdf")
        try? pdf.write(to: fileURL)

        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
        activityViewController.title = UBLocalized.covid_certificate_title
        activityViewController.popoverPresentationController?.sourceView = view
        activityViewController.completionWithItemsHandler = { _, _, _, _ in
            try? FileManager.default.removeItem(at: fileURL)
        }
        present(activityViewController, animated: true, completion: nil)
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
                case .skipped: strongSelf.temporaryVerifierState = .idle
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

        exportRow.isEnabled = false
        certificateLightRow.isEnabled = false

        let c = CovidCertificateSDK.Wallet.decode(encodedData: certificate?.qrCode ?? "")
        switch c {
        case let .success(holder):
            let issuedBySwitzerland = ["CH", "CH BAG"].contains(holder.issuer)
            // Light certificates can only be created from "CH" and "CH BAG" issuer where the state is valid
            certificateLightRow.isEnabled = issuedBySwitzerland && !state.isInvalid()

            // PDF export is enabled for certificates that were issed by switzerland and have a valid signature
            if issuedBySwitzerland {
                CovidCertificateSDK.Wallet.check(holder: holder, forceUpdate: false) { results in
                    switch results.signature {
                    case let .success(result) where result.isValid:
                        self.exportRow.isEnabled = true
                    default:
                        self.exportRow.isEnabled = false
                    }
                }
            }
        case .failure:
            exportRow.isEnabled = false
            certificateLightRow.isEnabled = false
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
