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

class VerifierHomescreenBottomView: UIView {
    private let stackView = UIStackView()

    public var faqButtonCallback: (() -> Void)?
    public var modeButtonCallback: ((ScanModeButton) -> Void)?

    private let faqRoundView = UIView()
    private let faqButton = Button(image: UIImage(named: "ic-faq-verifier"), accessibilityKey: .verifier_homescreen_support_button)

    public var faqButtonGuide = UILayoutGuide()

    public func setMode(mode: CheckModeUIObject?) {
        scanModeButton.alpha = CheckModesHelper.onlyOneMode() ? 0.0 : 1.0
        scanModeButton.mode = mode
    }

    private let scanModeButton = ScanModeButton(addSettingsIcon: true)

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

        let v = UIView()
        stackView.addArrangedView(v)
        v.snp.makeConstraints { make in
            make.size.equalTo(44.0)
        }

        addLayoutGuide(faqButtonGuide)
        faqButtonGuide.snp.makeConstraints { make in
            make.top.equalTo(v)
        }

        stackView.addArrangedView(scanModeButton)
    }

    private func setupInteraction() {
        faqButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.faqButtonCallback?()
        }

        scanModeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.modeButtonCallback?(strongSelf.scanModeButton)
        }
    }
}
