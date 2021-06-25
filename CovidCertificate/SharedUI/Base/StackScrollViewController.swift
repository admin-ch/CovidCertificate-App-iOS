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

class StackScrollViewController: ViewController {
    internal let stackScrollView = StackScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

        setupStackView()
    }

    private func setupStackView() {
        stackScrollView.stackView.alignment = .center

        view.addSubview(stackScrollView)
        stackScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackScrollView.addSpacerView(Padding.large)
    }

    internal func addArrangedView(_ view: UIView, spacing: CGFloat? = nil, index: Int? = nil, insets: UIEdgeInsets = .zero) {
        let wrapperView = UIView()
        wrapperView.ub_setContentPriorityRequired()
        wrapperView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(insets)
        }

        if let idx = index {
            stackScrollView.stackView.insertArrangedSubview(wrapperView, at: idx)
        } else {
            stackScrollView.stackView.addArrangedSubview(wrapperView)
        }
        if let s = spacing {
            stackScrollView.stackView.setCustomSpacing(s, after: wrapperView)
        }
    }
}
