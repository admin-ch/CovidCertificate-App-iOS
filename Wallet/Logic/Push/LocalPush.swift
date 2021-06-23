/*
 * Copyright (c) 2020 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

import Foundation
import UserNotifications

protocol UserNotificationCenter {
    var delegate: UNUserNotificationCenterDelegate? { get set }
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?)
    func removeDeliveredNotifications(withIdentifiers identifiers: [String])
    func removeAllDeliveredNotifications()
    func removePendingNotificationRequests(withIdentifiers identifiers: [String])
    func setNotificationCategories(_ categories: Set<UNNotificationCategory>)
}

extension UNUserNotificationCenter: UserNotificationCenter {}

/// Helper to show a local push notification when the state of the user changes from not-exposed to exposed
class LocalPush: NSObject {
    static let shared = LocalPush()

    private var center: UserNotificationCenter

    var applicationState: UIApplication.State {
        UIApplication.shared.applicationState
    }

    init(notificationCenter: UserNotificationCenter = UNUserNotificationCenter.current()) {
        center = notificationCenter
        super.init()
        center.delegate = self
    }

    func clearNotifications() {
        center.removeAllDeliveredNotifications()
    }

    var now: Date {
        .init()
    }

    public func scheduleNotification(identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = UBLocalized.wallet_notification_transfer_title
        content.body = UBLocalized.wallet_notification_transfer_text
        content.sound = .default
        content.threadIdentifier = identifier

        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: nil)
        center.add(request, withCompletionHandler: nil)
    }

    func showDebugNotification(title: String, body: String) {
        let notification = UNMutableNotificationContent()
        notification.title = title
        notification.body = body
        notification.sound = .default

        center.add(UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: nil), withCompletionHandler: nil)
    }
}

extension LocalPush: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_: UNUserNotificationCenter,
                                willPresent _: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }

    func userNotificationCenter(_: UNUserNotificationCenter, didReceive _: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
