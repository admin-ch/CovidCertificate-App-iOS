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

class CopyAbleTextLabelOverlay: UIControl {
    private let text: String
    private let highlightView = UIView()

    init(text: String) {
        self.text = text
        super.init(frame: .zero)

        isAccessibilityElement = true
        isUserInteractionEnabled = true
        setupView()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(highlightView)
        bringSubviewToFront(highlightView)
        highlightView.isUserInteractionEnabled = false
        highlightView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        highlightView.alpha = 0
        highlightView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: -1.0, left: -3.0, bottom: -1.0, right: -3.0))
        }
        highlightView.layer.cornerRadius = 4.0

        addTarget(self, action: #selector(touchUp), for: .touchUpInside)
    }

    // MARK: - UIControl

    override var canBecomeFirstResponder: Bool {
        return true
    }

    @objc func touchUp() {
        guard let superview = superview else { return }
        if becomeFirstResponder() {
            let menuController = UIMenuController.shared
            menuController.setTargetRect(frame, in: superview)
            menuController.setMenuVisible(true, animated: true)
        }
    }

    override func canPerformAction(_ action: Selector, withSender _: Any?) -> Bool {
        return (action == #selector(UIResponderStandardEditActions.copy(_:)))
    }

    override func copy(_: Any?) {
        UIPasteboard.general.string = text
    }

    override var isHighlighted: Bool {
        get { super.isHighlighted }

        set(highlighted) {
            super.isHighlighted = highlighted
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.highlightView.alpha = highlighted ? 1.0 : 0.0
            } completion: { _ in }
        }
    }
}
