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
    struct SelectionObject {
        var date: Date?
        var country: ArrivalCountry?

        var isValid: Bool {
            return date != nil && country != nil
        }
    }

    private var currentSelection = SelectionObject()

    private let summary = CertificateLightSummaryView(isActive: false)
    private let loadingView = LoadingView()
    private let errorRetryVC = NetworkErrorRetryViewController(title: UBLocalized.wallet_certificate_light_detail_activation_error)
    private let selectionView = CertificateCheckAbroadSelectionView()
    private let stateView = CertificateStateView(showValidity: true)

    private let certificate: UserCertificate

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
        loadCountries()
    }

    func setupLayout() {
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

        let p = Padding.medium

        let title = Label(.title, textAlignment: .center)
        title.text = UBLocalized.wallet_foreign_rules_check_title
        addArrangedView(title,
                        insets: UIEdgeInsets(top: 0, left: p, bottom: 0, right: p))

        let text = Label(.text)
        text.text = UBLocalized.wallet_foreign_rules_check_subtitle
        addArrangedView(text,
                        spacing: Padding.large,
                        insets: UIEdgeInsets(top: Padding.large, left: p, bottom: 0, right: p))

        addArrangedView(selectionView,
                        spacing: 6,
                        insets: UIEdgeInsets(top: 0, left: p, bottom: 0, right: p))

        addArrangedView(stateView,
                        spacing: 50,
                        insets: UIEdgeInsets(top: 0, left: p, bottom: 0, right: p))

        let hintsTitle = Label(.textBoldLarge)
        hintsTitle.text = UBLocalized.wallet_foreign_rules_check_hints_title

        addArrangedView(hintsTitle,
                        spacing: Padding.large,
                        insets: UIEdgeInsets(top: Padding.large, left: p, bottom: 0, right: p))

        selectionView.countries = [ArrivalCountry.Switzerland, ArrivalCountry.Switzerland]
    }

    private func setupInteractions() {
        selectionView.didSelectDate = { [weak self] date in
            guard let self = self else { return }
            self.currentSelection.date = date
            if self.currentSelection.isValid {
                self.startCheck()
            }
        }

        selectionView.didSelectCountry = { [weak self] country in
            guard let self = self else { return }
            self.currentSelection.country = country
            if self.currentSelection.isValid {
                self.startCheck()
            }
        }
    }

    private func loadCountries() {
        loadingView.startLoading()
        errorRetryVC.view.alpha = 0.0

        CovidCertificateSDK.Wallet.foreignCountries { result in
            switch result {
            case let .success(countries):
                self.loadingView.stopLoading()
                self.selectionView.countries = countries
            case let .failure(error):
                // TODO: IZ-954 Conform NetworkError to ErrorViewModel
                // self.errorRetryVC.error = error
                self.loadingView.stopLoading()
                UIView.animate(withDuration: 0.25) {
                    self.errorRetryVC.view.alpha = 1.0
                }
            }
        }
    }

    // TODO: IZ-954 Probably need to add a new state for "Bitte wählen Sie ein Land und den Einreisezeitpunkt aus."

    private var state: VerificationState = .loading {
        didSet {
            if oldValue != state {
                update()
            }
        }
    }

    private func update() {
        stateView.states = (state, .idle)
    }

    private func startCheck() {
        guard let date = currentSelection.date, let country = currentSelection.country else { return }

        // TODO: IZ-954 Adapt VerifierManager so that we can pass country and date
//        guard let qrCode = certificate.qrCode else { return }

//        state = .loading
//
//        VerifierManager.shared.addObserver(self, for: qrCode, modes: Verifier.currentModes()) { [weak self] state in
//            guard let self = self else { return }
//            self.state = state
//        }
    }
}
