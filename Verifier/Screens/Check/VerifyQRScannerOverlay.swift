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
import SnapKit
import UIKit

class VerifierQRScannerFullOverlayView: UIView {
    public let scannerOverlay = VerifierQRScannerOverlay()
    private let fillLayer = CAShapeLayer()

    private let requestLabel = Label(.textBold, textColor: .white, textAlignment: .center)
    private let errorView = QRScanErrorView(imageColor: .cc_red, backgroundColor: .cc_white, textColor: .cc_black)

    private let errorLabel = Label(.smallError, textColor: .cc_red)

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func showErrorView(error: CovidCertError?, animated: Bool) {
        let actions = {
            self.errorView.alpha = error != nil ? 1.0 : 0.0
            self.errorLabel.alpha = error != nil ? 1.0 : 0.0
            self.errorLabel.text = error?.errorCode
            self.scannerOverlay.lineColor = error == nil ? .white : .cc_red
        }

        if animated {
            UIView.animate(withDuration: 0.2) {
                actions()
            }
        } else {
            actions()
        }
    }

    private func setup() {
        layer.addSublayer(fillLayer)

        addSubview(scannerOverlay)

        scannerOverlay.snp.makeConstraints { make in
            make.height.equalTo(self.scannerOverlay.snp.width)
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(2.0 * Padding.medium + VerifierQRScannerOverlay.lineWidth * 1.5)
        }

        addSubview(requestLabel)

        requestLabel.snp.makeConstraints { make in
            make.top.equalTo(scannerOverlay.snp.bottom).offset(Padding.large + Padding.small)
            make.left.right.equalTo(scannerOverlay)
        }

        addSubview(errorView)

        errorView.snp.makeConstraints { make in
            make.bottom.equalTo(scannerOverlay.snp.top).offset(-Padding.large)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualToSuperview().inset(Padding.medium)
        }

        errorView.alpha = 0.0

        addSubview(errorLabel)

        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(scannerOverlay.snp.top).offset(VerifierQRScannerOverlay.lineWidth * 0.5)
        }

        requestLabel.text = UBLocalized.verifier_qr_scanner_scan_qr_text
    }

    override open func layoutSubviews() {
        super.layoutSubviews()

        let pathBigRect = UIBezierPath(rect: bounds)
        let inset = VerifierQRScannerOverlay.lineWidth * 3.0
        let pathSmallRect = UIBezierPath(rect: scannerOverlay.frame.inset(by: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)))

        pathBigRect.append(pathSmallRect)
        pathBigRect.usesEvenOddFillRule = true

        fillLayer.path = pathBigRect.cgPath
        fillLayer.fillRule = CAShapeLayerFillRule.evenOdd
        fillLayer.fillColor = UIColor.black.withAlphaComponent(0.6).cgColor

        fillLayer.path = pathBigRect.cgPath
    }
}

public class VerifierQRScannerOverlay: UIView {
    public static var lineWidth: CGFloat = 10

    var lineColor: UIColor = .white {
        didSet { setNeedsDisplay() }
    }

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.clear
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func drawCorners(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.setLineWidth(VerifierQRScannerOverlay.lineWidth)
        context.setStrokeColor(lineColor.cgColor)

        let height = rect.size.height
        let width = rect.size.width

        let offset: CGFloat = 0
        let rectangleSize = min(height, width) - 2 * min(height, width) * offset
        let xOffset = (width - rectangleSize) / 2
        let yOffset = (height - rectangleSize) / 2
        let cornerLenght = rectangleSize * 0.2

        // Top left
        context.beginPath()
        context.move(to: .init(x: xOffset, y: yOffset + cornerLenght))
        context.addLine(to: .init(x: xOffset, y: yOffset))
        context.addLine(to: .init(x: xOffset + cornerLenght, y: yOffset))
        context.strokePath()

        // Top right
        context.beginPath()
        context.move(to: .init(x: xOffset + rectangleSize - cornerLenght, y: yOffset))
        context.addLine(to: .init(x: xOffset + rectangleSize, y: yOffset))
        context.addLine(to: .init(x: xOffset + rectangleSize, y: yOffset + cornerLenght))
        context.strokePath()

        // Bottom left
        context.beginPath()
        context.move(to: .init(x: xOffset, y: yOffset + rectangleSize - cornerLenght))
        context.addLine(to: .init(x: xOffset, y: yOffset + rectangleSize))
        context.addLine(to: .init(x: xOffset + cornerLenght, y: yOffset + rectangleSize))
        context.strokePath()

        // Bottom right
        context.beginPath()
        context.move(to: .init(x: xOffset + rectangleSize - cornerLenght, y: yOffset + rectangleSize))
        context.addLine(to: .init(x: xOffset + rectangleSize, y: yOffset + rectangleSize))
        context.addLine(to: .init(x: xOffset + rectangleSize, y: yOffset + rectangleSize - cornerLenght))
        context.strokePath()
    }

    override public func draw(_ rect: CGRect) {
        drawCorners(rect)
    }
}
