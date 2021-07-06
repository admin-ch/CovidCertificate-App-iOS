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

class OnboardingContentViewController: ViewController {
    internal let stackScrollView = StackScrollView()

    private let defaultAnimationOffset: CGFloat = 200
    private let imageAnimationOffset: CGFloat = 400

    internal var continueButtonText = UBLocalized.continue_button

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

        setupStackView()
    }

    private func setupStackView() {
        stackScrollView.stackView.alignment = .center

        view.addSubview(stackScrollView)
        stackScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackScrollView.addSpacerView(Padding.large)
    }

    func addArrangedView(_ view: UIView, spacing: CGFloat? = nil, index: Int? = nil, insets: UIEdgeInsets = .zero) {
        Self.addArrangedView(view, spacing: spacing, index: index, insets: insets, stackView: stackScrollView.stackView)
    }

    public static func addArrangedView(_ view: UIView, spacing: CGFloat? = nil, index: Int? = nil, insets: UIEdgeInsets = .zero, stackView: UIStackView) {
        let wrapperView = UIView()
        wrapperView.ub_setContentPriorityRequired()
        wrapperView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(insets)
        }

        view.alpha = 0

        if let idx = index {
            stackView.insertArrangedSubview(wrapperView, at: idx)
        } else {
            stackView.addArrangedSubview(wrapperView)
        }
        if let s = spacing {
            stackView.setCustomSpacing(s, after: wrapperView)
        }
    }

    public static func addExpandableBox(_ box: (title: String, text: String, linkTitle: String?, linkUrl: URL?), stackView: UIStackView) {
        Self.addExpandableBox(header: ExpandableViewHeader(title: box.title), body: ExpandableViewBody(content: box.text, linkTitle: box.linkTitle, linkUrl: box.linkUrl), stackView: stackView)
    }

    internal func addExpandableBox(_ box: (title: String, text: String, linkTitle: String?, linkUrl: URL?)) {
        Self.addExpandableBox(header: ExpandableViewHeader(title: box.title), body: ExpandableViewBody(content: box.text, linkTitle: box.linkTitle, linkUrl: box.linkUrl), stackView: stackScrollView.stackView)
    }

    internal static func addExpandableBox(header: ExpandableViewHeader, body: ExpandableViewBody, stackView: UIStackView) {
        Self.addArrangedView(header, stackView: stackView)
        header.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Padding.medium)
        }

        Self.addArrangedView(body, stackView: stackView)
        body.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Padding.medium)
        }
        body.alpha = 0
        body.superview?.ub_setHidden(true)

        header.didExpand = { expanded in
            body.superview?.ub_setHidden(!expanded)
            body.alpha = expanded ? 1 : 0
            if let text = header.headerLabel.text {
                let stateInfo = expanded ? UBLocalized.accessibility_expandable_box_expanded_state : UBLocalized.accessibility_expandable_box_reduced_state
                header.accessibilityLabel = text + ", " + stateInfo
            }
            UIAccessibility.post(notification: .layoutChanged, argument: expanded ? body : header)
        }

        stackView.addSpacerView(Padding.medium)
    }

    func fadeAnimation(fromFactor: CGFloat, toFactor: CGFloat, delay: TimeInterval, completion: ((Bool) -> Void)?) {
        for (idx, wrapperView) in stackScrollView.stackView.arrangedSubviews.enumerated() {
            if wrapperView.subviews.isEmpty {
                // If the view has no subviews, it has not been added with addArrangedView() (probably a spacer view)
                // and will be ignored for the animation
                continue
            }

            let v = wrapperView.subviews[0]

            // this is needed since the last swipe animation could still be running
            // if we removeAllAnimations UIView.animate will call the completionhandler
            // with finished = false
            v.layer.removeAllAnimations()

            setViewState(view: v, factor: fromFactor)
            UIView.animate(withDuration: 0.4, delay: delay + Double(idx) * 0.05, options: [.beginFromCurrentState, .curveEaseInOut], animations: {
                self.setViewState(view: v, factor: toFactor)
            }, completion: (idx == stackScrollView.stackView.arrangedSubviews.count - 1) ? completion : nil)
        }

        if stackScrollView.stackView.arrangedSubviews.isEmpty {
            completion?(true)
        }
    }

    internal func setViewState(view: UIView, factor: CGFloat) {
        if view is UIImageView || view is UIButton {
            view.transform = CGAffineTransform(translationX: imageAnimationOffset * factor, y: 0)
            view.alpha = 1
        } else {
            view.transform = CGAffineTransform(translationX: defaultAnimationOffset * factor, y: 0)
            view.alpha = (1.0 - abs(factor))
        }
    }

    static func showAllViews(stackView: UIStackView) {
        for wrapperView in stackView.arrangedSubviews {
            if wrapperView.subviews.isEmpty {
                // If the view has no subviews, it has not been added with addArrangedView() (probably a spacer view)
                // and will be ignored for the animation
                continue
            }

            let v = wrapperView.subviews[0]

            // this is needed since the last swipe animation could still be running
            // if we removeAllAnimations UIView.animate will call the completionhandler
            // with finished = false
            v.layer.removeAllAnimations()
            v.alpha = 1.0
            v.transform = .identity
        }
    }
}
