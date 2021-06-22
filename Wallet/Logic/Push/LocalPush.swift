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

    enum Identifiers: String, CaseIterable, Codable {
        case transferCodeDownloaded = "ch.admin.bag.certificate.downloaded"
    }

    enum Actions: String, CaseIterable, Codable {
        case transferCodeDownloaded = "ch.admin.bag.certificate.downloaded.action"

        // TODO: implement
        var action: UNNotificationAction {
            return UNNotificationAction(identifier: rawValue,
                                        title: "",
                                        options: [])
        }
    }

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

    private func scheduleNotification(identifier: String) {
        let content = UNMutableNotificationContent()
        // content.title = "push_exposed_title".ub_localized
        // content.body = "push_exposed_text".ub_localized
        content.sound = .default
        content.threadIdentifier = identifier

        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: nil)
        center.add(request, withCompletionHandler: nil)

        // applicationState can only be accessed from the main thread
        let state: UIApplication.State
        if Thread.isMainThread {
            state = applicationState
        } else {
            state = DispatchQueue.main.sync {
                applicationState
            }
        }

        // only if the app is in the background
        if state == .background {
            // schedule a notification every 4h for the next 2 days
            // so that the user can not miss the notification
            // TODO:
        }
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
        // TODO: implement
        completionHandler([.alert, .sound])
    }

    func userNotificationCenter(_: UNUserNotificationCenter, didReceive _: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // TODO: implement
        completionHandler()
    }
}
