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
    private let label1 = InsetLabel(.title, textColor: .cc_blue, textAlignment: .center)
    private let label2 = InsetLabel(.title, textColor: .cc_blue, textAlignment: .center)
    private let label3 = InsetLabel(.title, textColor: .cc_blue, textAlignment: .center)

    private var labels: [UILabel] {
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
            $0.backgroundColor = .cc_white
        }

        label1.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.height.equalTo(32)
        }
        label2.snp.makeConstraints { make in
            make.top.bottom.height.equalTo(label1)
            make.leading.equalTo(label1.snp.trailing).offset(4)
        }
        label3.snp.makeConstraints { make in
            make.top.bottom.height.equalTo(label1)
            make.leading.equalTo(label2.snp.trailing).offset(4)
            make.trailing.equalToSuperview()
        }
    }

    private func update() {
        guard let c = code, c.count == 9 else {
            labels.forEach { $0.text = "---" }
            return
        }

        let arrayCode = Array(c)

        label1.text = "\(arrayCode[0])\(arrayCode[1])\(arrayCode[2])"
        label2.text = "\(arrayCode[3])\(arrayCode[4])\(arrayCode[5])"
        label3.text = "\(arrayCode[6])\(arrayCode[7])\(arrayCode[8])"

        accessibilityLabel = arrayCode.map { "\($0)" }.joined(separator: ", ")
    }
}

private class InsetLabel: Label {
    private let inset: CGFloat = 7

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)))
    }

    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += 2 * inset
        return size
    }
}
