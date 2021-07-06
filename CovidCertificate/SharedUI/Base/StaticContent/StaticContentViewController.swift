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

class StaticContentViewController: OnboardingContentViewController {
    private let models: [StaticContentViewModel]

    init(models: [StaticContentViewModel]) {
        self.models = models
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UIAccessibility.post(notification: .screenChanged, argument: navigationController?.navigationBar)

        setupViews()
    }

    internal func setupViews(addBottomSpacer: Bool = true) {
        Self.setupViews(models: models, stackView: stackScrollView.stackView, addBottomSpacer: addBottomSpacer)
    }

    static func setupViews(models: [StaticContentViewModel], stackView: UIStackView, addBottomSpacer: Bool = true, showAllViews: Bool = false) {
        for model in models {
            if model.heading != nil {
                let headingLabel = Label(.uppercaseBold)
                headingLabel.text = model.heading
                headingLabel.accessibilityTraits = [.header, .tabBar]
                let headingContainer = UIView()
                headingContainer.addSubview(headingLabel)
                headingLabel.snp.makeConstraints { make in
                    make.left.right.equalToSuperview().inset(Padding.medium)
                    make.top.bottom.equalToSuperview()
                }

                Self.addArrangedView(headingContainer, spacing: Padding.large, stackView: stackView)
            }

            if let img = model.foregroundImage {
                Self.addArrangedView(UIImageView(image: img), spacing: 20, stackView: stackView)
            }

            let titleLabel = Label(.title, textAlignment: model.alignment)
            titleLabel.text = model.title
            titleLabel.accessibilityTraits = .header
            let titleContainer = UIView()
            titleContainer.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(2 * Padding.medium)
                make.top.bottom.equalToSuperview()
            }
            Self.addArrangedView(titleContainer, spacing: Padding.medium, stackView: stackView)
            titleContainer.snp.makeConstraints { make in
                make.leading.trailing.equalTo(stackView)
            }

            for (icon, text) in model.textGroups {
                let v = OnboardingInfoView(icon: icon, text: text, alignment: model.alignment)
                Self.addArrangedView(v, stackView: stackView)
                v.snp.makeConstraints { make in
                    make.leading.trailing.equalTo(stackView)
                }
            }

            if !model.expandableTextGroups.isEmpty {
                stackView.addSpacerView(2.0 * Padding.medium)
                for (title, text, linkTitle, linkUrl) in model.expandableTextGroups {
                    Self.addExpandableBox((title, text, linkTitle, linkUrl), stackView: stackView)
                }
            }

            if model == models.last, addBottomSpacer {
                let bottomSpacer = UIView()
                bottomSpacer.snp.makeConstraints { make in
                    make.height.equalTo(40)
                }
                Self.addArrangedView(bottomSpacer, stackView: stackView)
            } else if model != models.last {
                stackView.addSpacerView(Padding.large)
            }
        }

        if showAllViews {
            Self.showAllViews(stackView: stackView)
        }
    }
}
