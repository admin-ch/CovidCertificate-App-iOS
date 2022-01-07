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

import CovidCertificateSDK
import Foundation
import UIKit

struct CheckModeUIObject {
    let id: String
    let displayName: String
    let color: UIColor
    let infos: [ConfigResponseBody.CheckModeInfo]
}

enum CheckModesHelper {
    static func onlyOneMode() -> Bool {
        return Verifier.currentModes().count <= 1
    }

    #if VERIFIER
        static func allModes() -> [CheckModeUIObject] {
            let defaultColor = UIColor(ub_hexString: "#888888")!

            return Verifier.currentModes().map { mode -> CheckModeUIObject in
                if let model = ConfigManager.currentConfig?.checkModesInfos?.value?.infos[mode.id] {
                    return CheckModeUIObject(id: mode.id, displayName: model.title, color: UIColor(ub_hexString: model.hexColor) ?? defaultColor, infos: model.infos)
                } else {
                    return CheckModeUIObject(id: mode.id, displayName: mode.displayName, color: defaultColor, infos: [])
                }
            }
        }

        static func unselectedMode() -> [ConfigResponseBody.CheckModeInfo]? {
            return ConfigManager.currentConfig?.checkModesInfos?.value?.unselected.infos
        }

        static func mode(for id: String?) -> CheckModeUIObject? {
            guard let id = id else { return nil }
            return allModes().first { $0.id == id }
        }
    #endif

    #if WALLET
        static func text(for id: String, isValid: Bool) -> String? {
            var text: String?

            if let model = ConfigManager.currentConfig?.checkModesInfo?.value?.modes[id] {
                text = isValid ? model.ok.text : model.notOk.text
            }

            return text
        }

        static func image(for id: String, isValid: Bool, size: CGFloat, validColor: UIColor, invalidColor: UIColor) -> UIImage? {
            var image: UIImage?

            if let model = ConfigManager.currentConfig?.checkModesInfo?.value?.modes[id] {
                image = UIImage(named: isValid ? model.ok.iconIos : model.notOk.iconIos)
                image = image?.ub_image(byScaling: size / (image?.size.height ?? size))
            }

            if image == nil {
                let s = size * UIScreen.main.scale
                let label = Label(.customExtraBold(s))
                label.text = Verifier.currentModes().first { $0.id == id }?.displayName ?? " "
                label.sizeToFit()

                image = label.image(valid: isValid, size: s)
            }

            return image?.ub_image(with: isValid ? validColor : invalidColor)
        }
    #endif

    static func successValidationCode(modeResults: ModeResults?, mode: CheckModeUIObject?) -> ModeCheckValidationCode? {
        guard let m = mode, let r = modeResults?.getResult(for: CheckMode(id: m.id, displayName: m.displayName)) else {
            return nil
        }

        switch r {
        case let .success(mcr):
            return mcr.code
        default:
            return nil
        }
    }
}

private extension Label {
    func image(valid: Bool, size: CGFloat) -> UIImage? {
        let color = textColor

        textColor = UIColor.black
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)

        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)

        if !valid {
            let l = size * 0.15
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(l)
            context.setLineCap(.round)

            context.translateBy(x: 0.5 * bounds.size.width, y: 0.5 * bounds.size.height)
            context.rotate(by: -0.698132)
            context.translateBy(x: -0.5 * bounds.size.width, y: -0.5 * bounds.size.height)

            context.move(to: CGPoint(x: 0.5 * bounds.size.width - l * 0.5, y: 0))
            context.addLine(to: CGPoint(x: 0.5 * bounds.size.width - l * 0.5, y: bounds.size.height))

            context.strokePath()

            context.move(to: CGPoint(x: 0.5 * bounds.size.width + l * 0.5, y: 0))
            context.addLine(to: CGPoint(x: 0.5 * bounds.size.width + l * 0.5, y: bounds.size.height))

            context.setBlendMode(.clear)
            context.strokePath()
        }

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        textColor = color
        return image
    }
}
