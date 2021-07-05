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

class CertificateLightUpdateBoardingViewController: OnboardingBaseViewController {
    private let step1VC = OnboardingDisclaimerViewController(model: .certificateLightUpdateBoarding)

    override internal var stepViewControllers: [OnboardingContentViewController] {
        [step1VC]
    }

    override internal var finalStepIndex: Int {
        return 0
    }

    override public func completedOnboarding() {
        #if Wallet
            WalletUserStorage.shared.hasCompletedLightCertificateUpdateBoarding = true
        #elseif VERIFIER
            VerifierUserStorage.shared.hasCompletedLightCertificateUpdateBoarding = true
        #endif
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.completedOnboarding()
        }
    }
}
