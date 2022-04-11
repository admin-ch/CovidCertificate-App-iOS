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

class PopupView: UIView {
    // MARK: - Subviews

    private let backgroundView = UIView()

    internal let contentView = UIView()

    private var viewPoint: CGPoint = .zero

    private let enableBackgroundDismiss: Bool

    private var accessibilityCloseButton: Button?

    // MARK: - API

    public var showCallback: ((Bool) -> Void)?

    // MARK: - Init

    init(enableBackgroundDismiss: Bool = true) {
        self.enableBackgroundDismiss = enableBackgroundDismiss
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Animation

    public func addAndPresent(to add: UIView, from: UIView, isPresentedFromCloseButton: Bool = false, point: CGPoint = .zero) {
        add.addSubview(self)
        frame = add.frame
        layoutIfNeeded()
        presentFrom(view: from, isPresentedFromCloseButton: isPresentedFromCloseButton, point: point)
    }

    public func presentFrom(view: UIView, isPresentedFromCloseButton: Bool = false, point: CGPoint = .zero) {
        accessibilityViewIsModal = true

        showCallback?(true)

        isUserInteractionEnabled = true

        UIView.animate(withDuration: 0.25) {
            self.backgroundView.alpha = 1.0
        }

        viewPoint = view.superview?.convert(view.center, to: self) ?? point
        var p2 = convert(contentView.center, to: superview)
        if p2 == .zero {
            p2 = point
        }

        contentView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01).concatenating(CGAffineTransform(translationX: viewPoint.x - p2.x, y: viewPoint.y - p2.y))

        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
            self.contentView.transform = .identity
            self.contentView.alpha = 1.0
        }, completion: { _ in })

        if let button = view as? Button,
           UIAccessibility.isVoiceOverRunning,
           isPresentedFromCloseButton {
            setupCloseButton(from: button)
        }

        UIAccessibility.post(notification: .screenChanged, argument: self)
    }

    private func setupCloseButton(from button: Button) {
        accessibilityCloseButton?.removeFromSuperview()

        accessibilityCloseButton = Button(image: nil, accessibilityKey: .accessibility_close_button)
        // !: intiailized above
        addSubview(accessibilityCloseButton!)

        accessibilityCloseButton?.snp.makeConstraints { make in
            make.center.equalTo(viewPoint)
            make.size.equalTo(button)
        }

        accessibilityCloseButton?.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismiss()
        }
    }

    @objc public func dismiss() {
        accessibilityCloseButton?.isHidden = true
        accessibilityViewIsModal = false

        if viewPoint == .zero {
            return
        }

        showCallback?(false)

        isUserInteractionEnabled = false

        UIView.animate(withDuration: 0.25) {
            self.backgroundView.alpha = 0.0
        }

        let p2 = convert(contentView.center, to: superview)
        contentView.transform = .identity

        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01).concatenating(CGAffineTransform(translationX: self.viewPoint.x - p2.x, y: self.viewPoint.y - p2.y))
            self.contentView.alpha = 0.0

        }, completion: { _ in
        })
    }

    // MARK: - Setup

    internal func setup() {
        backgroundView.alpha = 0.0
        contentView.alpha = 0.0
        isUserInteractionEnabled = false

        addSubview(backgroundView)

        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundView.backgroundColor = UIColor.cc_black.withAlphaComponent(0.54)

        addSubview(contentView)

        if enableBackgroundDismiss {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss))
            backgroundView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
}
