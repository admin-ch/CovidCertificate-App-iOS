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

class DebugSwitchView: DebugView {
    private let label = Label(.text)
    private let switchControl = UISwitch()
    private let valueChanged: (Bool) -> Void

    init(title: String, isOn: Bool, valueChanged: @escaping (Bool) -> Void) {
        self.valueChanged = valueChanged
        super.init()

        addSubview(label)
        addSubview(switchControl)

        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(Padding.medium)
        }

        label.text = title

        switchControl.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(Padding.medium).priority(.high)
            make.leading.equalTo(label.snp.trailing).inset(-Padding.medium)
        }
        switchControl.isOn = isOn
        switchControl.addTarget(self, action: #selector(controlChanged), for: .valueChanged)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func controlChanged() {
        valueChanged(switchControl.isOn)
    }
}
