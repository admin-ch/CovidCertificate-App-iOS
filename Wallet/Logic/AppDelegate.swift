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
    private(set) var importHandler: ImportHandler?

    @UBUserDefault(key: "isFirstLaunch", defaultValue: true)
    var isFirstLaunch: Bool

    private let linkHandler = LinkHandler()

    lazy var navigationController = NavigationController(rootViewController: WalletHomescreenViewController())

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // migrates certificates from keychain to secure storage
        Migration.migrateToSecureStorage()

        // migrate certificate key to be included in encrypted backup
        Migration.migrateToSecureStorageWithoutSecureEnclave()

        // Pre-populate isFirstLaunch for users which already installed the app before we introduced this flag
        if WalletUserStorage.shared.hasCompletedOnboarding {
            isFirstLaunch = false
        }

        // Reset keychain on first launch
        if isFirstLaunch {
            CertificateStorage.shared.removeAll()
            Keychain().deleteAll()
            Enclave.deleteAllKeys()
            isFirstLaunch = false
        }

        CovidCertificateSDK.initialize(environment: Environment.current.sdkEnvironment, apiKey: Environment.current.appToken)
        #if DEBUG || RELEASE_DEV
            CovidCertificateSDK.setOptions(options: SDKOptions(certificatePinning: URLSession.evaluator.useCertificatePinning))
        #endif

        CertificateStorage.shared.discardExpiredLightCertificates()

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

        // Setup push manager
        setupPushManager(launchOptions: launchOptions)

        // delete PDF's on filesystem. A PDF can be saved there without being encrypted in two cases:
        // 1. when the app gets killed while sharing
        // 2. the OS stores the PDF in an inbox folder when importing it
        // Therefore we delete all PDFs (but the one included in the current launchOption) on the app start to be sure.
        deletePDFs(launchOptions: launchOptions)

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

        setupAppearance()

        if !WalletUserStorage.shared.hasCompletedOnboarding {
            // show onboarding
            let onboardingViewController = OnboardingViewController()
            onboardingViewController.modalPresentationStyle = .fullScreen
            window?.rootViewController = onboardingViewController
        } else if !WalletUserStorage.shared.hasCompletedLightCertificateUpdateBoarding {
            let onboardingViewController = CertificateLightUpdateBoardingViewController()
            onboardingViewController.modalPresentationStyle = .fullScreen
            window?.rootViewController = onboardingViewController
        } else {
            window?.rootViewController = navigationController
        }

        window?.makeKeyAndVisible()

        setupImportHandler()
    }

    func completedOnboarding() {
        guard let window = window else { return }

        let transition = CATransition()
        transition.type = .push
        transition.subtype = .fromRight
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        window.layer.add(transition, forKey: kCATransition)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    private func willAppearAfterColdstart(_: UIApplication, coldStart _: Bool, backgroundTime _: TimeInterval) {
        // Logic for coldstart / background
        if WalletUserStorage.shared.hasCompletedOnboarding {
            // Refresh config
            startConfigRequest()

            // Refresh trust list (public keys, revocation list, business rules,...)
            CovidCertificateSDK.restartTrustListUpdate(completionHandler: {
                UIStateManager.shared.stateChanged(forceRefresh: true)
            }, updateTimeInterval: TimeInterval(60 * 60))
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        lastForegroundActivity = Date()

        // App should not have badges
        // Reset to 0 to ensure a unexpected badge doesn't stay forever
        application.applicationIconBadgeNumber = 0

        addBlurView()

        if let tcvc = (window?.rootViewController?.presentedViewController as? NavigationController)?.viewControllers.first as? TransferCodeViewController {
            tcvc.dismissIfPossible()
        }
    }

    func applicationDidBecomeActive(_: UIApplication) {
        removeBlurView()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
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
        ConfigManager().startConfigRequest(window: window)
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

    // MARK: - Push

    func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        UBPushManager.shared.didRegisterForRemoteNotificationsWithDeviceToken(deviceToken)
    }

    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        UBPushManager.shared.didFailToRegisterForRemoteNotifications(with: error)
    }

    func setupPushManager(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        UBPushManager.shared.didFinishLaunchingWithOptions(launchOptions, pushHandler: PushHandler(), pushRegistrationManager: PushRegistrationManager())
    }

    func application(_: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        UBPushManager.shared.pushHandler.handleDidReceiveResponse(userInfo, fetchCompletionHandler: completionHandler)
    }
}

extension AppDelegate {
    private func setupImportHandler() {
        importHandler = ImportHandler(navigationControllerCallback: { [weak self] in
            guard let self = self,
                  let navigationController = self.window?.rootViewController as? NavigationController else {
                return nil
            }
            return navigationController
        })
    }

    func application(_: UIApplication, open url: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        guard WalletUserStorage.shared.hasCompletedOnboarding,
              let importHandler = importHandler else {
            return false
        }
        return importHandler.handle(url: url)
    }

    func deletePDFs(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        let launchUrls = launchOptions?.values.compactMap { $0 as? URL } ?? []
        func deletePDFs(in directory: URL) {
            if let enumerator = FileManager.default.enumerator(at: directory,
                                                               includingPropertiesForKeys: [.isRegularFileKey],
                                                               options: [.skipsHiddenFiles, .skipsPackageDescendants]) {
                for case let fileURL as URL in enumerator {
                    guard !launchUrls.contains(fileURL) else { continue }
                    do {
                        if fileURL.pathExtension.lowercased() == "pdf" {
                            try FileManager.default.removeItem(at: fileURL)
                        }
                    } catch {}
                }
            }
        }
        deletePDFs(in: FileManager.default.temporaryDirectory)
        for directory in FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) {
            deletePDFs(in: directory)
        }
    }
}
