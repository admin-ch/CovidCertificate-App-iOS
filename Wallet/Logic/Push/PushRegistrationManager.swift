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

class PushRegistrationManager: UBPushRegistrationManager {
    override var pushRegistrationRequest: URLRequest? {
        #if DEBUG
            let pushType = "IOD"
        #else
            let pushType = "IOS"
        #endif

        let pushRegistration = PushRegistration()
        pushRegistration.pushToken = UBPushManager.shared.pushToken ?? ""
        pushRegistration.pushType = pushType
        pushRegistration.registerId = Device.deviceID

        return Endpoint.pushRegister(payload: pushRegistration, appversion: ConfigManager.appVersion, osversion: ConfigManager.osVersion, buildnr: ConfigManager.buildNumber).request()
    }
}

enum Device {
    static var deviceID: String {
        if deviceID_ == nil {
            deviceID_ = UUID().uuidString
        }

        return deviceID_!
    }

    @UBUserDefault(key: "UIDevice.deviceID", defaultValue: nil)
    private static var deviceID_: String?
}
