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

public extension ModeCheckValidationCode {
    var is2GPlusSuccess: Bool {
        return self == .success2g || self == .success2gPlus
    }

    var is2GPlusTestSuccess: Bool {
        return self == .success2gPlus
    }
}
