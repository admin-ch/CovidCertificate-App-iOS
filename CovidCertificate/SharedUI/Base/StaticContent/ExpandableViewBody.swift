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

class ExpandableViewBody: UIView {
    private let textLabel = Label(.text)

    private let linkTitle: String?
    private let linkUrl: URL?

    enum DisclaimerContent {
        case privacy
        case conditionOfUse

        func fileName(for language: String) -> String {
            switch self {
            case .privacy:
                return "\(language.uppercased())_App_Datenschutzerklaerung"
            case .conditionOfUse:
                return "\(language.uppercased())_App_Nutzungsbedingungen"
            }
        }
    }

    func stringForContent(content: DisclaimerContent, language: String) -> String? {
        if let path = Bundle.main.path(forResource: content.fileName(for: language), ofType: "html"),
           let html = try? String(contentsOfFile: path) {
            return html
        }
        return nil
    }

    init(content: DisclaimerContent) {
        linkTitle = nil
        linkUrl = nil
        super.init(frame: .zero)

        textLabel.isHtmlContent = true
        textLabel.text = stringForContent(content: content, language: .languageKey) ?? stringForContent(content: content, language: .defaultLanguageKey)

        commonInit()
    }

    init(content: String, linkTitle: String?, linkUrl: URL?) {
        self.linkTitle = linkTitle
        self.linkUrl = linkUrl
        super.init(frame: .zero)

        textLabel.text = content

        commonInit()
    }

    private func commonInit() {
        backgroundColor = .cc_blueish
        layer.cornerRadius = 9
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        if let url = linkUrl, let title = linkTitle {
            addSubview(textLabel)

            let button = ExternalLinkButton(title: title)
            button.accessibilityTraits = .link
            addSubview(button)

            textLabel.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview().inset(Padding.medium)
            }

            button.snp.makeConstraints { make in
                make.top.equalTo(self.textLabel.snp.bottom).offset(Padding.medium + Padding.small)
                make.bottom.equalToSuperview().inset(Padding.medium + Padding.small)
                make.left.equalToSuperview().inset(Padding.medium)
                make.right.lessThanOrEqualToSuperview().inset(Padding.medium)
            }

            button.touchUpCallback = {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else {
            addSubview(textLabel)
            textLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(Padding.medium)
            }
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
