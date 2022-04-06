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

class CertificateCheckValidityAbroadDetailViewController: StackScrollViewController {
    private struct SelectionObject {
        var date: Date?
        var country: ArrivalCountry?

        var isValid: Bool {
            // We allow the selected time to be 10 minutes in the past
            return date != nil && date!.addingTimeInterval(10 * 60) >= Date() && country != nil
        }
    }

    private let summary = CertificateLightSummaryView(isActive: false)
    private let loadingView = LoadingView()
    private let errorRetryVC = NetworkErrorRetryViewController(title: UBLocalized.wallet_foreign_rules_check_error_title)
    private let selectionView = CertificateCheckAbroadSelectionView()
    private let stateView = CertificateCheckAbroadVerificationStateView()

    private let certificate: UserCertificate
    private var currentSelection = SelectionObject()

    private var useDateAndTime = false {
        didSet {
            selectionView.useDateAndTime = useDateAndTime
            stateView.useDateAndTime = useDateAndTime
        }
    }

    // MARK: - Init

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = UBLocalized.wallet_certificate.uppercased()
        view.backgroundColor = .cc_background
        setupLayout()
        setupInteractions()
        setupDayAndTime()
        loadCountries()
    }

    private func setupLayout() {
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackScrollView.stackView.alignment = .fill
        addSubviewController(errorRetryVC) { make in
            make.edges.equalToSuperview()
        }
        errorRetryVC.view.backgroundColor = .cc_background
        errorRetryVC.view.alpha = 0

        let p = 2.0 * Padding.medium

        let title = Label(.title, textAlignment: .center)
        title.text = UBLocalized.wallet_foreign_rules_check_title
        addArrangedView(title,
                        insets: UIEdgeInsets(top: 0, left: p, bottom: 0, right: p))

        let text = Label(.text)
        text.text = UBLocalized.wallet_foreign_rules_check_subtitle
        addArrangedView(text,
                        spacing: Padding.large,
                        insets: UIEdgeInsets(top: Padding.large, left: p, bottom: 0, right: p))

        let boxPadding = Padding.medium
        addArrangedView(selectionView,
                        spacing: 6,
                        insets: UIEdgeInsets(top: 0, left: boxPadding, bottom: 0, right: boxPadding))

        addArrangedView(stateView,
                        spacing: 0,
                        insets: UIEdgeInsets(top: 0, left: boxPadding, bottom: 0, right: boxPadding))

        guard let currentConfig = ConfigManager.currentConfig else { return }
        if let hints = currentConfig.foreignRulesHints?.value, !hints.isEmpty {
            let hintsTitle = Label(.textBoldLarge)
            hintsTitle.text = UBLocalized.wallet_foreign_rules_check_hints_title

            addArrangedView(hintsTitle,
                            spacing: Padding.large,
                            insets: UIEdgeInsets(top: 2.0 * Padding.large, left: p, bottom: 0, right: p))

            for hint in hints {
                addArrangedView(OnboardingInfoView(icon: UIImage(named: hint.iconIos)?.ub_image(with: UIColor.cc_blue), text: hint.text, alignment: .left))
            }
        }

        if let linkText = currentConfig.foreignRulesLinkText, let linkUrl = currentConfig.foreignRulesLinkUrl, let url = URL(string: linkUrl) {
            let t = Label(.text)
            t.text = UBLocalized.wallet_foreign_rules_check_hints_more_info_label
            addArrangedView(t,
                            spacing: Padding.large,
                            insets: UIEdgeInsets(top: Padding.large, left: p, bottom: 0, right: p))

            let linkButton = ExternalLinkButton(title: linkText)
            linkButton.touchUpCallback = {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            addArrangedView(linkButton)
        }
    }

    private func setupInteractions() {
        selectionView.didSelectDate = { [weak self] date in
            guard let self = self else { return }
            var d = date
            if !self.useDateAndTime {
                d = date.endOfDay
            }
            self.currentSelection.date = d
            WalletUserStorage.shared.foreignRulesCheckSelectedDate = d
            self.startCheckIfSelectionIsValid()
        }

        selectionView.didSelectCountry = { [weak self] country in
            guard let self = self else { return }
            WalletUserStorage.shared.foreignRulesCheckSelectedCountryCode = country?.id
            self.currentSelection.country = country
            self.startCheckIfSelectionIsValid()
        }

        errorRetryVC.retryCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.loadCountries(forceUpdate: true)
        }

        stateView.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.startCheckIfSelectionIsValid()
        }
    }

    private func setupDayAndTime() {
        let c = CovidCertificateSDK.Wallet.decode(encodedData: certificate.qrCode ?? "")
        switch c {
        case let .success(holder):
            guard let certificate = holder.certificate as? DCCCert else { break }
            // TODO: Check for positiveRatTest
            useDateAndTime = certificate.immunisationType == .test
        default:
            break
        }
    }

    private func loadCountries(forceUpdate: Bool = false) {
        loadingView.startLoading()
        UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
            self.errorRetryVC.view.alpha = 0.0
        }, completion: nil)

        CovidCertificateSDK.Wallet.foreignRulesCountryCodes(forceUpdate: forceUpdate) { result in
            switch result {
            case let .success(countryCodes):
                self.loadingView.stopLoading()
                self.selectionView.countries = countryCodes.map { ArrivalCountry(countryCode: $0) }.compactMap { $0 }.sortedByLocalizedName
                self.showStoredSelection()
            case let .failure(error):
                self.errorRetryVC.error = error
                UIView.animate(withDuration: 0.25) {
                    self.errorRetryVC.view.alpha = 1.0
                } completion: { _ in
                    self.loadingView.stopLoading()
                }
            }
        }
    }

    private func showStoredSelection() {
        if WalletUserStorage.shared.foreignRulesCheckSelectedDate >= Date() {
            currentSelection.date = WalletUserStorage.shared.foreignRulesCheckSelectedDate
            selectionView.selectedDate = WalletUserStorage.shared.foreignRulesCheckSelectedDate
        } else {
            currentSelection.date = Date()
            selectionView.selectedDate = Date()
        }

        if let selectedCountryCode = WalletUserStorage.shared.foreignRulesCheckSelectedCountryCode, let country = ArrivalCountry(countryCode: selectedCountryCode) {
            currentSelection.country = country
            selectionView.selectedCountry = country
        }

        startCheckIfSelectionIsValid()
    }

    private func startCheckIfSelectionIsValid() {
        if currentSelection.isValid {
            guard let date = currentSelection.date, let country = currentSelection.country else { return }
            guard let qrCode = certificate.qrCode else { return }

            state = (.loading, country, date)

            VerifierManager.shared.addObserver(self, for: qrCode, modes: [], countryCode: country.id, checkDate: date) { [weak self] state in
                guard let self = self else { return }
                if self.state?.state == .loading {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [weak self] in
                        guard let self = self else { return }
                        self.state = (state, country, date)
                    }
                }
            }
        } else {
            state = nil
        }
    }

    var state: (state: VerificationState, country: ArrivalCountry, checkDate: Date)? {
        didSet {
            if state?.state == .loading {
                selectionView.isUserInteractionEnabled = false
            } else {
                selectionView.isUserInteractionEnabled = true
            }
            stateView.state = state
        }
    }
}

extension NetworkError: ErrorViewError {
    func icon(color: UIColor?) -> UIImage? {
        switch self {
        case .NETWORK_NO_INTERNET_CONNECTION:
            var image = UIImage(named: "ic-offline")
            image = image?.ub_image(with: color ?? .cc_orange)
            return image
        default:
            var image = UIImage(named: "ic-error")
            if let c = color {
                image = image?.ub_image(with: c)
            }

            return image
        }
    }

    var errorTitle: String {
        switch self {
        case .NETWORK_NO_INTERNET_CONNECTION:
            return UBLocalized.wallet_certificate_light_detail_activation_network_error_title
        default:
            return UBLocalized.wallet_certificate_light_detail_activation_general_error_title
        }
    }

    var errorText: String {
        switch self {
        case .NETWORK_NO_INTERNET_CONNECTION:
            return UBLocalized.wallet_foreign_rules_check_network_error_text
        default:
            return UBLocalized.wallet_certificate_light_detail_activation_general_error_text
        }
    }

    var errorCode: String {
        switch self {
        case let .NETWORK_ERROR(code): return code.count > 0 ? "NE|\(code)" : "NE"
        case .NETWORK_PARSE_ERROR: return "NE|PE"
        case let .NETWORK_SERVER_ERROR(statusCode): return "NE|SE-\(statusCode)"
        case let .NETWORK_NO_INTERNET_CONNECTION(code): return code.count > 0 ? "NE|\(code)" : "NE|NIC"
        case .TIME_INCONSISTENCY: return "NE|TI"
        }
    }
}
