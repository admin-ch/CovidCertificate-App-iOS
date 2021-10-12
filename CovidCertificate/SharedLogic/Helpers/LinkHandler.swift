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

import CovidCertificateSDK
import Foundation

class LinkHandler {
    @discardableResult
    func handle(url _: URL) -> Bool {
        return false
    }

    #if WALLET
        func handle(userActivity: NSUserActivity,
                    navigationController: NavigationController) -> Bool {
            switch UserActivityTypes(rawValue: userActivity.activityType) {
            case .some(.certififcateView):
                guard let uvciUserActivity = userActivity.userInfo?["uvci"] as? String else { return false }

                for userCertificate in CertificateStorage.shared.userCertificates {
                    guard case let .success(certificateHolder) = CovidCertificateSDK.Wallet.decode(encodedData: userCertificate.qrCode ?? "")
                    else { continue }

                    guard let certificate = certificateHolder.certificate as? DCCCert else { continue }

                    guard let uvci: String = certificate.vaccinations?.first?.certificateIdentifier ??
                        certificate.pastInfections?.first?.certificateIdentifier ??
                        certificate.tests?.first?.certificateIdentifier else { continue }

                    if uvci == uvciUserActivity {
                        // if anything is presented modally we dismiss it
                        navigationController.topViewController?.dismiss(animated: false, completion: nil)
                        guard let topViewController = navigationController.topViewController else { return false }
                        let vc = WalletDetailViewController(certificate: userCertificate)
                        vc.presentInNavigationController(from: topViewController, animated: false)
                        return true
                    }
                }
                // if the certificate was not found we delete the user activity
                NSUserActivity.deleteSavedUserActivities(withPersistentIdentifiers: [NSUserActivityPersistentIdentifier(uvciUserActivity)], completionHandler: {})
                return false

            default:
                return false
            }
        }
    #endif
}

private extension URL {
    init?(userActivity: NSUserActivity) {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let url = userActivity.webpageURL
        else {
            return nil
        }
        self = url
    }
}
