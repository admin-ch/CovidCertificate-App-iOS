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
import Foundation

/// The backend environment under which the application runs.
enum Environment {
    case dev
    case abnahme
    case prod

    /// The current environment, as configured in build settings.
    static var current: Environment {
        #if DEBUG
            return .dev
        #elseif RELEASE_DEV
            return .dev
        #elseif RELEASE_ABNAHME
            return .abnahme
        #elseif RELEASE_PROD
            return .prod
        #else
            fatalError("Missing build setting for environment")
        #endif
    }

    var appStoreURL: URL {
        #if WALLET
            return URL(string: UBLocalized.wallet_apple_app_store_url)!
        #elseif VERIFIER
            return URL(string: UBLocalized.verifier_apple_app_store_url)!
        #endif
    }

    var privacyURL: URL {
        #if WALLET
            return URL(string: UBLocalized.wallet_terms_privacy_link)!
        #elseif VERIFIER
            return URL(string: UBLocalized.verifier_terms_privacy_link)!
        #endif
    }

    var configService: Backend {
        switch self {
        case .dev:
            return Backend("https://www.cc-d.bit.admin.ch/app", version: nil)
        case .abnahme:
            return Backend("https://www.cc-a.bit.admin.ch/app", version: nil)
        case .prod:
            return Backend("https://www.cc.bit.admin.ch/app", version: nil)
        }
    }

    var sdkEnvironment: SDKEnvironment {
        switch self {
        case .dev:
            return SDKEnvironment.dev
        case .abnahme:
            return SDKEnvironment.abn
        case .prod:
            return SDKEnvironment.prod
        }
    }

    var appToken: String {
        // These app tokens are reserved for the official COVID Certificate and COVID Certificate Check app.
        // If you intend to integrate the CovidCertificate-SDK into your app, please get in touch with BIT/BAG to get a token assigned.
        #if VERIFIER
            switch self {
            case .dev:
                return "7f64903d-4420-4cc3-ac90-c14306b5e556"
            case .abnahme:
                return "f731fd3b-cb55-4cfd-9c46-fb3a927ffcd8"
            case .prod:
                return "25958ed0-7790-4846-9341-7c7ef87ec389"
            }
        #elseif WALLET
            switch self {
            case .dev:
                return "c838a4c4-39e5-4bbb-8e75-e4382df2edfe"
            case .abnahme:
                return "e9802c49-4f2b-49cc-a645-24c206366455"
            case .prod:
                return "0795dc8b-d8d0-4313-abf2-510b12d50939"
            }
        #endif
    }
}

extension Endpoint {
    /// Load Config
    /// let av = "ios-10"
    /// let os = "ios13"
    static func config(appversion av: String, osversion os: String, buildnr: String) -> Endpoint {
        #if WALLET
            let path = "wallet/v1/config"
        #elseif VERIFIER
            let path = "verifier/v1/config"
        #else
            let path = "" // Not supported
        #endif
        return Environment.current.configService.endpoint(path, queryParameters: ["appversion": av, "osversion": os, "buildnr": buildnr], headers: ["Accept": "application/json+jws"])
    }
}
