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
    let transferQuestions: LocalizedValue<FAQEntriesContainer>?
    let transferWorks: LocalizedValue<FAQEntriesContainer>?
    let timeshiftDetectionEnabled: Bool?

    #if WALLET
        let checkModesInfo: LocalizedValue<CheckModeContainer>?

        var lightCertificateActive = false
        var pdfGenerationActive = false

        var showVaccinationHintHomescreen = false
        var showVaccinationHintDetail = false
        var showVaccinationHintTransfer = false

        let lightCertDurationInHours: Int

        let vaccinationHints: LocalizedValue<[VaccinationHint]>
        let vaccinationBookingInfo: LocalizedValue<VaccinationBookingInfo>

        var refreshButtonDisabled: Bool? = false

        let refreshButtonInfo: LocalizedValue<RefreshButtonInfo>?

        let eolBannerInfo: LocalizedValue<[String: EOLBannerInfo]>?
        var foreignRulesCheckEnabled = false
        let foreignRulesLinkText: LocalizedValue<String>?
        let foreignRulesLinkUrl: LocalizedValue<String>?
        let foreignRulesHints: LocalizedValue<[ForeignRulesHint]>?

        var showRatConversionForm: Bool? = false
        let ratConversionFormUrl: String?

        let certRenewalInfo: LocalizedValue<[String: CertificateRenewal]>

        var showValidityState: Bool? = false

    #elseif VERIFIER
        let checkModesInfos: LocalizedValue<CheckModeContainer>?
        let checkModeReselectAfterHours: Int

        let covidCertificateNewsText: LocalizedValue<String>?
        let infoCovidCertificateNews: LocalizedValue<News>?
    #endif

    class RefreshButtonInfo: UBCodable {
        let title: String?
        let text1: String?
        let text2: String?
        let text3: String?
        let fatTitle: String?
        let linkText: String?
        let linkUrl: String?
    }

    class FAQEntriesContainer: UBCodable {
        let faqTitle: String
        let faqSubTitle: String?
        let faqIconIos: String?
        let faqIntroSections: [FAQIntroEntry]?
        let faqEntries: [FAQEntry]
    }

    class FAQEntry: UBCodable {
        let title: String
        let text: String
        let iconIos: String?
        let linkTitle: String?
        let linkUrl: URL?
    }

    class FAQIntroEntry: UBCodable {
        let text: String
        let iconIos: String?
    }

    class VaccinationHint: UBCodable {
        let title: String
        let text: String
    }

    class VaccinationBookingInfo: UBCodable {
        let title: String
        let text: String
        let info: String
        let impfcheckTitle: String?
        let impfcheckText: String?
        let impfcheckButton: String?
        let impfcheckUrl: String?
    }

    class CheckModeInfo: UBCodable {
        let iconAndroid: String
        let iconIos: String
        let text: String
    }

    class News: UBCodable {
        let title: String?
        let newsItems: [CheckModeInfo]
    }

    #if WALLET
        class CheckModeContainer: UBCodable {
            let title: String
            let modes: [String: CheckModeEntriesContainer]
        }

        class CheckModeEntriesContainer: UBCodable {
            let ok: CheckModeInfo
            let notOk: CheckModeInfo
        }

        class EOLBannerInfo: UBCodable {
            let homescreenTitle: String
            let homescreenHexColor: String
            let detailTitle: String
            let detailText: String
            let detailMoreInfo: String
            let detailHexColor: String
            let popupTitle: String
            let popupText1: String?
            let popupText2: String?
            let popupBoldText: String?
            let popupLinkText: String?
            let popupLinkUrl: String?
        }

        class ForeignRulesHint: UBCodable {
            let iconIos: String
            let text: String
        }

        class CertificateRenewal: UBCodable {
            let heading: String
            let infos: [CertificateRenewalInfo]
            let faqLinkText: String?
            let faqLinkUrl: URL?
        }

        struct CertificateRenewalInfo: UBCodable {
            let iconIos: String
            let text: String
        }

    #elseif VERIFIER
        class CheckModeContainer: UBCodable {
            let infos: [String: CheckModeEntriesContainer]
            let unselected: CheckModeUnselected
        }

        class CheckModeEntriesContainer: UBCodable {
            let title: String
            let hexColor: String
            let infos: [CheckModeInfo]
        }

        class CheckModeUnselected: UBCodable {
            let infos: [CheckModeInfo]
        }
    #endif
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
            StaticContentViewModel(foregroundImage: UIImage(named: transferQuestions?.value?.faqIconIos ?? ""),
                                   title: transferQuestions?.value?.faqTitle ?? "",
                                   alignment: .left,
                                   textGroups: [(nil, transferQuestions?.value?.faqSubTitle ?? "")],
                                   expandableTextGroups: transferQuestions?.value?.faqEntries.compactMap { ($0.title, $0.text, $0.linkTitle, $0.linkUrl) } ?? []),
        ]
    }

    var transferWorksViewModels: [StaticContentViewModel] {
        return [
            StaticContentViewModel(foregroundImage: UIImage(named: transferWorks?.value?.faqIconIos ?? ""),
                                   title: transferWorks?.value?.faqTitle ?? "",
                                   alignment: .left,
                                   textGroups: transferWorks?.value?.faqIntroSections?.map { (UIImage(named: $0.iconIos ?? ""), $0.text) } ?? [],
                                   expandableTextGroups: transferWorks?.value?.faqEntries.compactMap { ($0.title, $0.text, $0.linkTitle, $0.linkUrl) } ?? []),
        ]
    }

    #if WALLET
        var randomVaccinationInfoHint: VaccinationHint? {
            return vaccinationHints.value?.randomElement()
        }
    #endif
}

extension ConfigResponseBody.VaccinationBookingInfo {
    var hasAllImpfCheckValues: Bool {
        return impfcheckTitle != nil
            && impfcheckText != nil
            && impfcheckButton != nil
            && impfcheckUrl != nil
    }
}

#if VERIFIER
    extension ConfigResponseBody {
        var hasNews: Bool {
            return covidCertificateNewsText != nil
        }

        var newsKey: String? {
            return covidCertificateNewsText?.value(for: "de")
        }
    }
#endif
