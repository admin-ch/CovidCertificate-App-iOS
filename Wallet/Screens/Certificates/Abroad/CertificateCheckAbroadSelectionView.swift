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
    // MARK: - Public API

    var useDateAndTime: Bool = false {
        didSet {
            dateSelectionPicker.datePickerMode = useDateAndTime ? .dateAndTime : .date
            dateSelectionButton.valueString = useDateAndTime ? DateFormatter.ub_dayTimeString(from: selectedDate) : DateFormatter.ub_dayString(from: selectedDate)
        }
    }

    var countries: [ArrivalCountry] = [] {
        didSet {
            countrySelectionPicker.reloadAllComponents()
        }
    }

    var selectedCountry: ArrivalCountry? {
        set {
            guard let newValue = newValue else {
                return
            }

            guard let index = countries.firstIndex(of: newValue) else { return }
            countrySelectionPicker.selectRow(index + 1, inComponent: 0, animated: true)
            countrySelectionButton.valueString = newValue.localizedString
            didSelectCountry?(newValue)
            countrySelectionButton.valueLabelTextColor = .cc_text
        }
        get {
            let row = countrySelectionPicker.selectedRow(inComponent: 0)
            if row == 0 {
                return nil
            } else {
                return countries[row - 1]
            }
        }
    }

    var selectedDate: Date {
        set {
            let d = max(Date(), newValue)
            dateSelectionPicker.minimumDate = Date()
            dateSelectionPicker.setDate(d, animated: true)
            dateSelectionButton.valueString = useDateAndTime ? DateFormatter.ub_dayTimeString(from: d) : DateFormatter.ub_dayString(from: d)
            didSelectDate?(d)
        }
        get {
            return dateSelectionPicker.date
        }
    }

    public var didSelectCountry: ((ArrivalCountry?) -> Void)?

    public var didSelectDate: ((Date) -> Void)?

    // MARK: - Subviews

    private let stackView = UIStackView()
    private let countrySelectionButton = SelectionButton(title: UBLocalized.wallet_foreign_rules_check_country_label)
    private let countrySelectionPicker = UIPickerView()
    private let dateSelectionButton = SelectionButton(title: UBLocalized.wallet_foreign_rules_check_date_label)
    private let dateSelectionPicker = UIDatePicker()

    // MARK: - Init

    init() {
        super.init(frame: .zero)

        backgroundColor = .cc_greyish
        layer.cornerRadius = 10
        clipsToBounds = false

        stackView.axis = .vertical

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
        countrySelectionButton.valueLabelTextColor = .cc_grey

        countrySelectionPicker.delegate = self
        countrySelectionPicker.dataSource = self

        dateSelectionPicker.minimumDate = Date()
        dateSelectionPicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addExpandableButton(button: SelectionButton, expandedView: UIView) {
        stackView.addArrangedView(button)

        let wrapper = UIView()
        wrapper.clipsToBounds = true
        wrapper.addSubview(expandedView)
        expandedView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalToSuperview().priority(.low)
        }
        wrapper.alpha = 0.0

        stackView.addArrangedView(wrapper)

        wrapper.isHidden = true
        button.didExpand = { expanded in
            wrapper.isHidden = !expanded
            wrapper.alpha = expanded ? 1.0 : 0.0
            self.stackView.superview?.layoutIfNeeded()
        }
    }

    // MARK: - Date Picker

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        // We do not allow dates in the past
        let date = max(Date(), sender.date)
        dateSelectionPicker.minimumDate = Date()
        didSelectDate?(date)
        dateSelectionButton.valueString = useDateAndTime ? DateFormatter.ub_dayTimeString(from: date) : DateFormatter.ub_dayString(from: date)
    }
}

// MARK: - UIPickerView DataSource

extension CertificateCheckAbroadSelectionView: UIPickerViewDataSource {
    func numberOfComponents(in _: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return countries.count + 1 // +1 for empty label
    }

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        if row == 0 {
            return ""
        } else {
            return countries[row - 1].localizedString
        }
    }
}

// MARK: - UIPickerView Delegate

extension CertificateCheckAbroadSelectionView: UIPickerViewDelegate {
    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent _: Int) {
        if row == 0 {
            didSelectCountry?(nil)
            countrySelectionButton.valueString = UBLocalized.wallet_foreign_rules_check_country_empty_label
            countrySelectionButton.valueLabelTextColor = .cc_grey
        } else {
            didSelectCountry?(countries[row - 1])
            countrySelectionButton.valueString = countries[row - 1].localizedString
            countrySelectionButton.valueLabelTextColor = .cc_text
        }
    }
}
