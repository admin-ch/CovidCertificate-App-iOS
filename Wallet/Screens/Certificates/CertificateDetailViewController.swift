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
import SnapKit
import UIKit

enum TemporaryVerifierState: Equatable {
    case idle
    case verifying
    case success(String?, ModeResults?)
    case failure
    case retry(RetryError, [String])
}

class CertificateDetailViewController: ViewController {
    private let stackScrollView = StackScrollView()
    private let qrCodeNameView = QRCodeNameView(isOnHomeScreen: false)

    private let renewBannerView = CertificateDetailBannerView()
    private let eolBannerView = CertificateDetailBannerView()
    private let ratBannerView = CertificateDetailBannerView()

    private lazy var stateView = CertificateStateView(isHomescreen: false, showValidity: true)
    private lazy var checkValidityAbroadButtonWrapper = UIStackView()
    private lazy var checkValidityAbroadButton = LeadingTrailingIconButton(text: UBLocalized.wallet_foreign_rules_check_button, leadingIcon: UIImage(named: "ic-travel")!, trailingIcon: UIImage(named: "ic-arrow-forward")!)

    private var checkValidityAbroadButtonHeightConstraint: Constraint!

    private lazy var detailView = CertificateDetailView(showEnglishLabelsIfNeeded: true, addTopDivider: false)

    private let modeView = CertificateModeView()
    private var infoPopupView: IconTextInfoBoxView?
    private var bannerPopupView: EOLBannerPopupView?

    private let noteView = CertificateNoteView()

    private let removeButton = Button(titleKey: .delete_button, style: .normal(.cc_bund))

    private lazy var qrCodeStateView = CertificateQRCodeStateView(initialState: temporaryVerifierState)

    private let certificateLightRow = IconImageRowView(icon: UIImage(named: "ic-qr-certificate-light")!,
                                                       text: UBLocalized.wallet_certificate_detail_certificate_light_button)

    private let exportRow = IconImageRowView(icon: UIImage(named: "ic-pdf")!,
                                             text: UBLocalized.wallet_certificate_detail_export_button)

    private let vaccinationInfoRow = IconImageRowView(icon: UIImage(named: "ic-info-outline")!,
                                                      text: UBLocalized.vaccination_information_button_in_certificate)

    private var state: VerificationState = .loading {
        didSet {
            if oldValue != state {
                UIView.animate(withDuration: 0.2) {
                    self.update()
                }
            }
        }
    }

    private var temporaryVerifierState: TemporaryVerifierState = .idle {
        didSet {
            guard oldValue != temporaryVerifierState else { return }

            UIView.animate(withDuration: 0.2) {
                self.qrCodeStateView.state = self.temporaryVerifierState
            }
            if temporaryVerifierState != .idle && temporaryVerifierState != .verifying {
                UIAccessibility.post(notification: .screenChanged, argument: stateView)

                DispatchQueue.main.asyncAfter(deadline: .now() + .pi) { [weak self] in
                    guard let strongSelf = self else { return }
                    UIView.animate(withDuration: 0.2) {
                        strongSelf.temporaryVerifierState = .idle
                        strongSelf.update()
                    }
                }
            }
        }
    }

    public var certificate: UserCertificate? {
        didSet {
            if oldValue != certificate {
                updateCertificate()
                setTitle()
            }
        }
    }

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init()

        setTitle()
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

        stackScrollView.addArrangedView(renewBannerView,
                                        inset: UIEdgeInsets(top: Padding.medium, left: Padding.medium, bottom: 0, right: Padding.medium))

        stackScrollView.addArrangedView(eolBannerView,
                                        inset: UIEdgeInsets(top: Padding.medium, left: Padding.medium, bottom: 0, right: Padding.medium))

        stackScrollView.addArrangedView(ratBannerView,
                                        inset: UIEdgeInsets(top: Padding.medium, left: Padding.medium, bottom: 0, right: Padding.medium))

        ratBannerView.state = .rat(CertificateDetailBannerContent(title: UBLocalized.rat_conversion_overview_title, text: UBLocalized.rat_conversion_overview_text, buttonText: UBLocalized.rat_conversion_overview_button))

        stackScrollView.addSpacerView(Padding.large)
        stackScrollView.addArrangedView(qrCodeNameView, inset: padding)

        view.addSubview(qrCodeStateView)
        qrCodeStateView.snp.makeConstraints { make in
            make.edges.equalTo(qrCodeNameView.qrCodeLayoutGuide)
        }
        qrCodeStateView.alpha = 0

        stackScrollView.addSpacerView(2.0 * Padding.large)
        stackScrollView.addArrangedView(stateView, inset: padding)
        stackScrollView.addSpacerView(Padding.medium)

        checkValidityAbroadButtonWrapper.axis = .vertical
        checkValidityAbroadButtonWrapper.addArrangedView(checkValidityAbroadButton)
        checkValidityAbroadButtonWrapper.addSpacerView(Padding.large)

        checkValidityAbroadButtonWrapper.snp.makeConstraints { make in
            checkValidityAbroadButtonHeightConstraint = make.height.equalTo(0).constraint
        }

        stackScrollView.addArrangedView(checkValidityAbroadButtonWrapper, inset: padding)
        stackScrollView.addArrangedView(modeView, inset: padding)

        stackScrollView.addSpacerView(Padding.medium)
        stackScrollView.addArrangedView(detailView, inset: padding)

        stackScrollView.addSpacerView(2.0 * Padding.large + 2.0 * Padding.small)
        stackScrollView.addArrangedView(noteView, inset: padding)

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

        if ConfigManager.currentConfig?.showVaccinationHintDetail ?? false {
            stackScrollView.addArrangedView(vaccinationInfoRow)
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

        update()
    }

    private func setupInteraction() {
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
                let c = CovidCertificateSDK.Wallet.decode(encodedData: certificate.qrCode ?? "")
                switch c {
                case let .success(holder):
                    guard let filename = holder.certificate.sharePDFName else { return }
                    self.sharePDF(pdf, filename: filename)
                case .failure:
                    break
                }
            }
            strongSelf.navigationController?.pushViewController(vc, animated: true)
        }

        vaccinationInfoRow.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.pushViewController(VaccinationInformationViewController(), animated: true)
        }

        modeView.button.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.infoPopupView?.removeFromSuperview()
            strongSelf.infoPopupView = IconTextInfoBoxView(iconTextSource: strongSelf.modeView.infoImageTexts(size: 24.0), imageHeight: 24.0)
            strongSelf.infoPopupView?.addAndPresent(to: strongSelf.view, from: strongSelf.modeView.button)
        }

        renewBannerView.moreInfoTouchUpCallback = { [weak self] in
            guard let self = self,
                  let certificate = self.certificate else { return }
            switch self.renewBannerView.state {
            case .wasRenewed:
                self.navigationController?.pushViewController(CertificateRenewViewController(certificate: certificate, isExpired: false), animated: true)
            case .renew:
                self.navigationController?.pushViewController(CertificateRenewViewController(certificate: certificate, isExpired: true), animated: true)
            default:
                break
            }
        }

        renewBannerView.dismissButtonTouchUpCallback = { [weak self] in
            guard let self = self else { return }
            switch self.renewBannerView.state {
            case let .wasRenewed(_, uvci):
                RenewalHistoryManager.shared.removeRenewal(uvci: uvci)
                self.update()
            default:
                break
            }
        }

        eolBannerView.moreInfoTouchUpCallback = { [weak self] in
            guard let self = self else { return }
            self.bannerPopupView?.removeFromSuperview()

            switch self.eolBannerView.state {
            case let .eol(banner):
                self.bannerPopupView = EOLBannerPopupView(banner: banner)
                self.bannerPopupView?.addAndPresent(to: self.view, from: self.eolBannerView.moreInfoButton)
            default:
                break
            }
        }

        ratBannerView.moreInfoTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            guard let c = strongSelf.certificate else { return }

            strongSelf.navigationController?.pushViewController(RatConversionDetailViewController(certificate: c), animated: true)
        }

        checkValidityAbroadButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self,
                  let certificate = strongSelf.certificate else { return }

            strongSelf.navigationController?.pushViewController(CertificateCheckValidityAbroadDetailViewController(certificate: certificate), animated: true)
        }
    }

    private func updateCertificate() {
        detailView.certificate = certificate
        qrCodeNameView.certificate = certificate
        startCheck()
    }

    private func setTitle() {
        title = UBLocalized.wallet_certificate.uppercased()

        guard let certificate = certificate else { return }

        let c = CovidCertificateSDK.Wallet.decode(encodedData: certificate.qrCode ?? "")
        switch c {
        case let .success(holder):
            guard let certificate = holder.certificate as? DCCCert else { break }
            let vaccinations = certificate.vaccinations ?? []
            if !vaccinations.isComplete {
                title = UBLocalized.wallet_certificate_evidence_title.uppercased()
            }

            let tests = certificate.tests ?? []
            noteView.isSwitzerlandException = tests.contains { $0.isSwitzerlandException }
            noteView.isPositiveAntigenTest = tests.contains { $0.isPositiveAntigenTest }
        case .failure:
            break
        }
    }

    private func sharePDF(_ pdf: Data, filename: String) {
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(filename)
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
        guard let qrCode = certificate?.qrCode else { return }

        temporaryVerifierState = .verifying
        state = .loading
        UIView.animate(withDuration: 0.2) {
            self.qrCodeStateView.state = self.temporaryVerifierState
        }

        VerifierManager.shared.addObserver(self, for: qrCode, modes: Verifier.currentModes(), forceUpdate: true) { [weak self] state in
            guard let self = self else { return }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                guard let self = self else { return }
                switch state {
                case .loading: self.temporaryVerifierState = .verifying
                case .skipped: self.temporaryVerifierState = .idle
                case let .success(validUntil, _, modesResult, _, _): self.temporaryVerifierState = .success(validUntil, modesResult)
                case .invalid: self.temporaryVerifierState = .failure
                case let .retry(error, errorCodes): self.temporaryVerifierState = .retry(error, errorCodes)
                }

                self.state = state
            }
        }
    }

    private func startCheck() {
        guard let qrCode = certificate?.qrCode else { return }

        state = .loading

        VerifierManager.shared.addObserver(self, for: qrCode, modes: Verifier.currentModes()) { [weak self] state in
            guard let self = self else { return }
            self.qrCodeStateView.alpha = 0
            self.state = state
        }
    }

    private func removeCertificate() {
        let alert = UIAlertController(title: nil, message: UBLocalized.wallet_certificate_delete_confirm_text, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: UBLocalized.delete_button, style: .destructive, handler: { _ in
            self.certificate?.deleteUserActivity()
            CertificateStorage.shared.userCertificates = CertificateStorage.shared.userCertificates.filter { $0 != self.certificate }

            switch CovidCertificateSDK.Wallet.decode(encodedData: self.certificate?.qrCode ?? "") {
            case let .success(holder):
                if let certificate = holder.certificate as? DCCCert,
                   let uvci = certificate.vaccinations?.first?.certificateIdentifier ??
                   certificate.pastInfections?.first?.certificateIdentifier ??
                   certificate.tests?.first?.certificateIdentifier {
                    RenewalHistoryManager.shared.removeRenewal(uvci: uvci)
                }
            default:
                break
            }

            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: UBLocalized.cancel_button, style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    private func update() {
        stateView.states = (state, temporaryVerifierState, certificate)
        modeView.states = (state, temporaryVerifierState)
        detailView.updateLabelColors(for: (state, temporaryVerifierState), animated: true)

        exportRow.isEnabled = false
        certificateLightRow.isEnabled = false

        let isSuccessState = state.isSuccess()
        let errors: (signatureError: VerificationError?, revocationError: VerificationError?, nationalRuleError: VerificationError?)? = state.getVerifierErrorState()

        var isOnlyNationalRulesInvalid = false
        if let e = errors {
            isOnlyNationalRulesInvalid = (e.nationalRuleError != nil) && !state.isSignatureOrRevocationError()
        }

        var isSwitzerlandOnly = false
        switch state {
        case let .success(_, switzerlandOnly, _, _, _):
            isSwitzerlandOnly = switzerlandOnly ?? false
        case let .invalid(_, _, _, _, switzerlandOnly, _):
            isSwitzerlandOnly = switzerlandOnly ?? false
        default:
            break
        }

        let foreignEnabled = ConfigManager.currentConfig?.foreignRulesCheckEnabled ?? false
        let notInvalid = (isSuccessState || isOnlyNationalRulesInvalid)
        let showCheckValidityAbroadButton = foreignEnabled && notInvalid && !isSwitzerlandOnly

        if showCheckValidityAbroadButton {
            checkValidityAbroadButtonHeightConstraint.deactivate()
        } else {
            checkValidityAbroadButtonHeightConstraint.activate()
        }

        let c = CovidCertificateSDK.Wallet.decode(encodedData: certificate?.qrCode ?? "")

        switch c {
        case let .success(holder):
            let issuedBySwitzerland = ["CH", "CH BAG"].contains(holder.issuer)
            // Light certificates can only be created from "CH" and "CH BAG" issuer where the state is valid
            certificateLightRow.isEnabled = issuedBySwitzerland && !state.isInvalid()

            // PDF export is enabled for certificates that were issed by switzerland and have a valid signature
            if issuedBySwitzerland {
                CovidCertificateSDK.Wallet.check(holder: holder, forceUpdate: false, modes: Verifier.currentModes()) { [weak self] results in
                    guard let self = self else { return }

                    switch results.signature {
                    case let .success(result) where result.isValid:
                        self.exportRow.isEnabled = true
                    default:
                        self.exportRow.isEnabled = false
                    }
                }
            }

            if let certificate = holder.certificate as? DCCCert,
               let uvci = certificate.vaccinations?.first?.certificateIdentifier ??
               certificate.pastInfections?.first?.certificateIdentifier ??
               certificate.tests?.first?.certificateIdentifier,
               RenewalHistoryManager.shared.shouldShowWasRenewedBanner(for: uvci) {
                renewBannerView.state = .wasRenewed(CertificateDetailBannerContent(title: UBLocalized.wallet_certificate_renewal_successful_bubble_title,
                                                                                   text: UBLocalized.wallet_certificate_renewal_successful_bubble_text,
                                                                                   buttonText: UBLocalized.wallet_certificate_renewal_successful_bubble_button), uvci: uvci)
            } else if state.showRenewBanner != nil {
                renewBannerView.state = .renew(CertificateDetailBannerContent(title: UBLocalized.wallet_certificate_renewal_required_bubble_title,
                                                                              text: UBLocalized.wallet_certificate_renewal_required_bubble_text,
                                                                              buttonText: UBLocalized.wallet_certificate_renewal_required_bubble_button))
                renewBannerView.superview?.isHidden = false
            } else {
                renewBannerView.superview?.isHidden = true
            }

            if case let .success(_, _, _, .some(eolIdentifier), _) = state,
               let banner = ConfigManager.currentConfig?.eolBannerInfo?.value?[eolIdentifier] {
                eolBannerView.state = .eol(banner)
                eolBannerView.superview?.isHidden = false
            } else {
                eolBannerView.superview?.isHidden = true
            }
        case .failure:
            exportRow.isEnabled = false
            certificateLightRow.isEnabled = false

            renewBannerView.superview?.isHidden = true
            eolBannerView.superview?.isHidden = true
        }

        // check certificate color
        var isTest = false
        var isPositiveAntigenTest = false

        switch c {
        case let .success(holder):
            if let dccCert = holder.certificate as? DCCCert {
                isTest = dccCert.immunisationType == .test
                isPositiveAntigenTest = dccCert.tests?.contains { $0.isPositiveAntigenTest } ?? false
            }
        default:
            break
        }

        let isSignatureOrRevocationError = state.isSignatureOrRevocationError()

        let showRatConversion = ConfigManager.currentConfig?.showRatConversionForm ?? false
        let showBanner = isPositiveAntigenTest && showRatConversion && !isSignatureOrRevocationError
        ratBannerView.superview?.ub_setHidden(!showBanner)

        let isInvalid = (isTest || isSignatureOrRevocationError) ? state.isInvalid() : false
        qrCodeNameView.enabled = temporaryVerifierState != .idle || !isInvalid
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
