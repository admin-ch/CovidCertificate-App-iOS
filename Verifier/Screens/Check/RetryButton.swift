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

class RetryButton: UBButton {
    // MARK: - Init

    override init() {
        super.init()

        setImage(UIImage(named: "ic-retry")?.ub_image(with: .cc_orange), for: .normal)

        let attributedString = NSAttributedString(string: UBLocalized.error_action_retry.uppercased(), attributes: [NSAttributedString.Key.kern: LabelType.button.letterSpacing ?? 0.0, NSAttributedString.Key.font: LabelType.button.font, NSAttributedString.Key.foregroundColor: UIColor.cc_orange])

        setAttributedTitle(attributedString, for: .normal)

        highlightCornerRadius = 10.0

        highlightXInset = -3.0
        highlightedBackgroundColor = UIColor.black.withAlphaComponent(0.2)

        snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
}
