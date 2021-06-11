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
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    internal var window: UIWindow?
    private var lastForegroundActivity: Date?
    private var blurView: UIVisualEffectView?
    private var importHandler: ImportHandler?

    @UBUserDefault(key: "isFirstLaunch", defaultValue: true)
    var isFirstLaunch: Bool

    private let linkHandler = LinkHandler()

    lazy var navigationController = NavigationController(rootViewController: WalletHomescreenViewController())

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Pre-populate isFirstLaunch for users which already installed the app before we introduced this flag
        if WalletUserStorage.shared.hasCompletedOnboarding {
            isFirstLaunch = false
        }

        // Reset keychain on first launch
        if isFirstLaunch {
            Keychain().deleteAll()
            isFirstLaunch = false
        }

        CovidCertificateSDK.initialize(environment: Environment.current.sdkEnvironment)

        // defer window initialization if app was launched in
        // background because of location change
        if shouldSetupWindow(application: application, launchOptions: launchOptions) {
            setupWindow()
            willAppearAfterColdstart(application, coldStart: true, backgroundTime: 0)
        }

        if let launchOptions = launchOptions,
           let activityType = launchOptions[UIApplication.LaunchOptionsKey.userActivityType] as? String,
           activityType == NSUserActivityTypeBrowsingWeb,
           let url = launchOptions[UIApplication.LaunchOptionsKey.url] as? URL {
            linkHandler.handle(url: url)
        }

        return true
    }

    func application(_: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler _: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    {
        if let url = userActivity.webpageURL {
            return linkHandler.handle(url: url)
        }
        return false
    }

    private func shouldSetupWindow(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if application.applicationState == .background {
            return false
        }

        guard let launchOptions = launchOptions else {
            return true
        }

        let backgroundOnlyKeys: [UIApplication.LaunchOptionsKey] = [.location]

        for k in backgroundOnlyKeys {
            if launchOptions.keys.contains(k) {
                return false
            }
        }

        return true
    }

    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKey()
        window?.rootViewController = navigationController

        setupAppearance()

        window?.makeKeyAndVisible()

        if !WalletUserStorage.shared.hasCompletedOnboarding {
            // show onboarding
            let onboardingViewController = OnboardingViewController()
            onboardingViewController.modalPresentationStyle = .fullScreen
            window?.rootViewController?.present(onboardingViewController, animated: false)
        }

        setupImportHandler()
    }

    private func willAppearAfterColdstart(_: UIApplication, coldStart _: Bool, backgroundTime _: TimeInterval) {
        // Logic for coldstart / background
        startConfigRequest()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        lastForegroundActivity = Date()

        // App should not have badges
        // Reset to 0 to ensure a unexpected badge doesn't stay forever
        application.applicationIconBadgeNumber = 0

        addBlurView()
    }

    func applicationDidBecomeActive(_: UIApplication) {
        removeBlurView()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // If window was not initialized (e.g. app was started cause
        // by a location change), we need to do that
        if window == nil {
            setupWindow()
            willAppearAfterColdstart(application, coldStart: true, backgroundTime: 0)

        } else {
            let backgroundTime = -(lastForegroundActivity?.timeIntervalSinceNow ?? 0)
            willAppearAfterColdstart(application, coldStart: false, backgroundTime: backgroundTime)
            application.applicationIconBadgeNumber = 0
        }
    }

    // MARK: - Force update

    private func startConfigRequest() {
        if WalletUserStorage.shared.hasCompletedOnboarding {
            ConfigManager().startConfigRequest(window: window)
        }
    }

    // MARK: - Appearance

    private func setupAppearance() {
        UIBarButtonItem.appearance().tintColor = .cc_text

        UINavigationBar.appearance().titleTextAttributes = [
            .font: LabelType.textBold.font,
            .foregroundColor: UIColor.cc_greyText,
            .kern: LabelType.button.letterSpacing ?? 0.0,
        ]

        UIPageControl.appearance().pageIndicatorTintColor = .cc_black
        UIPageControl.appearance().currentPageIndicatorTintColor = .cc_white
    }

    // MARK: - Hide information on app switcher

    private func removeBlurView() {
        UIView.animate(withDuration: 0.15) {
            self.blurView?.effect = nil
            self.blurView?.alpha = 0.0
        } completion: { _ in
            self.blurView?.removeFromSuperview()
            self.blurView = nil
        }
    }

    private func addBlurView() {
        blurView?.removeFromSuperview()

        let bv = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        bv.frame = window?.frame ?? .zero
        bv.isUserInteractionEnabled = false
        window?.addSubview(bv)

        blurView = bv
    }
}

extension AppDelegate {
    private func setupImportHandler() {
        guard let delegate = window?.rootViewController as? NavigationController else {
            return
        }

        importHandler = ImportHandler(delegate: delegate)
    }

    func application(_: UIApplication, open url: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        guard WalletUserStorage.shared.hasCompletedOnboarding else {
            return false
        }

        importHandler?.handle(url: url)
        return true
    }
}
