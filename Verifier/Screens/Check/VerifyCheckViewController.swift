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

    private let imageView = StackedImageView()
    private let backgroundView = UIView()

    // MARK: - Start Check

    public var mode: CheckModeUIObject? {
        didSet {
            checkContentViewController.mode = mode
        }
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
            if state.wasModeUnknown {
                NotificationCenter.default.post(name: .userScannedWithUnknownMode, object: nil)
                return
            }

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
        guard let holder = holder else { return }

        checkContentViewController.view.isHidden = false
        checkContentViewController.view.transform = CGAffineTransform(translationX: 0.0, y: contentHeight)

        UIView.animate(withDuration: 0.15) {
            self.backgroundView.alpha = 1.0
        }

        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.allowUserInteraction, .curveEaseInOut, .beginFromCurrentState]) {
            self.checkContentViewController.view.transform = .identity
        } completion: { _ in }

        verifier = Verifier(holder: holder)

        var modes: [CheckMode] = []
        if let m = mode {
            modes.append(CheckMode(id: m.id, displayName: m.displayName))
        }

        verifier?.start(modes: modes) { [weak self] state in
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
                strongSelf.verifier?.restart(modes: [CheckMode(id: mode.id, displayName: mode.displayName)])
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
            case let .success(_, _, modeResults):
                if let successCode = CheckModesHelper.successValidationCode(modeResults: modeResults, mode: self.mode), successCode.is2GPlusSuccess {
                    // 2G+ success
                    if successCode.is2GPlusTestSuccess {
                        self.imageView.images = [UIImage(named: "ic-header-2-g-off"), UIImage(named: "ic-header-plus-on")]
                    } else {
                        self.imageView.images = [UIImage(named: "ic-header-2-g-on"), UIImage(named: "ic-header-plus-off")]
                    }

                } else {
                    // normal success
                    self.imageView.image = UIImage(named: "ic-header-valid")
                }

                self.backgroundView.backgroundColor = .cc_green

            case .skipped:
                self.imageView.image = UIImage(named: "ic-header-valid")
                self.backgroundView.backgroundColor = .cc_green
            case .invalid:
                let (_, _, nationalError) = self.state.getVerifierErrorState() ?? (nil, nil, nil)

                var isError = true
                if let n = nationalError {
                    switch n {
                    case .unknown, .lightUnsupported:
                        isError = false
                    default:
                        break
                    }
                }

                self.imageView.image = UIImage(named: isError ? "ic-header-invalid" : "ic-header-error")
                self.backgroundView.backgroundColor = isError ? .cc_red : .cc_orange
            case let .retry(error, _):
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

private class StackedImageView: UIView {
    // MARK: - Subviews

    private let stackView = UIStackView()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API

    public var image: UIImage? {
        didSet { setImages([image]) }
    }

    public var images: [UIImage?]? {
        didSet { setImages(images) }
    }

    public func rotate(time: Double) {
        for i in stackView.arrangedSubviews {
            if let iv = i as? UIImageView {
                iv.rotate(time: time)
            }
        }
    }

    // MARK: - Setup

    private func setup() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setImages(_ images: [UIImage?]?) {
        for v in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(v)
            v.removeFromSuperview()
        }

        for v in (images?.compactMap { $0 }.map { UIImageView(image: $0) } ?? []) {
            stackView.addArrangedSubview(v)
        }
    }
}
