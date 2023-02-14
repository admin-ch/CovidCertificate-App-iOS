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

import UBDevTools

enum DevTools {
    static func setup() {
        #if DEBUG || RELEASE_DEV || RELEASE_ABNAHME
            if #available(iOS 13.0, *) {
                UBDevTools.setup()
                UBDevTools.setupBaseUrls(baseUrls: [
                    BaseUrl(title: "config", url: Environment.current.configService.baseURL.absoluteString),
                    BaseUrl(title: "register", url: Environment.current.registerService.baseURL.absoluteString),
                    BaseUrl(title: "transformation", url: Environment.current.transformationService.baseURL.absoluteString),
                ])
            }
        #endif
    }
}
