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

class VerifyInfoView: UIView {
    // MARK: - Subviews

    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = Label(.text, textColor: .cc_black)

    private let retryContainer = UIView()
    private let retryButton = RetryButton()

    // MARK: - Public API

    public var retryTouchUpCallback: (() -> Void)?

    public func set(text: String, backgroundColor: UIColor, icon: UIImage?, showReloadButton: Bool) {
        imageView.image = icon
        label.text = text
        self.backgroundColor = backgroundColor
        retryContainer.ub_setHidden(!showReloadButton)
        layoutIfNeeded()
    }

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()

        isAccessibilityElement = false
        accessibilityElements = [label, retryButton]
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        let s = UIStackView()
        s.axis = .vertical

        retryContainer.addSubview(retryButton)
        retryButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Padding.small)
            make.left.bottom.equalToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }

        s.addSpacerView(3.0)
        s.addArrangedView(label)
        s.addArrangedView(retryContainer)

        stackView.addArrangedView(s)

        retryContainer.ub_setHidden(true)

        retryButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.retryTouchUpCallback?()
        }
    }
}
