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

    init(model: StaticContentViewModel) {
        super.init(models: [model])
        continueButtonTextKey = .wallet_onboarding_accept_button
    }

    override func setupViews(addBottomSpacer _: Bool = true) {
        super.setupViews(addBottomSpacer: false)

        let button = ExternalLinkButton(titleKey: .wallet_onboarding_external_privacy_button)
        button.touchUpCallback = {
            let url = Environment.current.privacyURL
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        button.accessibilityTraits = .link

        stackScrollView.addSpacerView(Padding.large + Padding.small)

        stackScrollView.addArrangedViewCentered(button, offset: Padding.large * 2)

        stackScrollView.addSpacerView(40)
    }
}
