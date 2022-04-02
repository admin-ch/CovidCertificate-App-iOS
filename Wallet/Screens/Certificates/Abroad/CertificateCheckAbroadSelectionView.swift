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

class CertificateCheckAbroadSelectionView: UIView {
    public var countries: [ArrivalCountry] = [] {
        didSet {
            countrySelectionPicker.reloadAllComponents()
        }
    }

    func setCountry(country: ArrivalCountry) {
        guard let index = countries.firstIndex(of: country) else { return }
        countrySelectionPicker.selectRow(index, inComponent: 0, animated: true)
        countrySelectionButton.valueString = country.localizedString
    }

    func setDate(date: Date) {
        dateSelectionPicker.setDate(date, animated: true)
        dateSelectionButton.valueString = DateFormatter.ub_dayTimeString(from: date)
    }

    public var didSelectCountry: ((ArrivalCountry) -> Void)?

    public var didSelectDate: ((Date) -> Void)?

    private let stackView = UIStackView()
    private let countrySelectionButton = SelectionButton(title: UBLocalized.wallet_foreign_rules_check_country_label)
    private let countrySelectionPicker = UIPickerView()
    private let dateSelectionButton = SelectionButton(title: UBLocalized.wallet_foreign_rules_check_date_label)
    private let dateSelectionPicker = UIDatePicker()

    init() {
        super.init(frame: .zero)

        backgroundColor = .cc_greyish
        layer.cornerRadius = 10
        clipsToBounds = false

        stackView.axis = .vertical
        stackView.alignment = .fill

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 13, left: Padding.medium, bottom: Padding.large, right: Padding.medium))
        }

        let title = Label(.textBoldLarge, textAlignment: .center)
        title.text = UBLocalized.wallet_foreign_rules_check_form_title

        stackView.addArrangedView(title)
        stackView.addSpacerView(10)
        addExpandableButton(button: countrySelectionButton, expandedView: countrySelectionPicker)
        stackView.addSpacerView(10)
        addExpandableButton(button: dateSelectionButton, expandedView: dateSelectionPicker)

        if #available(iOS 14.0, *) {
            dateSelectionPicker.preferredDatePickerStyle = .inline
            dateSelectionPicker.locale = Locale.current
        }

        countrySelectionButton.valueString = UBLocalized.wallet_foreign_rules_check_country_empty_label

        countrySelectionPicker.delegate = self
        countrySelectionPicker.dataSource = self

        dateSelectionPicker.minimumDate = Date()
        dateSelectionPicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)

        dateSelectionButton.valueString = DateFormatter.ub_dayTimeString(from: Date())
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addExpandableButton(button: SelectionButton, expandedView: UIView) {
        stackView.addArrangedView(button)
        stackView.addArrangedView(expandedView)

        expandedView.isHidden = true
        button.didExpand = { expanded in
            expandedView.isHidden = !expanded
            self.stackView.superview?.layoutIfNeeded()
        }
    }

    // MARK: - Date Picker

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        didSelectDate?(sender.date)
        dateSelectionButton.valueString = DateFormatter.ub_dayTimeString(from: sender.date)
    }
}

// MARK: - UIPickerView DataSource

extension CertificateCheckAbroadSelectionView: UIPickerViewDataSource {
    func numberOfComponents(in _: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return countries.count
    }

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        return countries[row].localizedString
    }
}

// MARK: - UIPickerView Delegate

extension CertificateCheckAbroadSelectionView: UIPickerViewDelegate {
    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent _: Int) {
        didSelectCountry?(countries[row])
        countrySelectionButton.valueString = countries[row].localizedString
    }
}
