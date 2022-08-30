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

struct StaticContentViewModel: Equatable {
    let heading: String?
    let foregroundImage: UIImage?
    let title: String
    let alignment: NSTextAlignment
    let textGroups: [(UIImage?, String)]
    let expandableTextGroups: [(String, String, String?, URL?)]
    let externalLinks: [(String, URL)]

    init(heading: String? = nil,
         foregroundImage: UIImage? = nil,
         title: String,
         alignment: NSTextAlignment = .left,
         textGroups: [(UIImage?, String)] = [],
         expandableTextGroups: [(String, String, String?, URL?)] = [],
         externalLinks: [(String, URL)] = []) {
        self.heading = heading
        self.foregroundImage = foregroundImage
        self.title = title
        self.alignment = alignment
        self.textGroups = textGroups
        self.expandableTextGroups = expandableTextGroups
        self.externalLinks = externalLinks
    }

    static func == (lhs: StaticContentViewModel, rhs: StaticContentViewModel) -> Bool {
        return lhs.heading == rhs.heading &&
            lhs.foregroundImage == rhs.foregroundImage &&
            lhs.title == rhs.title &&
            lhs.alignment == rhs.alignment &&
            lhs.textGroups.elementsEqual(rhs.textGroups) {
                $0.0 == $1.0 && $0.1 == $1.1
            } && lhs.expandableTextGroups.elementsEqual(rhs.expandableTextGroups) {
                $0.0 == $1.0 && $0.1 == $1.1 && $0.2 == $1.2 && $0.3 == $1.3
            } && lhs.externalLinks.elementsEqual(rhs.externalLinks) {
                $0.0 == $1.0 && $0.1 == $1.1
            }
    }

    // MARK: - Factory

    static let theApp = StaticContentViewModel(heading: UBLocalized.wallet_onboarding_app_header,
                                               foregroundImage: UIImage(named: "illu-onboarding-hero"),
                                               title: UBLocalized.wallet_onboarding_app_title,
                                               alignment: .center,
                                               textGroups: [(nil, UBLocalized.wallet_onboarding_app_text)])

    static let store = StaticContentViewModel(heading: UBLocalized.wallet_onboarding_store_header,
                                              foregroundImage: UIImage(named: "illu-onboarding-privacy"),
                                              title: UBLocalized.wallet_onboarding_store_title,
                                              textGroups: [(UIImage(named: "ic-privacy"), UBLocalized.wallet_onboarding_store_text1),
                                                           (UIImage(named: "ic-validation"), UBLocalized.wallet_onboarding_store_text2)])

    static let show = StaticContentViewModel(heading: UBLocalized.wallet_onboarding_show_header,
                                             foregroundImage: UIImage(named: "illu-onboarding-covid-certificate"),
                                             title: UBLocalized.wallet_onboarding_show_title,
                                             textGroups: [(UIImage(named: "ic-qr-certificate"), UBLocalized.wallet_onboarding_show_text1),
                                                          (UIImage(named: "ic-check-mark"), UBLocalized.wallet_onboarding_show_text2)])

    static let privacy = StaticContentViewModel(heading: UBLocalized.wallet_onboarding_privacy_header,
                                                foregroundImage: UIImage(named: "illu-onboarding-data-protection"),
                                                title: UBLocalized.wallet_onboarding_privacy_title,
                                                textGroups: [(UIImage(named: "ic-data-protection"), UBLocalized.wallet_onboarding_privacy_text)])

    static let howItWorks = StaticContentViewModel(foregroundImage: UIImage(named: "illu-how-it-works"),
                                                   title: UBLocalized.wallet_scanner_howitworks_title,
                                                   textGroups: [(UIImage(named: "ic-bund-small"), UBLocalized.wallet_scanner_howitworks_text1),
                                                                (UIImage.icon(named: "ic-one", withAccessibilityLabel: UBLocalized.wallet_scanner_how_it_works_accessibility_icon1), UBLocalized.wallet_scanner_howitworks_text2),
                                                                (UIImage.icon(named: "ic-two", withAccessibilityLabel: UBLocalized.wallet_scanner_how_it_works_accessibility_icon2), UBLocalized.wallet_scanner_howitworks_text3),
                                                                (UIImage.icon(named: "ic-three", withAccessibilityLabel: UBLocalized.wallet_scanner_how_it_works_accessibility_icon3), UBLocalized.wallet_scanner_howitworks_text4)],
                                                   expandableTextGroups: [(UBLocalized.wallet_scanner_howitworks_question1, UBLocalized.wallet_scanner_howitworks_answer1, UBLocalized.wallet_scanner_howitworks_external_link_title, URL(string: UBLocalized.wallet_scanner_howitworks_external_link))])

    static let certificateLight = StaticContentViewModel(title: UBLocalized.wallet_certificate_light_detail_summary_title,
                                                         alignment: .center,
                                                         textGroups: [(UIImage(named: "ic-bund-small"), UBLocalized.wallet_scanner_howitworks_text1),
                                                                      (UIImage(named: "ic-one"), UBLocalized.wallet_scanner_howitworks_text2),
                                                                      (UIImage(named: "ic-two"), UBLocalized.wallet_scanner_howitworks_text3),
                                                                      (UIImage(named: "ic-three"), UBLocalized.wallet_scanner_howitworks_text4)])

    #if WALLET

        static let updateBoardingStep1 = StaticContentViewModel(heading: UBLocalized.wallet_update_boarding_header,
                                                                foregroundImage: UIImage(named: "illu-onboarding-hero"),
                                                                title: UBLocalized.wallet_update_boarding_page_1_title,
                                                                alignment: .center,
                                                                textGroups: [(nil, UBLocalized.wallet_update_boarding_page_1_text)])

        static let updateBoardingStep2 = StaticContentViewModel(heading: UBLocalized.wallet_update_boarding_header,
                                                                title: UBLocalized.wallet_update_boarding_page_2_title,
                                                                textGroups: [(nil, ""),
                                                                             (UIImage(named: "ic-bund-small"), UBLocalized.wallet_update_boarding_page_2_bullet_1),
                                                                             (UIImage(named: "ic-timelapse")?.ub_image(with: .cc_blue), UBLocalized.wallet_update_boarding_page_2_bullet_2),
                                                                             (UIImage(named: "ic-travel"), UBLocalized.wallet_update_boarding_page_2_bullet_3)])

        static let updateBoardingStep3 = StaticContentViewModel(heading: UBLocalized.wallet_update_boarding_header,
                                                                title: UBLocalized.wallet_update_boarding_page_3_title,
                                                                textGroups: [(nil, ""),
                                                                             (UIImage(named: "ic-travel"), UBLocalized.wallet_update_boarding_page_3_bullet_1),
                                                                             (UIImage(named: "ic-calendar"), UBLocalized.wallet_update_boarding_page_3_bullet_2),
                                                                             (UIImage(named: "ic-data-protection"), UBLocalized.wallet_update_boarding_page_3_bullet_3)])

        static let updateBoardingStep4 = StaticContentViewModel(heading: UBLocalized.wallet_update_boarding_header,
                                                                title: UBLocalized.wallet_update_boarding_page_4_title,
                                                                textGroups: [(nil, ""),
                                                                             (UIImage(named: "ic-check-mark"), UBLocalized.wallet_update_boarding_page_4_bullet_1),
                                                                             (UIImage(named: "ic-travel"), UBLocalized.wallet_update_boarding_page_4_bullet_2),
                                                                             (UIImage(named: "ic-question-outline"), UBLocalized.wallet_update_boarding_page_4_bullet_3)],
                                                                externalLinks:
                                                                [
                                                                    (UBLocalized.wallet_update_boarding_page_4_link_1_text, URL(string: UBLocalized.wallet_update_boarding_page_4_link_1_url)!),
                                                                    (UBLocalized.wallet_update_boarding_page_4_link_2_text, URL(string: UBLocalized.wallet_update_boarding_page_4_link_2_url)!),
                                                                ])

    #endif
}
