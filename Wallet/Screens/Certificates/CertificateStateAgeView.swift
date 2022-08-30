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
import UIKit

class CertificateStateAgeView: UIView {
    // MARK: - Age

    let dateTitleLabel = Label(.text)
    let dateLabel = Label(.textBold)

    let ageTitleLabel = Label(.text, numberOfLines: 1, textAlignment: .right)
    let ageLabel = Label(.textBold, numberOfLines: 1, textAlignment: .right)
    private let ageView = UIView()

    // MARK: - Offline

    private let offlineLabel = Label(.text, textAlignment: .center)
    private let offlineView = UIView()

    // MARK: - API

    var certificate: UserCertificate? {
        didSet {
            updateLabels()
        }
    }

    var textColor: UIColor = .cc_black {
        didSet {
            dateTitleLabel.textColor = textColor
            dateLabel.textColor = textColor
            ageTitleLabel.textColor = textColor
            ageLabel.textColor = textColor
        }
    }

    var isOfflineMode: Bool = false {
        didSet {
            ageView.ub_setHidden(isOfflineMode)
            offlineView.ub_setHidden(!isOfflineMode)
        }
    }

    var offlineText: String? {
        didSet { offlineLabel.text = offlineText }
    }

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Update

    private func updateLabels() {
        func resetView() {
            dateTitleLabel.text = nil
            dateLabel.text = nil
            ageTitleLabel.text = nil
            ageLabel.text = nil
        }

        let c = CovidCertificateSDK.Wallet.decode(encodedData: certificate?.qrCode ?? "")
        switch c {
        case let .success(holder):
            guard let cert = holder.certificate as? DCCCert else {
                resetView()
                return
            }
            ageTitleLabel.text = UBLocalized.wallet_validity_since_prefix
            switch cert.immunisationType {
            case .vaccination:
                dateTitleLabel.text = UBLocalized.wallet_validity_since_vaccination_date
                if let vaccination = cert.vaccinations?.first {
                    dateLabel.text = vaccination.displayDateOfVaccination
                    ageLabel.text = RelativeDateFormatter.string(from: vaccination.dateOfVaccination)
                }
            case .recovery:
                dateTitleLabel.text = UBLocalized.wallet_validity_since_test_date
                if let infection = cert.pastInfections?.first {
                    dateLabel.text = infection.displayFirstPositiveTestDay
                    ageLabel.text = RelativeDateFormatter.string(from: infection.firstPositiveTestResultDate)
                }

            case .test:
                dateTitleLabel.text = UBLocalized.wallet_validity_since_test_date
                if let test = cert.tests?.first {
                    if let sampleDate = test.sampleDate {
                        let now = Date()
                        let hours = Calendar.current.dateComponents([.hour], from: sampleDate, to: now).hour ?? 0
                        if hours > 72 {
                            ageTitleLabel.text = UBLocalized.wallet_validity_since_more_hours_prefix
                            ageLabel.text = UBLocalized.wallet_validity_since_hours_plural.replacingOccurrences(of: "{HOURS}", with: "72")
                        } else {
                            ageLabel.text = RelativeDateFormatter.string(from: sampleDate)
                        }
                    }

                    dateLabel.text = test.displaySampleDate
                }
            default:
                break
            }

        default:
            resetView()
        }
    }

    // MARK: - Setup

    private func setupView() {
        layer.cornerRadius = 10

        let stackView = UIStackView()
        stackView.axis = .vertical

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        ageView.addSubview(dateTitleLabel)
        ageView.addSubview(dateLabel)

        ageView.addSubview(ageTitleLabel)
        ageView.addSubview(ageLabel)

        dateTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(2 * Padding.small)
            make.leading.equalToSuperview().inset(Padding.medium)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTitleLabel.snp.bottom)
            make.leading.equalToSuperview().inset(Padding.medium)
        }

        ageTitleLabel.text = "vor"
        ageTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTitleLabel)
            make.trailing.equalToSuperview().inset(Padding.medium)
            make.leading.equalTo(dateTitleLabel.snp.trailing).offset(Padding.small)
        }
        ageTitleLabel.ub_setContentPriorityRequired()

        ageLabel.text = "–"
        ageLabel.snp.makeConstraints { make in
            make.trailing.equalTo(ageTitleLabel)
            make.top.equalTo(ageTitleLabel.snp.bottom)
            make.bottom.equalToSuperview().inset(2 * Padding.small)
        }

        stackView.addArrangedSubview(ageView)

        offlineView.addSubview(offlineLabel)

        offlineLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(2 * Padding.small)
            make.left.right.equalToSuperview().inset(Padding.medium)
        }

        stackView.addArrangedSubview(offlineView)

        isOfflineMode = false
    }
}
