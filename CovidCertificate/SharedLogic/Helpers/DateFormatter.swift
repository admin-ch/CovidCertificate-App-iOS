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

/// Convenience for converting dates into user-displayable strings in a unified form.
extension DateFormatter {
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()

    private static let dayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()

    private static let dayWithMonthFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd. MMMM yyyy"
        return dateFormatter
    }()

    private static let dayDateTimeFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm"
        return dateFormatter
    }()

    static func ub_string(from date: Date) -> String {
        dateFormatter.string(from: date)
    }

    static func ub_dayString(from date: Date) -> String {
        dayDateFormatter.string(from: date)
    }

    static func ub_dayWithMonthString(from date: Date) -> String {
        dayWithMonthFormatter.string(from: date)
    }

    static func ub_dayTimeString(from date: Date) -> String {
        dayDateTimeFormatter.string(from: date)
    }
}
