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

final class SDKOptionsManager {
    static func updateSDKOptions() {
        let timeshiftDetectionEnabled = ConfigManager.currentConfig?.timeshiftDetectionEnabled ?? false
        #if DEBUG || RELEASE_DEV
            CovidCertificateSDK.setOptions(options: SDKOptions(certificatePinning:
                URLSession.evaluator.useCertificatePinning,
                timeshiftDetectionEnabled: timeshiftDetectionEnabled))
        #else
            CovidCertificateSDK.setOptions(options: SDKOptions(timeshiftDetectionEnabled: timeshiftDetectionEnabled))
        #endif
    }
}
