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
        // TODO: add push registration request
        return nil
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
