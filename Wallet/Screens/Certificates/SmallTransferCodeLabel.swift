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

class SmallTransferCodeLabel: UIView {
    private let label = Label(.textBold, textColor: .cc_blue)

    var code: UserTransferCode? {
        didSet { update() }
    }

    init() {
        super.init(frame: .zero)

        setupView()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        layer.cornerRadius = 4

        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Padding.small)
        }
    }

    private func update() {
        guard let c = code else { return }

        switch c.state {
        case .valid:
            backgroundColor = .cc_blueish
            label.textColor = .cc_blue
            label.snp.updateConstraints { make in
                make.leading.trailing.equalToSuperview().inset(Padding.small)
            }

            guard c.transferCode.count == 9 else {
                label.text = "--- --- ---"
                return
            }

            let array = Array(c.transferCode)
            label.text = "\(array[0])\(array[1])\(array[2]) \(array[3])\(array[4])\(array[5]) \(array[6])\(array[7])\(array[8])"
        case .expired:
            backgroundColor = .clear
            label.textColor = .cc_blue
            label.snp.updateConstraints { make in
                make.leading.trailing.equalToSuperview().inset(0)
            }
            label.text = UBLocalized.wallet_transfer_code_old_code
        case .failed:
            backgroundColor = .clear
            label.textColor = .cc_red
            label.snp.updateConstraints { make in
                make.leading.trailing.equalToSuperview().inset(0)
            }
            label.text = UBLocalized.wallet_transfer_code_old_code
        }
    }
}
