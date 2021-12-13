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

class VerifyViewController: ViewController {
    private let scannerViewController = VerifyScannerViewController()
    private let checkViewController = VerifyCheckViewController()

    private var mode: CheckModeUIObject? {
        didSet {
            checkViewController.mode = mode
            scannerViewController.mode = mode
        }
    }

    private var modePopupView = VerifyModePopUpView()

    // MARK: - View

    init(mode: CheckModeUIObject?) {
        self.mode = mode
        super.init()

        checkViewController.mode = mode
        scannerViewController.mode = mode
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupInteraction()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if mode == nil {
            if CheckModesHelper.onlyOneMode() {
                mode = CheckModesHelper.allModes().first
                return
            }

            modePopupView.presentFrom(view: view)
            scannerViewController.pauseScanning()
        }
    }

    // MARK: - Setup

    private func setup() {
        addSubviewController(scannerViewController) { make in
            make.edges.equalToSuperview()
        }

        addSubviewController(checkViewController) { make in
            make.edges.equalToSuperview()
        }

        checkViewController.view.isUserInteractionEnabled = false

        view.addSubview(modePopupView)
        modePopupView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    public func dismissResult() {
        checkViewController.dismissResult()
    }

    private func setupInteraction() {
        scannerViewController.scanningSucceededCallback = { [weak self] holder in
            guard let strongSelf = self else { return }
            strongSelf.checkViewController.view.accessibilityViewIsModal = true
            strongSelf.checkViewController.view.isUserInteractionEnabled = true

            UIAccessibility.post(notification: .screenChanged, argument: strongSelf.checkViewController.view)
            strongSelf.checkViewController.holder = holder
        }

        scannerViewController.scanModeButtonPressed = { [weak self] button in
            guard let strongSelf = self else { return }
            strongSelf.modePopupView.selectedKey = strongSelf.mode?.id
            strongSelf.modePopupView.presentFrom(view: button)
            strongSelf.scannerViewController.pauseScanning()
        }

        scannerViewController.dismissTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }

            strongSelf.dismiss(animated: true, completion: nil)
        }

        checkViewController.okPressedTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.checkViewController.view.accessibilityViewIsModal = false
            strongSelf.checkViewController.view.isUserInteractionEnabled = false

            UIAccessibility.post(notification: .screenChanged, argument: strongSelf.checkViewController.view)
            strongSelf.scannerViewController.restart()
        }

        modePopupView.chooseCallback = { [weak self] modeKey in
            guard let strongSelf = self else { return }

            VerifierUserStorage.shared.checkModeKey = modeKey
            strongSelf.mode = CheckModesHelper.mode(for: modeKey)
            strongSelf.scannerViewController.restart()
        }
    }

    private func updateUI() {}
}
