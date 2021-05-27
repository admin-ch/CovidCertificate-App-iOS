/*
 * Copyright (c) 2021 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

import BackgroundTasks
import Foundation

class ConfigLoadOperation: Operation {
    @UBUserDefault(key: "presentedConfigForVersion", defaultValue: nil)
    static var presentedConfigForVersion: String?

    override func main() {
        guard isCancelled == false else { return }

        let semaphore = DispatchSemaphore(value: 0)
        ConfigManager().loadConfig(backgroundTask: true) { config in

            if let c = config, c.forceUpdate {
                // only show notification once per app update
                if ConfigLoadOperation.presentedConfigForVersion != ConfigManager.appVersion {
                    let content = UNMutableNotificationContent()
                    content.title = UBLocalized.force_update_title
                    content.body = UBLocalized.force_update_text

                    let request = UNNotificationRequest(identifier: "ch.admin.bag.certificate.update", content: content, trigger: nil)
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

                    ConfigLoadOperation.presentedConfigForVersion = ConfigManager.appVersion
                }
            } else {
                self.cancel()
            }
            semaphore.signal()
        }
        semaphore.wait()
    }
}
