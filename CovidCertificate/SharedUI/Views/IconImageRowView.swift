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

class IconImageRowView: UIControl {
    private let iconView = UIImageView()
    private let label = Label(.textBoldLarge, textColor: .cc_blue)
    private let arrowView = UIImageView(image: UIImage(named: "ic-arrow-forward")?.ub_image(with: .cc_blue))

    var touchUpCallback: (() -> Void)?

    init(icon: UIImage, text: String) {
        iconView.image = icon.ub_image(with: .cc_blue)
        label.text = text
        super.init(frame: .zero)
        setupLayout()
        addTarget(self, action: #selector(didTouchUp), for: .touchUpInside)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTouchUp() {
        touchUpCallback?()
    }

    private func setupLayout() {
        addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(Padding.large)
        }

        addSubview(arrowView)
        arrowView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(Padding.large)
        }

        addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).inset(-Padding.large)
            make.trailing.equalTo(arrowView.snp.leading).inset(Padding.large)
            make.top.bottom.equalToSuperview().inset(Padding.large)
        }
    }

    func setHighlighted(_ highlighted: Bool, animated: Bool = false) {
        super.isHighlighted = highlighted

        if highlighted {
            backgroundColor = UIColor.black.withAlphaComponent(0.2)
        } else {
            UIView.animate(withDuration: animated ? 0.4 : 0.0, delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction, .allowAnimatedContent], animations: {
                self.backgroundColor = .clear
            }, completion: nil)
        }
    }

    override var isHighlighted: Bool {
        get { super.isHighlighted }

        set(highlighted) {
            setHighlighted(highlighted)
        }
    }

    override var isEnabled: Bool {
        get { super.isEnabled }

        set(enabled) {
            super.isEnabled = enabled
            arrowView.ub_setHidden(!enabled)
            iconView.image = iconView.image?.ub_image(with: enabled ? .cc_blue : .cc_grey)
            label.textColor = enabled ? .cc_blue : .cc_grey
        }
    }
}
