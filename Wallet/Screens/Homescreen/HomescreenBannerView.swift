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

class HomescreenBannerView: UIView {
    public var dismissButtonTouchUpCallback: (() -> Void)?

    private let insets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 10)

    private(set) var container = AccessibilityContainer()
    private let titleLabel = Label(.textBoldLarge, numberOfLines: 1, textAlignment: .left)

    private let dismissButton = Button(image: UIImage(named: "ic-close")?.ub_image(with: .black), accessibilityKey: .accessibility_close_button)

    enum State {
        case eol(ConfigResponseBody.EOLBannerInfo)
        case renew
        case wasRenewed(uvci: String)
    }

    var banner: State? {
        didSet {
            update()
        }
    }

    init() {
        super.init(frame: .zero)
        setup()
        setupInteraction()
        setupAccessibility()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func update() {
        switch banner {
        case let .eol(eolBanner):
            titleLabel.text = eolBanner.homescreenTitle
            container.accessibilityLabel = [titleLabel.text].compactMap { $0 }.joined(separator: ", ")
            backgroundColor = UIColor(ub_hexString: eolBanner.homescreenHexColor) ?? UIColor.cc_yellow
            dismissButton.isHidden = false
        case .wasRenewed:
            titleLabel.text = UBLocalized.wallet_certificate_renewal_successful_bubble_title
            container.accessibilityLabel = UBLocalized.wallet_certificate_renewal_successful_bubble_title
            backgroundColor = UIColor.cc_greenish
            dismissButton.isHidden = false
        case .renew:
            titleLabel.text = UBLocalized.wallet_certificate_renewal_required_bubble_title
            container.accessibilityLabel = UBLocalized.wallet_certificate_renewal_required_bubble_title
            backgroundColor = UIColor.cc_redish
            dismissButton.isHidden = true
        case .none:
            titleLabel.text = nil
            container.accessibilityLabel = nil
            backgroundColor = UIColor.clear
            dismissButton.isHidden = true
        }
    }

    private func setup() {
        addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(dismissButton)

        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(insets)
            make.top.equalToSuperview().inset(insets)
            make.trailing.lessThanOrEqualTo(dismissButton.snp.leading).offset(-Padding.small)
            make.bottom.equalToSuperview().inset(insets)
        }

        dismissButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }

        layer.cornerRadius = 10
        clipsToBounds = true
    }

    private func setupInteraction() {
        dismissButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            // callbacks
            strongSelf.dismissButtonTouchUpCallback?()
        }
    }

    override func hitTest(_ point: CGPoint, with _: UIEvent?) -> UIView? {
        if dismissButton.frame.contains(point) {
            return dismissButton
        }

        return nil
    }

    private func setupAccessibility() {
        container.isAccessibilityElement = true
        dismissButton.isAccessibilityElement = !dismissButton.isHidden

        container.accessibilityLabel = [titleLabel.text].compactMap { $0 }.joined(separator: ", ")
        container.accessibilityTraits = .button

        accessibilityElements = [container] + (dismissButton.isHidden ? [] : [dismissButton])
        isAccessibilityElement = false
    }
}
