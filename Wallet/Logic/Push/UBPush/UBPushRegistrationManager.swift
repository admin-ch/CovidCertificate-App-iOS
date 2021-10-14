/*
 * Copyright (c) 2021 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

import UIKit

/// Handles registration of push tokens on our server
/// Clients can either create a pushRegistrationManager with a `registrationUrl`"
///
///     let registrationManager = UBPushRegistrationManager(registrationUrl: registrationUrl)
///
/// or subclass `UBPushRegistrationManager`, overriding `pushRegistrationRequest` if they
/// require a custom registration request.
open class UBPushRegistrationManager {
    /// The push token for this device, if any
    public var pushToken: String? {
        UBPushLocalStorage.shared.pushToken
    }

    // The URL session to use, can be overwritten by the app
    open var session: URLSession {
        URLSession.certificatePinned
    }

    /// The url needed for the registration request
    private var registrationUrl: URL?

    /// :nodoc:
    private var maxRegistrationAge: TimeInterval {
        2 * 7 * 24 * 60 * 60 // enforce new push registration every two weeks
    }

    private var task: URLSessionDataTask?

    private let operationQueue = OperationQueue()

    // MARK: - Initialization

    /// Creates push registration manager for the provided `registrationUrl`
    public init(registrationUrl: URL? = nil) {
        self.registrationUrl = registrationUrl
        operationQueue.maxConcurrentOperationCount = 1
    }

    /// Sets the push token for the device, which starts a push registration
    func setPushToken(_ pushToken: String?) {
        let oldToken = UBPushLocalStorage.shared.pushToken

        // we could receive the same push token again
        // only send registration if push token has changed
        if (oldToken == nil && pushToken != nil)
            || (oldToken != nil && oldToken != pushToken)
            || (oldToken != nil && oldToken == pushToken && !UBPushLocalStorage.shared.isValid) {
            UBPushLocalStorage.shared.pushToken = pushToken
            invalidate()
        }
    }

    /// :nodoc:
    private func validate() {
        UBPushLocalStorage.shared.isValid = true
        UBPushLocalStorage.shared.lastRegistrationDate = Date()
    }

    /// :nodoc:
    func invalidate(completion: ((Error?) -> Void)? = nil) {
        operationQueue.addOperation {
            UBPushLocalStorage.shared.isValid = false
            self.sendPushRegistration(completion: completion)
        }
    }

    /// :nodoc:
    private func sendPushRegistration(completion: ((Error?) -> Void)? = nil) {
        guard let registrationRequest = pushRegistrationRequest else {
            completion?(UBPushManagerError.registrationRequestMissing)
            return
        }

        var backgroundTask = UIBackgroundTaskIdentifier.invalid
        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "PushRegistrationManager") {
            if backgroundTask != .invalid {
                UIApplication.shared.endBackgroundTask(backgroundTask)
                backgroundTask = .invalid
            }
        }
        let semaphore = DispatchSemaphore(value: 0)

        task = session.dataTask(with: registrationRequest, completionHandler: { [weak self] data, _, error in
            guard let self = self else {
                return
            }

            if let e = error {
                completion?(e)
            } else if data != nil {
                self.validate()
                completion?(nil)
            }

            if backgroundTask != .invalid {
                UIApplication.shared.endBackgroundTask(backgroundTask)
                backgroundTask = .invalid
            }

            semaphore.signal()
        })

        task?.resume()

        semaphore.wait()
    }

    /// The registration request sent to the server. Clients may override this property to
    /// implement a custom registration request
    open var pushRegistrationRequest: URLRequest? {
        guard
            let pushToken = UBPushLocalStorage.shared.pushToken,
            let registrationUrl = registrationUrl else {
            return nil
        }

        var request = URLRequest(url: registrationUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30.0)
        do {
            request.httpBody = try JSONEncoder().encode(Request(deviceUUID: pushDeviceUUID, pushToken: pushToken))
        } catch {
            return nil
        }
        return request
    }

    /// :nodoc:
    func sendPushRegistrationIfOutdated() {
        operationQueue.addOperation {
            if !UBPushLocalStorage.shared.isValid {
                self.sendPushRegistration()
            } else {
                let justPushed = UBPushManager.shared.pushHandler.lastPushed.map { lastPushed in
                    let fifteenSecondsAgo = Date(timeIntervalSinceNow: -15)
                    return lastPushed > fifteenSecondsAgo
                } ?? false

                let outdated = -(UBPushLocalStorage.shared.lastRegistrationDate?.timeIntervalSinceNow ?? 0) > self.maxRegistrationAge

                if outdated, !justPushed {
                    self.invalidate()
                }
            }
        }
    }

    // MARK: - UUID

    /// :nodoc:
    open var pushDeviceUUID: String {
        Device.deviceID
    }
}

// MARK: - Push Registration Request

private extension UBPushRegistrationManager {
    /// Data POSTed to the registrationUrl in the default implementation
    struct Request: Codable {
        let deviceUUID: String
        let pushToken: String
        var type = "IOS"
    }
}
