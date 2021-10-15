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

class TransferCodeLabel: UIControl {
    private let label1 = InsetLabel()
    private let label2 = InsetLabel()
    private let label3 = InsetLabel()

    private let highlightView = UIView()

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
            $0.isUserInteractionEnabled = false
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

        addSubview(highlightView)
        bringSubviewToFront(highlightView)
        highlightView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        highlightView.alpha = 0
        highlightView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        addTarget(self, action: #selector(touchUp), for: .touchUpInside)
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
        guard let code = code else {
            return
        }
        UIPasteboard.general.string = code
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

private class InsetLabel: UIView {
    private let inset: CGFloat = 7
    public let label = Label(.codeBold, textColor: .cc_blue, textAlignment: .center)

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
            make.centerY.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()

            make.left.right.equalToSuperview().inset(7).priority(.low)
        }
    }
}
