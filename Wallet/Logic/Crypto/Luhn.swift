//
// Heavily inspired by https://github.com/ebluehands/LuhnModN/blob/master/LuhnModN/LuhnModN.swift

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

public enum Luhn {
    private static let characterSet = "1234567890ABCDEFGHKMNPRSTUWXYZ".map { "\($0)" }

    private static let codeSize = 8
    public static func generateLuhnCode() -> String {
        let luhnCode = (0 ..< 8).map { _ in characterSet.randomElement()! }.joined()
        let checksum = calculateLuhnSum(luhnCode, shouldDouble: { $0 % 2 == 0 })
        let mod = characterSet.count
        let remainder = checksum % mod
        let checkCodePoint = (mod - remainder) % mod
        let luhnCodeAndCheckCharacter = luhnCode + String(characterSet[checkCodePoint])
        return luhnCodeAndCheckCharacter
    }

    public static func checkLuhnCode(_ luhnCode: String) -> Bool {
        let sum = calculateLuhnSum(luhnCode, shouldDouble: { $0 % 2 != 0 })
        let remainder = sum % characterSet.count
        return remainder == 0
    }

    private static func calculateLuhnSum(_ luhnCode: String, shouldDouble: (_ index: Int) -> Bool) -> Int {
        return luhnCode.reversed().map {
            characterSet.firstIndex(of: String($0))!
        }.enumerated()
            .map {
                sum(digits: $1 * (shouldDouble($0) ? 2 : 1), withModulo: characterSet.count)
            }
            .reduce(0, +)
    }

    private static func sum(digits addend: Int, withModulo mod: Int) -> Int {
        return (addend / mod) + (addend % mod)
    }
}
