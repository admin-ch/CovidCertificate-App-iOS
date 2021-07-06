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

class ExpandableViewHeader: UBButton {
    let headerLabel = Label(.textBoldLarge, textColor: .cc_blue)

    private let arrowImageview = UIImageView(image: UIImage(named: "ic-arrow-expand"))

    private let cornerRadiusView = UIView()

    var isExpanded: Bool = false

    // Note: this will be called inside a animation block
    var didExpand: ((Bool) -> Void)?

    init(title: String) {
        super.init()

        headerLabel.text = title

        arrowImageview.ub_setContentPriorityRequired()

        addSubview(headerLabel)
        addSubview(arrowImageview)
        headerLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(Padding.medium)
        }

        arrowImageview.snp.makeConstraints { make in
            make.left.greaterThanOrEqualTo(headerLabel.snp.right).inset(-Padding.small)
            make.right.equalToSuperview().inset(Padding.medium)
            make.top.equalToSuperview().inset(12)
        }

        cornerRadiusView.backgroundColor = .cc_blueish
        cornerRadiusView.layer.cornerRadius = 9
        insertSubview(cornerRadiusView, belowSubview: highlightView)
        cornerRadiusView.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.leading.trailing.bottom.equalToSuperview()
        }
        cornerRadiusView.isUserInteractionEnabled = false

        backgroundColor = .cc_blueish
        layer.cornerRadius = 9
        clipsToBounds = false
        highlightView.layer.cornerRadius = 9

        touchUpCallback = { [weak self] in
            guard let self = self else { return }
            self.isExpanded.toggle()
            UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
                if self.isExpanded {
                    self.arrowImageview.transform = .init(rotationAngle: .pi)
                    self.cornerRadiusView.layer.cornerRadius = 0
                } else {
                    self.arrowImageview.transform = .init(rotationAngle: 0.001)
                    self.cornerRadiusView.layer.cornerRadius = 9
                }
                self.didExpand?(self.isExpanded)
            }, completion: { _ in
                UIAccessibility.post(notification: .screenChanged, argument: nil)
            })
        }

        if let text = headerLabel.text {
            accessibilityLabel = text + ", " + UBLocalized.accessibility_expandable_box_reduced_state
        } else {
            accessibilityLabel = headerLabel.text
        }
        accessibilityTraits = [.button, .header]
    }
}
