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

extension String {
    static var languageKey: String {
        UBLocalized.language_key
    }

    static var defaultLanguageKey: String {
        "de"
    }

    func formattingOccurrencesBold(_ occurrences: String) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: self)
        for occurrence in occurrences.split(separator: " ") {
            let range = (self as NSString).range(of: String(occurrence))
            attributedText.addAttributes([
                .font: LabelType.textBold.font,
            ], range: range)
        }
        return attributedText
    }

    func formattingOccurrenceBold(_ occurrence: String) -> NSMutableAttributedString {
        let range = (self as NSString).range(of: occurrence)
        let attributedText = NSMutableAttributedString(string: self)
        attributedText.addAttributes([
            .font: LabelType.textBold.font,
        ], range: range)
        return attributedText
    }

    func bold() -> NSMutableAttributedString {
        return formattingOccurrenceBold(self)
    }
}
