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

import AVFoundation
import Foundation
import UIKit

/// Delegate callback for the NSQRScannerView.
protocol QRScannerViewDelegate: AnyObject {
    func qrScanningDidFail()
    func qrScanningSucceededWithCode(_ str: String?)
    func qrScanningDidStop()
}

class QRScannerView: UIView {
    weak var delegate: QRScannerViewDelegate?

    lazy var videoCaptureDevice: AVCaptureDevice? = AVCaptureDevice.default(for: .video)

    /// capture session which allows us to start and stop scanning.
    var captureSession: AVCaptureSession?

    private var lampOn: Bool
    
    /// When this is set to true, the capture session keeps running but no output is processed.
    /// One difference to stopping the scanning completely is that the torch can still be kept on while paused.
    private var isScanningPaused: Bool = true

    init(delegate: QRScannerViewDelegate) {
        lampOn = false
        super.init(frame: .zero)
        self.delegate = delegate
        clipsToBounds = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: overriding the layerClass to return `AVCaptureVideoPreviewLayer`.

    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }

    override var layer: AVCaptureVideoPreviewLayer {
        return super.layer as! AVCaptureVideoPreviewLayer
    }
}

extension QRScannerView {
    var isRunning: Bool {
        return captureSession?.isRunning ?? false
    }

    var canEnableTorch: Bool {
        guard let camera = videoCaptureDevice else { return false }
        return camera.hasTorch && camera.isTorchAvailable
    }

    func startScanning() {
        isScanningPaused = false
        setupCaptureSessionIfNeeded()

        if let c = captureSession, !c.isRunning {
            c.startRunning()
        }
    }

    public func setCameraLight(on: Bool) {
        guard let camera = videoCaptureDevice,
              canEnableTorch else { return }

        lampOn = on
        try? camera.setLight(on: lampOn)
    }
    
    func pauseScanning() {
        isScanningPaused = true
    }

    func stopScanning() {
        isScanningPaused = true
        captureSession?.stopRunning()
        delegate?.qrScanningDidStop()

        setCameraLight(on: false)
    }

    /// Does the initial setup for captureSession
    private func setupCaptureSessionIfNeeded() {
        // check if user didn't deny camera usage to show error
        if AVCaptureDevice.authorizationStatus(for: .video) == .denied {
            scanningDidFail()
            return
        }

        if captureSession == nil {
            captureSession = AVCaptureSession()
            startCapture()
        }
    }

    func startCapture() {
        guard let videoCaptureDevice = videoCaptureDevice else {
            return
        }

        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            scanningDidFail()
            return
        }

        if captureSession?.canAddInput(videoInput) ?? false {
            captureSession?.addInput(videoInput)
        } else {
            scanningDidFail()
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if captureSession?.canAddOutput(metadataOutput) ?? false {
            captureSession?.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr, .ean8, .ean13, .pdf417, .aztec]
        } else {
            scanningDidFail()
            return
        }

        layer.session = captureSession
        layer.videoGravity = .resizeAspectFill
    }

    func scanningDidFail() {
        delegate?.qrScanningDidFail()
        isScanningPaused = true
        captureSession = nil
    }

    func found(code: String) {
        delegate?.qrScanningSucceededWithCode(code)
    }
}

extension QRScannerView: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from _: AVCaptureConnection)
    {
        guard !isScanningPaused else { return } // Don't process any input if scanning is paused
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            found(code: stringValue)
        }
    }
}

private extension AVCaptureDevice {
    func setLight(on: Bool) throws {
        try lockForConfiguration()
        if on {
            try setTorchModeOn(level: 1)
        } else {
            torchMode = .off
        }
        unlockForConfiguration()
    }
}
