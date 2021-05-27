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

class WalletQRScannerFullOverlayView: UIView {
    public let scannerOverlay = WalletQRScannerOverlay()
    private let fillLayer = CAShapeLayer()

    private let requestLabel = Label(.text, textAlignment: .center)
    private let errorView = QRScanErrorView(imageColor: .cc_white, backgroundColor: .cc_bund, textColor: .cc_white)

    private let errorLabel = Label(.smallError)

    private let additionalInset: CGFloat

    init(additionalInset: CGFloat) {
        self.additionalInset = additionalInset
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
            self.scannerOverlay.lineColor = error == nil ? .cc_blue : .cc_bund
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
            make.top.equalToSuperview().offset(3 * Padding.large)
            make.left.right.equalToSuperview().inset(2.0 * Padding.medium + WalletQRScannerOverlay.lineWidth * 1.5)
        }

        addSubview(errorView)

        errorView.snp.makeConstraints { make in
            make.bottom.equalTo(scannerOverlay.snp.top).offset(-Padding.large)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualToSuperview().inset(Padding.medium)
        }

        errorView.alpha = 1.0

        addSubview(errorLabel)

        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(scannerOverlay.snp.top).offset(WalletQRScannerOverlay.lineWidth * 0.5)
        }
    }

    override open func layoutSubviews() {
        super.layoutSubviews()

        let pathBigRect = UIBezierPath(rect: bounds)
        let inset = WalletQRScannerOverlay.lineWidth * 3.0
        let pathSmallRect = UIBezierPath(rect: scannerOverlay.frame.inset(by: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)))

        pathBigRect.append(pathSmallRect)
        pathBigRect.usesEvenOddFillRule = true

        fillLayer.path = pathBigRect.cgPath
        fillLayer.fillRule = CAShapeLayerFillRule.evenOdd
        fillLayer.fillColor = UIColor.white.withAlphaComponent(0.5).cgColor

        fillLayer.path = pathBigRect.cgPath
    }
}

public class WalletQRScannerOverlay: UIView {
    public static let lineWidth: CGFloat = 10

    var lineColor: UIColor = .cc_blue {
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

        context.setLineWidth(WalletQRScannerOverlay.lineWidth)
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
