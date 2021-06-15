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

class TransferCodeOnboardingViewController: BasicStaticContentViewController {
    private let createCodeButton = Button(title: UBLocalized.wallet_transfer_code_create_code_button)
    private let howItWorksButton = Button(title: UBLocalized.wallet_transfer_code_onboarding_howto, style: .text(.cc_blue))

    init() {
        super.init(models: [StaticContentViewModel(foregroundImage: UIImage(named: "illu-transfer-code"),
                                                   title: UBLocalized.wallet_transfer_code_title,
                                                   alignment: .center,
                                                   textGroups: [(nil, UBLocalized.wallet_transfer_code_onboarding_text)])],
        title: UBLocalized.wallet_transfer_code_card_title.uppercased())
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        stackScrollView.addArrangedView(createCodeButton)
        stackScrollView.addSpacerView(40)
        stackScrollView.addArrangedView(howItWorksButton)
        stackScrollView.addSpacerView(40)
    }
}
