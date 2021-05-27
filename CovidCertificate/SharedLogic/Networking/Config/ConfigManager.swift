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

/// Config request allows to disable old versions of the app if
class ConfigManager: NSObject {
    // MARK: - Data Task

    private let session = URLSession.certificatePinned
    private var dataTask: URLSessionDataTask?

    // MARK: - Init

    override init() {}

    // MARK: - Last Loaded Config

    @UBUserDefault(key: "config", defaultValue: fallbackConfig)
    static var currentConfig: ConfigResponseBody? {
        didSet {
            UIStateManager.shared.refresh()
        }
    }

    @UBUserDefault(key: "lastBackgroundConfigLoad", defaultValue: nil)
    static var lastConfigLoad: Date?

    @UBUserDefault(key: "lastConfigURL", defaultValue: nil)
    static var lastConfigUrl: String?

    static let configForegroundValidityInterval: TimeInterval = 60 * 60 * 12 // 12h
    static let configBackgroundValidityInterval: TimeInterval = 60 * 60 * 6 // 6h

    // MARK: - Version Numbers

    static var appVersion: String {
        let shortVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        return "ios-\(shortVersion)"
    }

    static var osVersion: String {
        let systemVersion = UIDevice.current.systemVersion
        return "ios\(systemVersion)"
    }

    static var buildNumber: String {
        let shortVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
        return "ios-\(shortVersion)"
    }

    // MARK: - Start config request

    static func shouldLoadConfig(backgroundTask: Bool, url: String?, lastConfigUrl: String?, lastConfigLoad: Date?) -> Bool {
        // if the config url was changed (by OS version or app version changing) load config in anycase
        if url != lastConfigUrl {
            return true
        }

        if backgroundTask {
            return lastConfigLoad == nil || Date().timeIntervalSince(lastConfigLoad!) > Self.configBackgroundValidityInterval
        } else {
            return lastConfigLoad == nil || Date().timeIntervalSince(lastConfigLoad!) > Self.configForegroundValidityInterval
        }
    }

    public func loadConfig(backgroundTask: Bool, completion: @escaping (ConfigResponseBody?) -> Void) {
        let request = Endpoint.config(appversion: ConfigManager.appVersion, osversion: ConfigManager.osVersion, buildnr: ConfigManager.buildNumber).request()

        guard Self.shouldLoadConfig(backgroundTask: backgroundTask,
                                    url: request.url?.absoluteString,
                                    lastConfigUrl: Self.lastConfigUrl,
                                    lastConfigLoad: Self.lastConfigLoad)
        else {
            Logger.log("Skipping config load request and returning from cache", appState: true)
            completion(Self.currentConfig)
            return
        }

        Logger.log("Load Config", appState: true)

        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in

            guard let _ = response as? HTTPURLResponse,
                  let data = data
            else {
                Logger.log("Failed to load config, error: \(error?.localizedDescription ?? "?")")
                DispatchQueue.main.async { completion(nil) }
                return
            }

            DispatchQueue.main.async {
                if let config = try? JSONDecoder().decode(ConfigResponseBody.self, from: data) {
                    ConfigManager.currentConfig = config
                    Self.lastConfigLoad = Date()
                    Self.lastConfigUrl = request.url?.absoluteString
                    completion(config)
                } else {
                    Logger.log("Failed to load config, error: \(error?.localizedDescription ?? "?")")
                    completion(nil)
                }
            }
        })

        dataTask?.resume()
    }

    public func startConfigRequest(window: UIWindow?) {
        loadConfig(backgroundTask: false) { config in
            // self must be strong
            if let config = config {
                self.presentAlertIfNeeded(config: config, window: window)
            }
        }
    }

    private static var configAlert: UIAlertController?

    private func presentAlertIfNeeded(config: ConfigResponseBody, window: UIWindow?) {
        if config.forceUpdate {
            if Self.configAlert == nil {
                let alert = UIAlertController(title: UBLocalized.force_update_title,
                                              message: UBLocalized.force_update_text,
                                              preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: UBLocalized.force_update_button, style: .default, handler: { _ in
                    // Schedule tasks to next run loop
                    DispatchQueue.main.async {
                        // show alert again -> app should always be blocked
                        Self.configAlert = nil
                        self.presentAlertIfNeeded(config: config, window: window)

                        // jump to app store
                        UIApplication.shared.open(Environment.current.appStoreURL, options: [:], completionHandler: nil)
                    }

                }))

                window?.rootViewController?.topViewController.present(alert, animated: false, completion: nil)
                Self.configAlert = alert
            }
        } else {
            if Self.configAlert != nil {
                Self.configAlert?.dismiss(animated: true, completion: nil)
                Self.configAlert = nil
            }
        }
    }

    // In case the config has not yet been loaded at least once from the request, we use the bundled config as fallback
    private static var fallbackConfig: ConfigResponseBody? {
        #if WALLET
            let path = "config_wallet"
        #elseif VERIFIER
            let path = "config_check"
        #else
            let path = "" // Not supported
        #endif
        guard let resource = Bundle.main.path(forResource: path, ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: resource), options: .mappedIfSafe),
              let config = try? JSONDecoder().decode(ConfigResponseBody.self, from: data)
        else {
            return nil
        }

        return config
    }
}

private extension UIViewController {
    var topViewController: UIViewController {
        if let p = presentedViewController {
            return p.topViewController
        } else {
            return self
        }
    }
}
