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

import Foundation

struct CheckModeUIObject {
    let id: String
    let displayName: String
    let color: UIColor
    let infos: [ConfigResponseBody.CheckModeInfo]
}

enum CheckModesHelper {
    static func allModes() -> [CheckModeUIObject] {
        let defaultColor = UIColor.green

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
}
