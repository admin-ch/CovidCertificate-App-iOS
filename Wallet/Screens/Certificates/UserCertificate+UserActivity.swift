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

import CoreSpotlight
import CovidCertificateSDK
import Foundation
import MobileCoreServices

enum UserActivityTypes: String, CaseIterable {
    case certififcateView = "ch.admin.bag.covidcertificate.wallet.certificate.view"
}

extension UserCertificate {
    func userActivity() -> NSUserActivity? {
        guard case let .success(certificateHolder) = CovidCertificateSDK.Wallet.decode(encodedData: qrCode ?? "")
        else { return nil }

        guard let certificate = certificateHolder.certificate as? DCCCert else { return nil }

        guard let uvci: String = certificate.vaccinations?.first?.certificateIdentifier ??
            certificate.pastInfections?.first?.certificateIdentifier ??
            certificate.tests?.first?.certificateIdentifier else { return nil }

        let activity = NSUserActivity(activityType: UserActivityTypes.certififcateView.rawValue)
        activity.title = UBLocalized.wallet_certificate

        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        attributes.contentDescription = certificate.displayFullName

        attributes.identifier = uvci
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier(uvci)
        activity.keywords = [UBLocalized.wallet_certificate]
        activity.contentAttributeSet = attributes
        activity.userInfo = ["uvci": uvci]

        return activity
    }

    func deleteUserActivity() {
        guard case let .success(certificateHolder) = CovidCertificateSDK.Wallet.decode(encodedData: qrCode ?? "")
        else { return }

        guard let certificate = certificateHolder.certificate as? DCCCert else { return }

        guard let uvci: String = certificate.vaccinations?.first?.certificateIdentifier ??
            certificate.pastInfections?.first?.certificateIdentifier ??
            certificate.tests?.first?.certificateIdentifier else { return }

        NSUserActivity.deleteSavedUserActivities(withPersistentIdentifiers: [NSUserActivityPersistentIdentifier(uvci)]) {}
    }
}
