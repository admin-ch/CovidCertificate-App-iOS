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
import PDFKit

class ImportHandler {
    private weak var delegate: NavigationController?

    // MARK: - Init

    init(delegate: NavigationController) {
        self.delegate = delegate
    }

    // MARK: - Handle URL

    @discardableResult
    public func handle(url: URL) -> Bool {
        let accessingSecurityScopedResource = url.startAccessingSecurityScopedResource()

        defer {
            url.stopAccessingSecurityScopedResource()
            if accessingSecurityScopedResource {
                url.stopAccessingSecurityScopedResource()
            }
        }

        if let urlComponents = NSURLComponents(url: url,
                                               resolvingAgainstBaseURL: true) {
            switch urlComponents.scheme {
            case "hcert", "covidcert":
                guard let scheme = urlComponents.scheme,
                      let string = url.absoluteString.replacingOccurrences(of: scheme + "://", with: "").removingPercentEncoding,
                      string.starts(with: "HC1:") else { break }
                handleMessage(message: string)
                return true
            default:
                break
            }
        }

        var images: [UIImage] = []

        if isPdf(url: url) {
            images = drawImagesFromPDF(url: url)
        } else if let img = UIImage(contentsOfFile: url.path) {
            images = [img]
        }

        if images.count > 0 {
            let messages = images.compactMap { findQrCodeContent(image: $0) }

            if let message = messages.first {
                handleMessage(message: message)
            } else {
                presentMissingQRCodeError()
            }
        } else {
            presentWrongFileError()
        }

        return true
    }

    public func handleMessage(message: String) {
        let result = CovidCertificateSDK.Wallet.decode(encodedData: message)

        switch result {
        case .success:
            delegate?.topViewController?.dismiss(animated: false, completion: nil)

            let vc = CertificateAddDetailViewController(showScanAgainButton: false)
            vc.certificate = UserCertificate(qrCode: message, transferCode: nil)
            vc.addDismissButton()

            let navVC = NavigationController(rootViewController: vc, useNavigationBar: true)

            vc.addOrOkCertificateTouchUpCallback = { certificate in
                guard let c = certificate else { return }

                CertificateStorage.shared.insertCertificate(userCertificate: c)

                navVC.dismiss(animated: true, completion: nil)
            }

            delegate?.present(navVC, animated: true, completion: nil)

        case .failure:
            presentError()
        }
    }

    func presentMissingQRCodeError() {
        presentError()
    }

    func presentWrongFileError() {
        presentError()
    }

    func presentError() {
        delegate?.topViewController?.dismiss(animated: false, completion: nil)

        let alert = UIAlertController(title: UBLocalized.error_title, message: UBLocalized.verifier_error_invalid_format, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: UBLocalized.ok_button, style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))

        delegate?.present(alert, animated: true, completion: nil)
    }

    // MARK: - Helpers

    func isPdf(url: URL) -> Bool {
        return url.pathExtension.caseInsensitiveEquals("pdf")
    }

    func drawImagesFromPDF(url: URL) -> [UIImage] {
        guard let document = CGPDFDocument(url as CFURL) else { return [] }

        var images: [UIImage] = []

        // CGPDFDocument pages start at 1
        // only look at first 5 pages
        for i in 1 ..< min(document.numberOfPages + 1, 5) {
            if let page = document.page(at: i) {
                let pageRect = page.getBoxRect(.mediaBox)

                let renderer = UIGraphicsImageRenderer(size: pageRect.size)
                let img = renderer.image { ctx in
                    UIColor.white.set()
                    ctx.fill(pageRect)

                    ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
                    ctx.cgContext.scaleBy(x: 1.0, y: -1.0)

                    ctx.cgContext.drawPDFPage(page)
                }

                images.append(img)
            }
        }

        return images
    }

    func findQrCodeContent(image: UIImage) -> String? {
        guard let cgImage = image.cgImage,
              let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: nil) else {
            return nil
        }

        let ciImage = CIImage(cgImage: cgImage)

        let features = detector.features(in: ciImage)
        for feature in features {
            if let feature = feature as? CIQRCodeFeature {
                return feature.messageString
            }
        }

        return nil
    }
}

extension String {
    func caseInsensitiveEquals(_ string: String) -> Bool {
        return caseInsensitiveCompare(string) == .orderedSame
    }
}
