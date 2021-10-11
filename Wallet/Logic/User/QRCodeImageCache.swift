
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

final class QRCodeImageCache {
    static let shared = QRCodeImageCache()

    private lazy var renderedQRCodeImageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.countLimit = 50
        return cache
    }()

    private init() {}

    func image(for payload: String) -> UIImage? {
        if let renderedImage = renderedQRCodeImageCache.object(forKey: payload as AnyObject) as? UIImage {
            return renderedImage
        }

        if let qrImage = QRCodeUtils.createQrCodeImage(from: payload) {
            renderedQRCodeImageCache.setObject(qrImage as AnyObject, forKey: payload as AnyObject)
        }

        return nil
    }
}
