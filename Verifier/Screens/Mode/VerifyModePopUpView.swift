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

class VerifyModePopUpView: PopupView {
    // MARK: - Public API

    public var chooseCallback: ((String) -> Void)?

    // MARK: - Subviews

    private let stackScrollView = StackScrollView(axis: .vertical)

    private let titleLabel = Label(.title, textAlignment: .center)
    private let textLabel = Label(.text, textAlignment: .center)
    private let button = Button(title: UBLocalized.continue_button, style: .normal(.cc_blue))

    private let buttonView = UIView()
    private let chooseButton = Button(title: UBLocalized.verifier_choose_mode_button_title, style: .normal(.cc_blue))

    private var checkBoxes: [CheckBox] = []

    init(selectedKey: String? = nil) {
        super.init(enableBackgroundDismiss: false)

        setupInteraction(selectedKey: selectedKey)
        chooseButton.isEnabled = false
    }

    // MARK: - Setup

    override internal func setup() {
        super.setup()

        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.small + Padding.medium
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)

        contentView.backgroundColor = .cc_white
        contentView.layer.cornerRadius = 20.0
        contentView.clipsToBounds = true

        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Padding.large)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().inset(6.0 * Padding.large)
            make.bottom.equalToSuperview().inset(6.0 * Padding.large)
        }

        contentView.addSubview(stackScrollView)
        contentView.addSubview(buttonView)

        buttonView.backgroundColor = .cc_white
        buttonView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
        }

        buttonView.addSubview(chooseButton)
        chooseButton.snp.makeConstraints { make in
            make.left.greaterThanOrEqualToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualToSuperview().inset(Padding.medium)
            make.centerX.top.bottom.equalToSuperview().inset(Padding.medium)
        }

        buttonView.ub_addShadow(radius: 8, opacity: 0.14, xOffset: 0, yOffset: 0)

        stackScrollView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(buttonView.snp.top)
        }

        titleLabel.text = UBLocalized.verifier_mode_title
        stackScrollView.addArrangedView(titleLabel, inset: UIEdgeInsets(top: Padding.large + Padding.small, left: 0, bottom: Padding.large + Padding.small, right: 0))

        setupCheckBoxes()

        for c in checkBoxes {
            stackScrollView.addArrangedView(c, inset: UIEdgeInsets(top: 0, left: 0, bottom: Padding.small, right: 0))
        }
    }

    private func setupInteraction(selectedKey: String?) {
        chooseButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }

            if let id = strongSelf.checkBoxes.first(where: { $0.checked })?.id {
                strongSelf.chooseCallback?(id)
                strongSelf.dismiss()
            }
        }

        for c in checkBoxes {
            c.touchUpCallback = { [weak self, weak c] in
                guard let strongSelf = self, let strongC = c else { return }
                strongSelf.select(strongC, animated: true)
            }
        }

        if let s = selectedKey {
            for c in checkBoxes {
                c.setSelected(c.id == s, animated: false)
            }
        }
    }

    private func select(_ checkBox: CheckBox, animated: Bool) {
        chooseButton.isEnabled = true

        for c in checkBoxes {
            c.setSelected(c == checkBox, animated: animated)
        }
    }

    private func setupCheckBoxes() {
        checkBoxes = CheckModesHelper.allModes().map { CheckBox(id: $0.id, text: $0.displayName, color: $0.color) }
    }
}

private class CheckBox: UBButton {
    public let id: String
    private let color: UIColor

    private let label = Label(.textBold)
    private let checkBoxView = UIImageView()

    init(id: String, text: String, color: UIColor) {
        self.id = id
        self.color = color
        label.text = text
        super.init()
        snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(48.0)
        }

        backgroundColor = .cc_greyish
        layer.cornerRadius = 10
        highlightCornerRadius = 10
        highlightedBackgroundColor = .cc_touchState

        setup()
    }

    public var checked: Bool = false

    public func setSelected(_ selected: Bool, animated: Bool) {
        checked = selected

        let actions = {
            self.checkBoxView.image = selected ? UIImage(named: "ic-checkbox-filled") : UIImage(named: "ic-checkbox-empty")
            self.backgroundColor = selected ? self.color : .cc_greyish
        }

        if animated {
            UIView.animate(withDuration: 0.2) { actions() }
        } else {
            actions()
        }
    }

    // MARK: - Setup

    private func setup() {
        addSubview(checkBoxView)
        checkBoxView.ub_setContentPriorityRequired()

        let inset = Padding.medium

        checkBoxView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(inset)
            make.centerY.equalToSuperview()
        }

        addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(inset)
            make.right.lessThanOrEqualTo(self.checkBoxView.snp.left).offset(-inset)
            make.top.greaterThanOrEqualToSuperview().inset(2.0 * Padding.small)
            make.bottom.lessThanOrEqualToSuperview().inset(2.0 * Padding.small)
        }

        setSelected(false, animated: false)
    }
}
