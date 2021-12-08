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
import SnapKit

class VerifyCheckViewController: ViewController {
    // MARK: - API

    public var okPressedTouchUpCallback: (() -> Void)?

    // MARK: - Subviews

    private let checkContentViewController = VerifyCheckContentViewController()
    private var contentHeight: CGFloat = 0.0

    private let imageView = UIImageView()
    private let backgroundView = UIView()

    // MARK: - Start Check

    public var mode: CheckModeUIObject? {
        didSet { startCheck() }
    }

    public var holder: VerifierCertificateHolder? {
        didSet {
            checkContentViewController.holder = holder
            startCheck()
        }
    }

    // MARK: - Internal

    private var verifier: Verifier?

    private var state: VerificationState = .loading {
        didSet {
            updateBackground(true)
            self.checkContentViewController.state = state
        }
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

        UIStateManager.shared.addObserver(self) { [weak self] state in
            guard let strongSelf = self else { return }
            strongSelf.mode = CheckModesHelper.mode(for: state.checkMode.key)
        }

        setup()
        setupInteraction()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentHeight = checkContentViewController.view.frame.size.height
    }

    // MARK: - Start check

    private func startCheck() {
        guard let holder = holder, let mode = mode else { return }

        checkContentViewController.view.isHidden = false
        checkContentViewController.view.transform = CGAffineTransform(translationX: 0.0, y: contentHeight)

        UIView.animate(withDuration: 0.15) {
            self.backgroundView.alpha = 1.0
        }

        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.allowUserInteraction, .curveEaseInOut, .beginFromCurrentState]) {
            self.checkContentViewController.view.transform = .identity
        } completion: { _ in }

        verifier = Verifier(holder: holder)
        verifier?.start(mode: CheckMode(id: mode.id, displayName: mode.displayName)) { [weak self] state in
            guard let strongSelf = self else { return }
            strongSelf.state = state
        }
    }

    private func okPressed() {
        checkContentViewController.view.isHidden = false
        checkContentViewController.view.transform = .identity

        UIView.animate(withDuration: 0.15) {
            self.backgroundView.alpha = 0.0
        }

        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.allowUserInteraction, .curveEaseInOut, .beginFromCurrentState]) {
            self.checkContentViewController.view.transform = CGAffineTransform(translationX: 0.0, y: self.contentHeight)
        } completion: { _ in }
    }

    // MARK: - Setup

    private func setup() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundView.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.snp.topMargin).offset(Padding.medium)
        }

        addSubviewController(checkContentViewController) { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(Padding.medium - 2.0)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        checkContentViewController.view.isHidden = true
        backgroundView.alpha = 0.0

        updateBackground(false)
    }

    private func setupInteraction() {
        checkContentViewController.okButtonTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.okPressed()
            strongSelf.okPressedTouchUpCallback?()
        }

        checkContentViewController.dismissCallback = { [weak self] progress in
            guard let strongSelf = self else { return }

            strongSelf.backgroundView.alpha = 1.0 - progress

            if progress == 1.0 {
                strongSelf.okPressedTouchUpCallback?()
            }
        }

        checkContentViewController.retryButtonCallback = { [weak self] in
            guard let strongSelf = self else { return }
            if let mode = strongSelf.mode {
                strongSelf.verifier?.restart(mode: CheckMode(id: mode.id, displayName: mode.displayName))
            }
        }
    }

    public func dismissResult() {
        checkContentViewController.okButtonTouchUpCallback?()
    }

    // MARK: - Update

    private func updateBackground(_ animated: Bool) {
        let actions = {
            switch self.state {
            case .loading:
                self.imageView.image = UIImage(named: "ic-header-load")
                self.imageView.rotate(time: 1.0)
                self.backgroundView.backgroundColor = .cc_grey
            case .success, .skipped:
                self.imageView.layer.removeAllAnimations()
                self.imageView.image = UIImage(named: "ic-header-valid")
                self.backgroundView.backgroundColor = .cc_green
            case let .invalid:
                let (signatureError, revocationError, nationalError) = self.state.getVerifierErrorState() ?? (nil, nil, nil)

                var isLightUnsupported = false
                if let n = nationalError, case .lightUnsupported = n {
                    isLightUnsupported = true
                }

                self.imageView.layer.removeAllAnimations()

                self.imageView.image = UIImage(named: isLightUnsupported ? "ic-header-error" : "ic-header-invalid")
                self.backgroundView.backgroundColor = isLightUnsupported ? .cc_orange : .cc_red
            case let .retry(error, _):
                self.imageView.layer.removeAllAnimations()
                let imageName: String
                switch error {
                case .noInternetConnection:
                    imageName = "ic-header-noconn"
                case .timeShift:
                    imageName = "ic-header-time"
                default:
                    imageName = "ic-header-error"
                }
                self.imageView.image = UIImage(named: imageName)
                self.backgroundView.backgroundColor = .cc_orange
            }
        }

        if animated {
            UIView.animate(withDuration: 0.2) { actions() }
        } else {
            actions()
        }
    }
}
