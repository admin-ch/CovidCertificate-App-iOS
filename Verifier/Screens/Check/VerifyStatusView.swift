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

class VerifyStatusView: UIView {
    // MARK: - Subviews

    private let stackView = UIStackView()
    public let imageView = UIImageView()
    public let boldLabel = Label(.text, textColor: .cc_black)

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

    // MARK: - API

    public func set(text: NSAttributedString, backgroundColor: UIColor, icon: UIImage?) {
        imageView.image = icon
        boldLabel.attributedText = text
        self.backgroundColor = backgroundColor

        accessibilityLabel = boldLabel.accessibilityLabel

        layoutIfNeeded()
    }

    // MARK: - Setup

    private func setup() {
        imageView.ub_setContentPriorityRequired()
        layer.cornerRadius = 10.0

        let p = Padding.small + 3.0

        stackView.axis = .horizontal
        stackView.spacing = p
        stackView.alignment = .top

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(p)
        }

        stackView.addArrangedView(imageView)

        let v = UIView()
        v.addSubview(boldLabel)
        boldLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(3.0)
            make.left.right.bottom.equalToSuperview()
        }

        stackView.addArrangedView(v)
    }
}
