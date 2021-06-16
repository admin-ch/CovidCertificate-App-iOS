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

class TransferCodeViewController: ViewController {
    private let infoVC = TransferCodeOnboardingViewController()
    private let nextStepsVC = TransferCodeNextStepsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = UBLocalized.wallet_transfer_code_card_title.uppercased()
        addDismissButton()

        addChildViewControllers()

        infoVC.createCodeButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }

            strongSelf.startLoading()
        }
    }

    private func addChildViewControllers() {
        addSubviewController(infoVC)
        addSubviewController(nextStepsVC)
        nextStepsVC.view.alpha = 0
    }

    private func startLoading() {
        nextStepsVC.startLoading()
        UIView.animate(withDuration: 0.25) {
            self.infoVC.view.alpha = 0
            self.nextStepsVC.view.alpha = 1
        }
    }
}
