/*
 * Copyright (c) 2021 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

import CovidCertificateSDK
import UIKit

struct LocalizedValue<T: Codable>: Codable {
    let dic: [String: T]

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        dic = (try container.decode([String: T?].self)).reduce(into: [String: T]()) { result, new in
            guard let value = new.value else { return }
            result[String(new.key.prefix(2))] = value
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(dic)
    }

    var value: T? {
        return value(for: .languageKey)
    }

    func value(for languageKey: String) -> T? {
        return dic[languageKey]
    }
}

struct InfoBox: UBCodable, Equatable {
    let title, msg: String
    let url: URL?
    let urlTitle: String?
    let infoId: String?
    let isDismissible: Bool?
}

class ConfigResponseBody: UBCodable, JWTExtension {
    let forceUpdate: Bool
    let infoBox: LocalizedValue<InfoBox>?
    let questions: LocalizedValue<FAQEntriesContainer>?
    let works: LocalizedValue<FAQEntriesContainer>
    let transferQuestions: LocalizedValue<FAQEntriesContainer>
    let transferWorks: LocalizedValue<FAQEntriesContainer>

    class FAQEntriesContainer: UBCodable {
        let faqTitle: String
        let faqSubTitle: String
        let faqIconIos: String

        let faqEntries: [FAQEntry]
    }

    class FAQEntry: UBCodable {
        let title: String
        let text: String
        let iconIos: String?
        let linkTitle: String?
        let linkUrl: URL?
    }
}

extension ConfigResponseBody {
    var viewModels: [StaticContentViewModel] {
        var models = [StaticContentViewModel]()
        if let imageString1 = questions?.value?.faqIconIos,
           let title1 = questions?.value?.faqTitle,
           let subtitle1 = questions?.value?.faqSubTitle {
            models.append(StaticContentViewModel(heading: nil,
                                                 foregroundImage: UIImage(named: imageString1),
                                                 title: title1,
                                                 textGroups: [(nil, subtitle1)],
                                                 expandableTextGroups: questions?.value?.faqEntries.compactMap { ($0.title, $0.text, $0.linkTitle, $0.linkUrl) } ?? []))
        }

        if let imageString2 = works.value?.faqIconIos,
           let title2 = works.value?.faqTitle,
           let subtitle2 = works.value?.faqSubTitle {
            models.append(StaticContentViewModel(heading: nil,
                                                 foregroundImage: UIImage(named: imageString2),
                                                 title: title2,
                                                 textGroups: [(nil, subtitle2)],
                                                 expandableTextGroups: works.value?.faqEntries.compactMap { ($0.title, $0.text, $0.linkTitle, $0.linkUrl) } ?? []))
        }

        return models
    }

    var transferQuestionsViewModels: [StaticContentViewModel] {
        return [
            StaticContentViewModel(foregroundImage: UIImage(named: transferQuestions.value?.faqIconIos ?? ""),
                                   title: transferQuestions.value?.faqTitle ?? "",
                                   alignment: .left,
                                   textGroups: [(nil, transferQuestions.value?.faqSubTitle ?? "")],
                                   expandableTextGroups: transferQuestions.value?.faqEntries.compactMap { ($0.title, $0.text, $0.linkTitle, $0.linkUrl) } ?? []),
        ]
    }
}
