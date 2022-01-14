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

enum TestEnviroment {
    enum NetworkCondition {
        case normal, slow, airplane
    }

    static var networkCondition: NetworkCondition {
        let enviromentKeys = ProcessInfo.processInfo.environment.keys
        if enviromentKeys.contains("AIRPLANE_MODE") {
            return .airplane
        }
        if enviromentKeys.contains("SLOW_NETWORK") {
            return .slow
        }
        return .normal
    }
}
