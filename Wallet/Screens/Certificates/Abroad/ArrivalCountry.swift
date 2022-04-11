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

import Foundation

public class ArrivalCountry: Codable, UBUserDefaultValue {
    public typealias ID = String

    public let id: ID

    public let localizedString: String

    init?(countryCode: ID) {
        var identifier: String
        switch countryCode.lowercased() {
        case "el":
            identifier = "gr"
        default:
            identifier = countryCode
        }
        guard let name = Locale.current.localizedString(forRegionCode: identifier.lowercased()) else {
            return nil
        }

        id = countryCode
        localizedString = name
    }
}

extension ArrivalCountry: Equatable {
    public static func == (lhs: ArrivalCountry, rhs: ArrivalCountry) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Array where Element == ArrivalCountry {
    var sortedByLocalizedName: [ArrivalCountry] {
        sorted { $0.localizedString.localizedCompare($1.localizedString) == .orderedAscending }
    }
}
