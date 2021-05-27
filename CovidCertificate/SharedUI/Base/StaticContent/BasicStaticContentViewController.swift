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

class BasicStaticContentViewController: StaticContentViewController {
    init(models: [StaticContentViewModel], title: String) {
        super.init(models: models)

        self.title = title
        addDismissButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cc_background

        fadeAnimation(fromFactor: -1, toFactor: 0, delay: 0, completion: nil)
    }
}
