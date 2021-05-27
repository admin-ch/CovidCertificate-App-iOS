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

class OnboardingViewController: OnboardingBaseViewController {
    private let step1VC = StaticContentViewController(models: [.theApp])
    private let step2VC = StaticContentViewController(models: [.store])
    private let step3VC = StaticContentViewController(models: [.show])
    private let step4VC = OnboardingDisclaimerViewController()

    override internal var stepViewControllers: [OnboardingContentViewController] {
        [step1VC, step2VC, step3VC, step4VC]
    }

    override internal var finalStepIndex: Int {
        return 3
    }

    override public func completedOnboarding() {
        WalletUserStorage.shared.hasCompletedOnboarding = true
    }
}
