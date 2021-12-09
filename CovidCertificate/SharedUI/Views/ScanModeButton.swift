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

class ScanModeButton: UBButton {
    private let labelView = UIView()
    private let label = Label(.textExtraBold)

    public var mode: CheckModeUIObject? {
        didSet {
            labelView.backgroundColor = mode?.color
            label.text = mode?.displayName
        }
    }

    init(addSettingsIcon: Bool = true) {
        super.init()
        setup(addSettingsIcon)
    }

    private func setup(_ addSettingsIcon: Bool) {
        let stackView = UIStackView()
        stackView.isUserInteractionEnabled = false
        stackView.spacing = 3.0
        stackView.alignment = .center
        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Padding.small + 3.0)
        }

        labelView.addSubview(label)

        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 0.0, left: Padding.medium, bottom: 0.0, right: Padding.medium))
            make.centerY.equalToSuperview()
        }

        let size = label.font.pointSize

        // scale linearly with standard size
        labelView.layer.cornerRadius = (size / 16.0) * 14.0
        labelView.snp.makeConstraints { make in
            make.height.equalTo(2.0 * layer.cornerRadius)
        }

        stackView.addArrangedSubview(labelView)

        if addSettingsIcon {
            let iv = UIImageView(image: UIImage(named: "ic-settings"))
            iv.ub_setContentPriorityRequired()
            stackView.addArrangedSubview(iv)
        }

        highlightedBackgroundColor = .cc_touchState
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let height = frame.size.height
        highlightCornerRadius = height * 0.5
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool = false) {
        super.setHighlighted(highlighted, animated: animated)
        labelView.backgroundColor = mode?.color
    }
}
