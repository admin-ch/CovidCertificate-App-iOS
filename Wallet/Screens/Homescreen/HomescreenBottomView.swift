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

class HomescreenBottomView: UIView {
    private let stackView = UIStackView()

    public var faqButtonCallback: (() -> Void)?
    public var listButtonCallback: (() -> Void)?
    public var addButtonCallback: (() -> Void)?

    private let faqRoundView = UIView()
    private let faqButton = Button(image: UIImage(named: "ic-faq"), accessibilityName: UBLocalized.accessibility_faq_button)
    private let listButton = Button(image: UIImage(named: "ic-list"), accessibilityName: UBLocalized.accessibility_list_button)

    public var state: HomescreenState = .onboarding {
        didSet { update() }
    }

    public var addButtonGuide = UILayoutGuide()

    init() {
        super.init(frame: .zero)
        setup()
        setupInteraction()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(faqRoundView)

        let r: CGFloat = 115.0
        faqRoundView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.left)
            make.centerY.equalTo(self.snp.bottom)
            make.height.width.equalTo(2 * r)
        }

        faqRoundView.layer.cornerRadius = r
        faqRoundView.backgroundColor = UIColor.black.withAlphaComponent(0.1)

        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview().inset(Padding.large)

            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
            if bottomPadding > 0 {
                make.bottom.equalTo(self.snp.bottomMargin)
            } else {
                make.bottom.equalToSuperview().inset(Padding.large)
            }
        }

        stackView.alignment = .center
        stackView.distribution = .equalSpacing

        stackView.addArrangedView(faqButton)
        stackView.addArrangedView(listButton)

        let v = UIView()
        stackView.addArrangedView(v)
        v.snp.makeConstraints { make in
            make.size.equalTo(44.0)
        }

        addLayoutGuide(addButtonGuide)
        addButtonGuide.snp.makeConstraints { make in
            make.center.equalTo(v)
        }
    }

    private func setupInteraction() {
        faqButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.faqButtonCallback?()
        }

        listButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.listButtonCallback?()
        }
    }

    private func update() {
        let hasMultipleCertificates = UIStateManager.shared.uiState.certificateState.certificates.count > 1
        listButton.alpha = state == .certificates && hasMultipleCertificates ? 1.0 : 0.0
        faqButton.alpha = state == .certificates || state == .onboarding ? 1.0 : 0.0
    }
}
