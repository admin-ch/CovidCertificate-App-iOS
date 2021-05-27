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

        setupViews()
    }

    internal func setupViews(addBottomSpacer: Bool = true) {
        for model in models {
            if model.heading != nil {
                let headingLabel = Label(.uppercaseBold)
                headingLabel.text = model.heading
                headingLabel.accessibilityTraits = [.header]
                let headingContainer = UIView()
                headingContainer.addSubview(headingLabel)
                headingLabel.snp.makeConstraints { make in
                    make.left.right.equalToSuperview().inset(Padding.medium)
                    make.top.bottom.equalToSuperview()
                }
                addArrangedView(headingContainer, spacing: Padding.large)
            }

            if let img = model.foregroundImage {
                addArrangedView(UIImageView(image: img), spacing: 20)
            }

            let titleLabel = Label(.title, textAlignment: model.alignment)
            titleLabel.text = model.title
            let titleContainer = UIView()
            titleContainer.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(2 * Padding.medium)
                make.top.bottom.equalToSuperview()
            }
            addArrangedView(titleContainer, spacing: Padding.medium)
            titleContainer.snp.makeConstraints { make in
                make.leading.trailing.equalTo(self.stackScrollView.stackView)
            }

            for (icon, text) in model.textGroups {
                let v = OnboardingInfoView(icon: icon, text: text, alignment: model.alignment)
                addArrangedView(v)
                v.snp.makeConstraints { make in
                    make.leading.trailing.equalTo(self.stackScrollView.stackView)
                }
            }

            if !model.expandableTextGroups.isEmpty {
                stackScrollView.addSpacerView(2 * Padding.medium)
                for (title, text, linkTitle, linkUrl) in model.expandableTextGroups {
                    addExpandableBox((title, text, linkTitle, linkUrl))
                }
            }

            if model == models.last, addBottomSpacer {
                let bottomSpacer = UIView()
                bottomSpacer.snp.makeConstraints { make in
                    make.height.equalTo(40)
                }
                addArrangedView(bottomSpacer)
            } else if model != models.last {
                stackScrollView.addSpacerView(Padding.large)
            }
        }
    }
}
