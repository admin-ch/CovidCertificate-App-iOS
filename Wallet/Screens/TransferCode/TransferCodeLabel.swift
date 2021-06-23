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

class TransferCodeLabel: UIView {
    private let label1 = InsetLabel()
    private let label2 = InsetLabel()
    private let label3 = InsetLabel()

    private var labels: [InsetLabel] {
        [label1, label2, label3]
    }

    var code: String? {
        didSet { update() }
    }

    init() {
        super.init(frame: .zero)
        isAccessibilityElement = true

        setupView()
        update()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        labels.forEach {
            addSubview($0)
        }

        label1.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualToSuperview()
            make.top.bottom.equalToSuperview()
            make.height.equalTo(32)
        }
        label2.snp.makeConstraints { make in
            make.top.bottom.equalTo(label1)
            make.leading.equalTo(label1.snp.trailing).offset(4)
        }
        label3.snp.makeConstraints { make in
            make.top.bottom.equalTo(label1)
            make.leading.equalTo(label2.snp.trailing).offset(4)
            make.trailing.lessThanOrEqualToSuperview()
        }
    }

    private func update() {
        guard let c = code, c.count == 9 else {
            labels.forEach { $0.label.text = "---" }
            return
        }

        let arrayCode = Array(c)

        label1.label.text = "\(arrayCode[0])\(arrayCode[1])\(arrayCode[2])"
        label2.label.text = "\(arrayCode[3])\(arrayCode[4])\(arrayCode[5])"
        label3.label.text = "\(arrayCode[6])\(arrayCode[7])\(arrayCode[8])"

        accessibilityLabel = arrayCode.map { "\($0)" }.joined(separator: ", ")
    }
}

private class InsetLabel: UIView {
    private let inset: CGFloat = 7
    public let label = Label(.title, textColor: .cc_blue, textAlignment: .center)

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .cc_white
        addSubview(label)

        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(inset)
        }
    }
}
