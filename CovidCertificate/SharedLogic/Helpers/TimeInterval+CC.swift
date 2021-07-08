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

extension TimeInterval {
    var seconds: Int {
        return Int(self) % 60
    }

    var minutes: Int {
        return (Int(self) / 60) % 60
    }

    var hours: Int {
        return Int(self) / 3600
    }

    var stringTime: String {
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
}
