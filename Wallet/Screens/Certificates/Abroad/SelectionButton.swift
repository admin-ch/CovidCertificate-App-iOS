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

class SelectionButton: UBButton {
    // MARK: - Public API

    public var valueString: String? {
        set {
            valueLabel.text = newValue
        }
        get {
            valueLabel.text
        }
    }

    public var valueLabelTextColor: UIColor {
        get {
            return valueLabel.textColor
        }
        set {
            valueLabel.textColor = newValue
        }
    }

    // Note: this will be called inside a animation block
    var didExpand: ((Bool) -> Void)?

    private var isExpanded: Bool = false

    // MARK: - Subviews

    private let textLabel = Label(.text)
    private let valueLabel = Label(.textBold)

    // MARK: - Init

    init(title: String) {
        super.init()
        textLabel.text = title
        backgroundColor = .cc_background

        addSubview(textLabel)
        textLabel.textAlignment = .left
        textLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Padding.medium)
            make.top.greaterThanOrEqualToSuperview().inset(13)
            make.bottom.lessThanOrEqualToSuperview().inset(13)
            make.centerY.equalToSuperview()
        }

        addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(textLabel.snp.trailing).offset(3)
            make.trailing.equalToSuperview().inset(Padding.medium)
            make.centerY.equalToSuperview()
        }
        valueLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        textLabel.setContentCompressionResistancePriority(.required, for: .horizontal)

        layer.cornerRadius = 10
        highlightCornerRadius = 10
        highlightedBackgroundColor = .cc_touchState
        clipsToBounds = false

        touchUpCallback = { [weak self] in
            guard let self = self else { return }
            self.isExpanded.toggle()
            UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
                self.didExpand?(self.isExpanded)
            }, completion: { _ in
                UIAccessibility.post(notification: .screenChanged, argument: nil)
            })
        }
    }
}
