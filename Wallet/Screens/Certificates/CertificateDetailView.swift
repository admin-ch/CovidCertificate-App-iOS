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
    private let certificate: UserCertificate
    private var holder: DGCHolder?

    private let stackView = UIStackView()

    var states: (state: VerificationState, temporaryVerifierState: TemporaryVerifierState) = (.loading, .idle) {
        didSet { update(animated: true) }
    }

    private var labels: [UILabel] = []

    // MARK: - Init

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init(frame: .zero)

        let result = CovidCertificateSDK.decode(encodedData: self.certificate.qrCode)

        switch result {
        case let .success(holder):
            self.holder = holder
        case .failure:
            break
        }

        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        addSubview(stackView)

        stackView.axis = .vertical

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        addVaccinationEntries()
        addRecoveryEntries()
        addTestEntries()
    }

    private func addVaccinationEntries() {
        guard let vaccinations = holder?.healthCert.vaccinations,
              vaccinations.count > 0 else { return }

        addDividerLine()
        addTitle(title: UBLocalized.covid_certificate_vaccination_title)

        for vaccination in vaccinations {
            addDividerLine()

            addTitleStatusItem(title: UBLocalized.wallet_certificate_impfdosis_title, value: vaccination.getNumberOverTotalDose)

            // Vaccine data
            if vaccination.isTargetDiseaseCorrect {
                addValueItem(title: UBLocalized.wallet_certificate_target_disease_title, value: UBLocalized.target_disease_name)
            }

            addValueItem(title: UBLocalized.wallet_certificate_vaccine_prophylaxis, value: vaccination.prophylaxis)
            addValueItem(title: UBLocalized.wallet_certificate_impfstoff_product_name_title, value: vaccination.name)
            addValueItem(title: UBLocalized.wallet_certificate_impfstoff_holder, value: vaccination.authHolder)

            addDividerLine()

            addValueItem(title: UBLocalized.wallet_certificate_vaccination_date_title, value: vaccination.displayDateOfVaccination)
            addValueItem(title: UBLocalized.wallet_certificate_vaccination_country_title, value: vaccination.displayCountry)

            addDividerLine()

            addValueItem(title: UBLocalized.wallet_certificate_vaccination_issuer_title, value: vaccination.certificateIssuer)
            addValueItem(title: UBLocalized.wallet_certificate_identifier, value: vaccination.certificateIdentifier)

            if let d = holder?.displayIssuedAt {
                addValueItem(value: UBLocalized.wallet_certificate_date.replacingOccurrences(of: "{DATE}", with: d))
            }
        }
    }

    private func addRecoveryEntries() {
        guard let pastInfections = holder?.healthCert.pastInfections,
              pastInfections.count > 0
        else { return }

        addDividerLine()
        addTitle(title: UBLocalized.covid_certificate_recovery_title)

        for pastInfection in pastInfections {
            addDividerLine()

            if pastInfection.isTargetDiseaseCorrect {
                addValueItem(title: UBLocalized.wallet_certificate_target_disease_title, value: UBLocalized.target_disease_name)
            }

            addValueItem(title: UBLocalized.wallet_certificate_recovery_first_positiv_result, value: pastInfection.displayFirstPositiveTest)

            addDividerLine()

            addValueItem(title: UBLocalized.wallet_certificate_test_land, value: pastInfection.displayCountry)

            addDividerLine()

            addValueItem(title: UBLocalized.wallet_certificate_vaccination_issuer_title, value: pastInfection.certificateIssuer)
            addValueItem(title: UBLocalized.wallet_certificate_identifier, value: pastInfection.certificateIdentifier)

            if let d = holder?.displayIssuedAt {
                addValueItem(value: UBLocalized.wallet_certificate_date.replacingOccurrences(of: "{DATE}", with: d))
            }
        }
    }

    private func addTestEntries() {
        guard let tests = holder?.healthCert.tests,
              tests.count > 0
        else { return }

        addDividerLine()
        addTitle(title: UBLocalized.covid_certificate_test_title)

        for test in tests {
            addDividerLine()

            if test.isTargetDiseaseCorrect {
                addValueItem(title: UBLocalized.wallet_certificate_target_disease_title, value: UBLocalized.target_disease_name)
            }
            addValueItem(title: UBLocalized.wallet_certificate_test_result_title, value: test.isNegative ? UBLocalized.wallet_certificate_test_result_negativ : UBLocalized.wallet_certificate_test_result_positiv)
            addValueItem(title: UBLocalized.wallet_certificate_test_type, value: test.testType)
            addValueItem(title: UBLocalized.wallet_certificate_test_name, value: test.testName)
            addValueItem(title: UBLocalized.wallet_certificate_test_holder, value: test.manufacturer)

            addDividerLine()

            addValueItem(title: UBLocalized.wallet_certificate_test_sample_date_title, value: test.displaySampleDateTime)
            addValueItem(title: UBLocalized.wallet_certificate_test_result_date_title, value: test.displayResultDateTime)
            addValueItem(title: UBLocalized.wallet_certificate_test_done_by, value: test.testCenter)
            addValueItem(title: UBLocalized.wallet_certificate_test_land, value: test.displayCountry)

            addDividerLine()

            addValueItem(title: UBLocalized.wallet_certificate_vaccination_issuer_title, value: test.certificateIssuer)
            addValueItem(title: UBLocalized.wallet_certificate_identifier, value: test.certificateIdentifier)

            if let d = holder?.displayIssuedAt {
                addValueItem(value: UBLocalized.wallet_certificate_date.replacingOccurrences(of: "{DATE}", with: d))
            }
        }
    }

    // MARK: - Content

    private func addTitle(title: String) {
        let label = Label(.uppercaseBold, textColor: .cc_black)
        label.text = title
        stackView.addArrangedView(label)

        stackView.addSpacerView(Padding.large)

        labels.append(label)
    }

    private func addValueItem(title: String, value: String?) {
        guard let v = value else { return }

        let sv = UIStackView()
        sv.axis = .vertical
        sv.isAccessibilityElement = true
        sv.accessibilityLabel = [title, v].joined(separator: ", ")

        let titleLabel = Label(.textBold)
        titleLabel.text = v
        sv.addArrangedView(titleLabel)

        let textLabel = Label(.text)
        textLabel.text = title
        sv.addArrangedView(textLabel)

        stackView.addArrangedView(sv)

        stackView.addSpacerView(Padding.large)

        labels.append(titleLabel)
        labels.append(textLabel)
    }

    private func addValueItem(value: String?) {
        guard let v = value else { return }

        let textLabel = Label(.text)
        textLabel.text = v
        stackView.addArrangedView(textLabel)

        stackView.addSpacerView(Padding.large)

        labels.append(textLabel)
    }

    private func addDividerLine(hasTopPadding _: Bool = true) {
        stackView.addArrangedView(DashedLineView())
        stackView.addSpacerView(Padding.large)
    }

    private func addTitleStatusItem(title: String, value: String) {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = Padding.medium
        horizontalStackView.alignment = .firstBaseline

        let label = Label(.uppercaseBold, textColor: .cc_black)
        label.text = title
        horizontalStackView.addArrangedView(label)

        let valueLabel = Label(.uppercaseBold, textColor: .cc_black, textAlignment: .right)
        valueLabel.text = value
        horizontalStackView.addArrangedView(valueLabel)

        stackView.addArrangedView(horizontalStackView)

        horizontalStackView.isAccessibilityElement = true
        horizontalStackView.accessibilityLabel = [title, value].joined(separator: ", ")

        stackView.addSpacerView(Padding.large)

        labels.append(label)
        labels.append(valueLabel)
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
