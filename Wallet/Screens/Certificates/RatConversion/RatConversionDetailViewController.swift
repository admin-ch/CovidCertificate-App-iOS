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

import Foundation
import UIKit

class RatConversionDetailViewController: StackScrollViewController {
    // MARK: - Variables

    private let certificate: UserCertificate

    // MARK: - Init

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init()
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        title = UBLocalized.wallet_certificate.uppercased()
        view.backgroundColor = .cc_background
        setup()
    }

    // MARK: - Setup

    private func setup() {
        stackScrollView.stackView.alignment = .fill

        let p = 2.0 * Padding.medium

        let title = Label(.title, textAlignment: .center)
        title.text = UBLocalized.rat_conversion_title
        addArrangedView(title, insets: UIEdgeInsets(top: 0, left: p, bottom: 0, right: p))

        let text = Label(.text)
        text.text = UBLocalized.rat_conversion_text
        addArrangedView(text, spacing: Padding.large, insets: UIEdgeInsets(top: Padding.large, left: p, bottom: 0, right: p))

        let boxPadding = Padding.medium
        let formView = RatConversionFormView()

        formView.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.openForm(addHcert: true)
        }

        addArrangedView(formView, spacing: 6, insets: UIEdgeInsets(top: 0, left: boxPadding, bottom: Padding.large, right: boxPadding))

        let linkButton = ExternalLinkButton(title: UBLocalized.rat_conversion_link_antragsstelle)
        linkButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.openForm(addHcert: false)
        }

        addArrangedView(linkButton,
                        insets: UIEdgeInsets(top: 0, left: boxPadding, bottom: 2.0 * Padding.large, right: boxPadding))

        let hintsTitle = Label(.textBoldLarge, textAlignment: .left)
        hintsTitle.text = UBLocalized.rat_conversion_info_title

        addArrangedView(hintsTitle, spacing: Padding.large, insets: UIEdgeInsets(top: 0, left: p, bottom: 0, right: p))

        let infos = [(UBLocalized.rat_conversion_info1_text, "ic-bund-small"), (UBLocalized.rat_conversion_info2_text, "ic-swap")]

        for info in infos {
            addArrangedView(OnboardingInfoView(icon: UIImage(named: info.1), text: info.0, alignment: .left))
        }
    }

    private func openForm(addHcert: Bool) {
        guard var url = ConfigManager.currentConfig?.ratConversionFormUrl else {
            return
        }

        if let qrCode = certificate.qrCode?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed), addHcert {
            url.append("#hcert=\(qrCode)")
        }

        guard let u = URL(string: url) else { return }
        UIApplication.shared.open(u, options: [:], completionHandler: nil)
    }
}

class RatConversionFormView: UIView {
    public var touchUpCallback: (() -> Void)? {
        didSet {
            formButton.touchUpCallback = { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.touchUpCallback?()
            }
        }
    }

    public let formButton = FormButton()

    init() {
        super.init(frame: .zero)

        backgroundColor = .cc_blueish
        layer.cornerRadius = 10
        clipsToBounds = false

        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Padding.medium

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(Padding.medium)
            make.right.equalToSuperview().inset(Padding.medium)
            make.bottom.equalToSuperview().inset(Padding.large)
        }

        let titleLabel = Label(.textBoldLarge, textAlignment: .center)
        titleLabel.text = UBLocalized.rat_conversion_form_title

        let checkView = RatConversionCheckButton(text: UBLocalized.rat_conversion_form_text)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(checkView)
        stackView.addArrangedSubview(formButton)

        checkView.touchUpCallback = { [weak self, weak checkView] in
            guard let strongSelf = self, let strongC = checkView else { return }
            strongSelf.select(strongC)
        }

        formButton.isEnabled = false
    }

    private func select(_ checkView: RatConversionCheckButton) {
        checkView.setSelected(!checkView.checked, animated: true)

        let newChecked = checkView.checked
        formButton.isEnabled = newChecked
    }
}

private class RatConversionCheckButton: UBButton {
    private let label = Label(.text)
    private let checkBoxView = UIImageView()

    init(text: String) {
        label.text = text

        super.init()
        snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(48.0)
        }

        layer.cornerRadius = 10
        highlightCornerRadius = 10
        highlightXInset = -5
        highlightYInset = -5

        highlightedBackgroundColor = .cc_touchState

        setup()

        accessibilityLabel = label.text
    }

    public var checked: Bool = false

    public func setSelected(_ selected: Bool, animated: Bool) {
        checked = selected

        let actions = {
            self.checkBoxView.image = selected ? UIImage(named: "ic-checkbox-filled")?.ub_image(with: UIColor.cc_blue) : UIImage(named: "ic-checkbox-empty")
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
        addSubview(label)

        checkBoxView.ub_setContentPriorityRequired()

        let inset = 0

        checkBoxView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(inset)
            make.centerY.equalTo(label.snp_firstBaseline).offset(-label.font.capHeight * 0.5)
        }

        label.snp.makeConstraints { make in
            make.left.greaterThanOrEqualTo(self.checkBoxView.snp.right).offset(2.0 * Padding.small)
            make.right.equalToSuperview().inset(inset)
            make.top.greaterThanOrEqualToSuperview().inset(Padding.small)
            make.bottom.lessThanOrEqualToSuperview().inset(Padding.small)
        }

        setSelected(false, animated: false)
    }
}

class FormButton: UBButton {
    private let externalImageView: UIImageView
    private let label = Label(.uppercaseBold, textColor: .white, numberOfLines: 2)

    override init() {
        externalImageView = UIImageView(image: UIImage(named: "ic-link-external")?.ub_image(with: UIColor.white))
        super.init()
        setup()

        // Size
        let s: CGFloat = 56.0

        highlightCornerRadius = s * 0.5
        layer.cornerRadius = s * 0.5

        snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(s)
        }

        backgroundColor = UIColor.cc_blue
        highlightedBackgroundColor = UIColor.black.withAlphaComponent(0.2)

        label.text = UBLocalized.rat_conversion_form_button

        isAccessibilityElement = true
        accessibilityLabel = label.text
    }

    private func setup() {
        let stackView = UIStackView()
        stackView.spacing = Padding.small
        stackView.isUserInteractionEnabled = false
        stackView.alignment = .center

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Padding.large)
            make.centerY.equalToSuperview()
        }

        label.ub_setContentPriorityRequired()
        externalImageView.ub_setContentPriorityRequired()

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(externalImageView)

        label.isUserInteractionEnabled = false
        externalImageView.isUserInteractionEnabled = false
    }

    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? .cc_blue : .clear
            label.textColor = isEnabled ? .cc_white : .cc_grey
            externalImageView.image = UIImage(named: "ic-link-external")?.ub_image(with: isEnabled ? UIColor.cc_white : .cc_grey)
            layer.borderColor = UIColor.cc_grey.cgColor
            layer.borderWidth = isEnabled ? 0.0 : 2.0
        }
    }
}
