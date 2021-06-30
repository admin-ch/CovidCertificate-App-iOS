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

import UIKit

class OnboardingDisclaimerViewController: StaticContentViewController {
    // MARK: - Init

    init() {
        super.init(models: [.privacy])
        continueButtonText = UBLocalized.wallet_onboarding_accept_button
    }

    override func setupViews(addBottomSpacer _: Bool = true) {
        super.setupViews(addBottomSpacer: false)

        let button = ExternalLinkButton(title: UBLocalized.wallet_onboarding_external_privacy_button)
        button.touchUpCallback = {
            let url = Environment.current.privacyURL
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        button.accessibilityTraits = .link

        let v = UIView()
        v.addSubview(button)

        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Padding.large + Padding.medium)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(70.0)
            make.right.lessThanOrEqualToSuperview().inset(Padding.medium)
        }

        addArrangedView(v)

        v.snp.makeConstraints { make in
            make.width.equalTo(self.view)
            make.left.right.equalToSuperview()
        }

        let bottomSpacer = UIView()
        bottomSpacer.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        addArrangedView(bottomSpacer)
    }
}
