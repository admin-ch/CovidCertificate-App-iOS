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

public extension ImmunisationType {
    var displayName: String {
        switch self {
        case .recovery:
            return UBLocalized.certificate_reason_recovered
        case .test:
            return UBLocalized.certificate_reason_tested
        case .vaccination:
            return UBLocalized.certificate_reason_vaccinated
        }
    }
}

public extension CertificateHolder {
    var displayIssuedAt: String? {
        if let i = issuedAt {
            return DateFormatter.ub_dayTimeString(from: i)
        }

        return nil
    }
}

#if WALLET
    fileprivate typealias ExtensionModel = CovidCertificate
#elseif VERIFIER
    fileprivate typealias ExtensionModel = VerifierCertificateHolder
#endif

private extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        switch self {
        case .none:
            return true
        case let .some(s):
            return s.isEmpty
        }
    }
}

public extension ExtensionModel {
    var displayFullName: String? {
        return [displayLastName, displayName].compactMap { $0 }.joined(separator: " ")
    }

    var displayLastName: String? {
        return person.familyName.isNilOrEmpty ? person.standardizedFamilyName : person.familyName
    }

    var displayName: String? {
        return person.givenName.isNilOrEmpty ? person.standardizedGivenName : person.givenName
    }

    var displayMonospacedName: String? {
        return [person.standardizedFamilyName, person.standardizedGivenName].compactMap { $0 }.joined(separator: "<<")
    }

    #if WALLET
        var sharePDFName: String? {
            // only DCCCerts should get exported
            guard let certificate = self as? DCCCert else { return nil }
            let name = [certificate.person.familyName, certificate.person.givenName].compactMap { $0 }.joined(separator: "-")
            guard let uvci: String = certificate.vaccinations?.first?.certificateIdentifier ??
                certificate.pastInfections?.first?.certificateIdentifier ??
                certificate.tests?.first?.certificateIdentifier else { return nil }
            return "covid-certificate-\(name)-\(uvci.suffix(4)).pdf"
        }
    #endif
}

extension Vaccination {
    var getNumberOverTotalDose: String {
        return "\(doseNumber)/\(totalDoses)"
    }

    var displayDateOfVaccination: String {
        if let d = dateOfVaccination {
            return DateFormatter.ub_dayString(from: d)
        }

        // fallback
        return vaccinationDate
    }

    var displayCountry: String {
        return Locale.current.localizedString(forRegionCode: country) ?? country
    }

    var displayCountryEnglish: String? {
        return Locale(identifier: "en").localizedString(forRegionCode: country)
    }
}

extension Array where Element == Vaccination {
    var isComplete: Bool {
        allSatisfy { $0.doseNumber >= $0.totalDoses }
    }
}

extension PastInfection {
    var displayCountry: String {
        return Locale.current.localizedString(forRegionCode: countryOfTest) ?? countryOfTest
    }

    var displayCountryEnglish: String? {
        return Locale(identifier: "en").localizedString(forRegionCode: countryOfTest)
    }

    var displayFirstPositiveTest: String? {
        if let d = firstPositiveTestResultDate {
            return DateFormatter.ub_dayString(from: d)
        }

        return nil
    }
}

extension Test {
    var displayCountry: String {
        return Locale.current.localizedString(forRegionCode: country) ?? country
    }

    var displayCountryEnglish: String? {
        return Locale(identifier: "en").localizedString(forRegionCode: country)
    }

    var displaySampleDateTime: String? {
        if let d = validFromDate {
            return DateFormatter.ub_dayTimeString(from: d)
        }

        return timestampSample
    }

    var displayResultDateTime: String? {
        if let d = resultDate {
            return DateFormatter.ub_dayTimeString(from: d)
        }

        return timestampResult
    }
}
