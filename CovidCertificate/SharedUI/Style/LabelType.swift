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

class FontSize {
    private static let normalBodyFontSize: CGFloat = 16.0

    public static func bodyFontSize() -> CGFloat {
        // default from system is 17.
        let bfs = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFont.TextStyle.body).pointSize - 1.0

        let preferredSize: CGFloat = normalBodyFontSize
        let maximum: CGFloat = 1.5 * preferredSize
        let minimum: CGFloat = 0.5 * preferredSize

        return min(max(minimum, bfs), maximum)
    }

    public static let fontSizeMultiplicator: CGFloat = {
        max(1.0, bodyFontSize() / normalBodyFontSize)
    }()
}

public enum LabelType: UBLabelType {
    case hero
    case title
    case textBold
    case textBoldLarge
    case text
    case textLarge
    case uppercaseBold
    case smallUppercaseBold
    case button
    case smallError
    case smallErrorLight
    case monospaced
    case monospacedBold
    case codeBold

    public var font: UIFont {
        let bfs = FontSize.bodyFontSize()

        var boldFontName = "Inter-Bold"
        var lightFontName = "Inter-Light"

        if #available(iOS 13.0, *) {
            switch UITraitCollection.current.legibilityWeight {
            case .bold:
                boldFontName = "Inter-ExtraBold"
                lightFontName = "Inter-Medium"
            default:
                break
            }
        }

        switch self {
        case .hero:
            return UIFont(name: boldFontName, size: bfs + 16.0)!
        case .title:
            return UIFont(name: boldFontName, size: bfs + 10.0)!
        case .textBold:
            return UIFont(name: boldFontName, size: bfs)!
        case .text:
            return UIFont(name: lightFontName, size: bfs)!
        case .textLarge:
            return UIFont(name: lightFontName, size: bfs + 3.0)!
        case .textBoldLarge:
            return UIFont(name: boldFontName, size: bfs + 3.0)!
        case .uppercaseBold:
            return UIFont(name: boldFontName, size: bfs)!
        case .smallUppercaseBold:
            return UIFont(name: boldFontName, size: bfs - 3.0)!
        case .button:
            return UIFont(name: boldFontName, size: bfs)!
        case .smallError:
            return UIFont(name: boldFontName, size: bfs - 4.0)!
        case .smallErrorLight:
            return UIFont(name: lightFontName, size: bfs - 4.0)!
        case .monospaced:
            return UIFont(name: "PTMono-Regular", size: bfs)!
        case .codeBold:
            return UIFont(name: "FiraCode-Bold", size: bfs + 10)!
        case .monospacedBold:
            return Self.monospacedDigitFont(fontName: boldFontName, size: bfs)
        }
    }

    public var textColor: UIColor {
        if self == .smallError {
            return .cc_bund
        }

        if self == .uppercaseBold || self == .monospaced || self == .smallErrorLight || self == .smallUppercaseBold {
            return .cc_greyText
        }

        return .cc_text
    }

    public var lineSpacing: CGFloat {
        switch self {
        case .hero:
            return 32.0 / 30.0
        case .title:
            return 26.0 / 28.0
        case .textBold:
            return 22.0 / 16.0
        case .text:
            return 22.0 / 16.0
        case .textLarge:
            return 26.0 / 19.0
        case .textBoldLarge:
            return 28.0 / 19.0
        case .uppercaseBold:
            return 22.0 / 16.0
        case .smallUppercaseBold:
            return 18.0 / 13.0
        case .button:
            return 22.0 / 16.0
        case .smallError, .smallErrorLight:
            return 1.0
        case .monospaced:
            return 22.0 / 16.0
        case .codeBold:
            return 26.0 / 28.0
        case .monospacedBold:
            return 22.0 / 16.0
        }
    }

    public var letterSpacing: CGFloat? {
        if self == .uppercaseBold || self == .button || self == .smallUppercaseBold {
            return 2.0
        }

        if self == .monospaced {
            return 1.5
        }

        return nil
    }

    public var isUppercased: Bool {
        if self == .uppercaseBold || self == .smallUppercaseBold || self == .button || self == .monospaced {
            return true
        }

        return false
    }

    public var hyphenationFactor: Float {
        return 0.0
    }

    public var lineBreakMode: NSLineBreakMode {
        return .byTruncatingTail
    }

    /// Returns a font with monospaced digits of the given size
    private static func monospacedDigitFont(fontName: String, size: CGFloat) -> UIFont {
        let originalDescriptor = UIFont(name: fontName, size: size)!.fontDescriptor
        let featureArray: [[UIFontDescriptor.FeatureKey: Any]] = [
            [
                .featureIdentifier: kNumberSpacingType,
                .typeIdentifier: kMonospacedNumbersSelector,
            ],
        ]
        let descriptor = originalDescriptor.addingAttributes([.featureSettings: featureArray])
        return UIFont(descriptor: descriptor, size: 0)
    }
}

class Label: UBLabel<LabelType> {
    private var labelType: LabelType

    override init(_ type: LabelType, textColor: UIColor? = nil, numberOfLines: Int = 0, textAlignment: NSTextAlignment = .left) {
        labelType = type
        super.init(type, textColor: textColor, numberOfLines: numberOfLines, textAlignment: textAlignment)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
            font = labelType.font
        }
    }

    public var lineDistance: CGFloat {
        (labelType.lineSpacing - 1.0) * font.lineHeight
    }
}
