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

class VerifyLoadingView: UIView {
    // MARK: - Subviews

    private let stackView = UIStackView()
    public let loadingView = UIImageView(image: UIImage(named: "ic-load"))
    public let label = Label(.text, textColor: .cc_black)

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()

        isAccessibilityElement = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func rotate() {
        loadingView.rotate(time: 1.0)
    }

    public func stopRotation() {
        loadingView.layer.removeAllAnimations()
    }

    // MARK: - Setup

    private func setup() {
        backgroundColor = .cc_greyish
        layer.cornerRadius = 10.0

        let p = Padding.small + 3.0

        stackView.axis = .horizontal
        stackView.spacing = p
        stackView.alignment = .center
        loadingView.ub_setContentPriorityRequired()

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(p)
        }

        stackView.addArrangedView(loadingView)
        stackView.addArrangedView(label)
        label.text = UBLocalized.verifier_verify_loading_text

        accessibilityLabel = label.accessibilityLabel
    }
}
