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

class CertificateDetailView: UIView {
    public var certificate: UserCertificate? {
        didSet {
            setup()
            update(animated: true)
        }
    }

    private var holder: DGCHolder?

    private let stackView = UIStackView()

    var states: (state: VerificationState, temporaryVerifierState: TemporaryVerifierState) = (.loading, .idle) {
        didSet { update(animated: true) }
    }

    private let showEnglishLabels: Bool

    private var labels: [UILabel] = []
    private var englishLabels: [UILabel] = []

    // MARK: - Init

    init(showEnglishLabelsIfNeeded: Bool) {
        showEnglishLabels = showEnglishLabelsIfNeeded && !UBLocalized.languageIsEnglish()
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        let result = CovidCertificateSDK.Wallet.decode(encodedData: certificate?.qrCode ?? "")

        switch result {
        case let .success(holder):
            self.holder = holder
        case .failure:
            break
        }

        for v in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(v)
            v.removeFromSuperview()
        }

        addSubview(stackView)

        stackView.axis = .vertical

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        addVaccinationEntries()
        addRecoveryEntries()
        addTestEntries()

        updateEnglishLabelVisibility()
        applySuccessState()
    }

    private func addVaccinationEntries() {
        guard let vaccinations = holder?.healthCert.vaccinations,
              vaccinations.count > 0 else { return }

        addDividerLine()

        if vaccinations.allSatisfy({ $0.doseNumber == $0.totalDoses }) {
            addTitle(title: UBLocalized.translationWithEnglish(key: .covid_certificate_vaccination_title_key))
        } else {
            addTitle(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_type_incomplete_vaccine_key))
        }

        for vaccination in vaccinations {
            addDividerLine()

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_impfdosis_title_key), value: vaccination.getNumberOverTotalDose)

            // Vaccine data
            if vaccination.isTargetDiseaseCorrect {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_target_disease_title_key), value: UBLocalized.target_disease_name)
            }

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_vaccine_prophylaxis_key), value: vaccination.prophylaxis)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_impfstoff_product_name_title_key), value: vaccination.name)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_impfstoff_holder_key), value: vaccination.authHolder)

            addDividerLine()

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_vaccination_date_title_key), value: vaccination.displayDateOfVaccination)
            if showEnglishLabels, let displayCountryEnglish = vaccination.displayCountryEnglish {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_vaccination_country_title_key), value: vaccination.displayCountry + " / " + displayCountryEnglish)
            } else {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_vaccination_country_title_key), value: vaccination.displayCountry)
            }
            addDividerLine()

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_vaccination_issuer_title_key), value: vaccination.certificateIssuer)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_identifier_key), value: vaccination.certificateIdentifier, addEnglishLabels: false)

            addIssuedDate(dateString: holder?.displayIssuedAt, incomplete: vaccination.doseNumber != vaccination.totalDoses)
        }
    }

    private func addRecoveryEntries() {
        guard let pastInfections = holder?.healthCert.pastInfections,
              pastInfections.count > 0
        else { return }

        addDividerLine()
        addTitle(title: UBLocalized.translationWithEnglish(key: .covid_certificate_recovery_title_key))

        for pastInfection in pastInfections {
            addDividerLine()

            if pastInfection.isTargetDiseaseCorrect {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_target_disease_title_key), value: UBLocalized.target_disease_name)
            }

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_recovery_first_positiv_result_key), value: pastInfection.displayFirstPositiveTest)

            addDividerLine()

            if showEnglishLabels, let displayCountryEnglish = pastInfection.displayCountryEnglish {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_land_key), value: pastInfection.displayCountry + " / " + displayCountryEnglish)
            } else {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_land_key), value: pastInfection.displayCountry)
            }

            addDividerLine()

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_vaccination_issuer_title_key), value: pastInfection.certificateIssuer)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_identifier_key), value: pastInfection.certificateIdentifier, addEnglishLabels: false)

            addIssuedDate(dateString: holder?.displayIssuedAt, incomplete: false)
        }
    }

    private func addTestEntries() {
        guard let tests = holder?.healthCert.tests,
              tests.count > 0
        else { return }

        addDividerLine()
        addTitle(title: UBLocalized.translationWithEnglish(key: .covid_certificate_test_title_key))

        for test in tests {
            addDividerLine()

            if test.isTargetDiseaseCorrect {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_target_disease_title_key), value: UBLocalized.target_disease_name)
            }

            let texts = test.isNegative ? UBLocalized.translationWithEnglish(key: .wallet_certificate_test_result_negativ_key) : UBLocalized.translationWithEnglish(key: .wallet_certificate_test_result_positiv_key)

            var text = [texts.0, texts.1].joined(separator: "\n")
            if !showEnglishLabels {
                text = texts.0
            }

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_result_title_key), value: text)

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_type_key), value: test.testType)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_name_key), value: test.testName)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_holder_key), value: test.manufacturer)

            addDividerLine()

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_sample_date_title_key), value: test.displaySampleDateTime)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_result_date_title_key), value: test.displayResultDateTime)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_done_by_key), value: test.testCenter)
            if showEnglishLabels, let displayCountryEnglish = test.displayCountryEnglish {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_land_key), value: test.displayCountry + " / " + displayCountryEnglish)
            } else {
                addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_test_land_key), value: test.displayCountry)
            }
            addDividerLine()

            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_vaccination_issuer_title_key), value: test.certificateIssuer)
            addValueItem(title: UBLocalized.translationWithEnglish(key: .wallet_certificate_identifier_key), value: test.certificateIdentifier, addEnglishLabels: false)

            addIssuedDate(dateString: holder?.displayIssuedAt, incomplete: false)
        }
    }

    // MARK: - Content

    private func addTitle(title: (String, String)) {
        let label = Label(.uppercaseBold, textColor: .cc_black)
        label.text = title.0
        stackView.addArrangedView(label)

        let englishLabel = Label(.text, textColor: .cc_greyText)
        englishLabel.text = title.1
        stackView.addArrangedView(englishLabel)

        stackView.addSpacerView(Padding.large)

        labels.append(label)
        englishLabels.append(englishLabel)
    }

    private func addValueItem(title: (String, String), value: String?, addEnglishLabels: Bool = true) {
        guard let v = value else { return }

        let sv = UIStackView()
        sv.axis = .vertical
        sv.isAccessibilityElement = true

        // we add what the screen shows to accessibility
        if UBLocalized.languageIsEnglish() || !addEnglishLabels {
            sv.accessibilityLabel = [title.0, v].joined(separator: ", ")
        } else {
            sv.accessibilityLabel = [title.0, title.1, v].joined(separator: ", ")
        }

        let titleLabel = Label(.textBold)
        titleLabel.text = v
        sv.addArrangedView(titleLabel)

        let textLabel = Label(.text)
        textLabel.text = title.0
        sv.addArrangedView(textLabel)

        if addEnglishLabels {
            let textLabelEnglish = Label(.text, textColor: .cc_greyText)
            textLabelEnglish.text = title.1
            sv.addArrangedView(textLabelEnglish)
            englishLabels.append(textLabelEnglish)
        }

        stackView.addArrangedView(sv)

        stackView.addSpacerView(Padding.large)

        labels.append(titleLabel)
        labels.append(textLabel)
    }

    private func addValueItem(value: (String?, String?), spacing: CGFloat = 0.0) {
        guard let v = value.0, let vEnglish = value.1
        else { return }

        let textLabel = Label(.text)
        textLabel.text = v
        stackView.addArrangedView(textLabel)

        if spacing > 0.0 {
            stackView.addSpacerView(spacing)
        }

        let englishLabel = Label(.text, textColor: .cc_grey)
        englishLabel.text = vEnglish
        stackView.addArrangedView(englishLabel)

        stackView.addSpacerView(Padding.large)

        labels.append(textLabel)
        englishLabels.append(englishLabel)
    }

    private func addDividerLine(hasTopPadding _: Bool = true) {
        stackView.addArrangedView(DashedLineView())
        stackView.addSpacerView(Padding.large)
    }

    private func addIssuedDate(dateString: String?, incomplete: Bool) {
        guard let d = dateString else { return }

        let values: (String, String)
        if incomplete {
            values = UBLocalized.translationWithEnglish(key: .wallet_certificate_evidence_creation_date_key)
        } else {
            values = UBLocalized.translationWithEnglish(key: .wallet_certificate_date_key)
        }

        addValueItem(value: (values.0.replacingOccurrences(of: "{DATE}", with: d), values.1.replacingOccurrences(of: "{DATE}", with: d)), spacing: Padding.large)
    }

    // MARK: - Update

    private func applyLoadingState() {
        for l in labels {
            l.textColor = .cc_grey
        }
    }

    private func applySuccessState() {
        for l in labels {
            l.textColor = .cc_text
        }
    }

    private func applyErrorState() {
        for l in labels {
            l.textColor = .cc_grey
        }
    }

    private func update(animated: Bool) {
        // switch animatable states
        let actions = {
            switch self.states.temporaryVerifierState {
            case .success:
                self.applySuccessState()
            case .failure:
                self.applyErrorState()
            case .retry:
                self.applyErrorState()
            case .verifying:
                self.applyLoadingState()
            case .idle:
                switch self.states.state {
                case .loading:
                    self.applyLoadingState()
                case .success:
                    self.applySuccessState()
                case .invalid:
                    self.applyErrorState()
                case .retry:
                    self.applyErrorState()
                }
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

    private func updateEnglishLabelVisibility() {
        for l in englishLabels {
            l.ub_setHidden(!showEnglishLabels)
            l.alpha = showEnglishLabels ? 1.0 : 0.0
        }
    }
}

private class DashedLineView: UIView {
    private var shapeLayer = CAShapeLayer()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        layer.addSublayer(shapeLayer)

        shapeLayer.strokeColor = UIColor.cc_line.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.lineDashPattern = [NSNumber(value: Float(Padding.small)), NSNumber(value: Float(2.0 * Padding.small))]
        shapeLayer.lineCap = .round
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        let cgPath = CGMutablePath()
        let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: frame.width, y: 0)]
        cgPath.addLines(between: cgPoint)
        shapeLayer.path = cgPath
    }
}
