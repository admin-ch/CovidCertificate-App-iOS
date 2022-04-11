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

class HomescreenBaseViewController: ViewController {
    // MARK: - Content

    public var backgroundTopLayoutGuide = UILayoutGuide()

    private let backgroundView: RoundBackgroundView
    private let logoView = UIImageView(image: UIImage(named: "ic-bund"))
    private let infoButton = Button(image: UIImage(named: "ic-info-outline"), accessibilityKey: .accessibility_info_button)
    private let boxView = InfoBoxView()

    public let infoBoxButton = InfoBoxButton()

    public var backgroundViewOffset: CGPoint = .zero {
        didSet {
            backgroundView.offset = backgroundViewOffset
        }
    }

    private var _infoBox: InfoBox?

    public var infoBox: InfoBox? {
        get { _infoBox }
        set(newValue) {
            if infoBox != newValue {
                _infoBox = newValue
                updateInfoBox(true)
            }
        }
    }

    public var infoButtonCallback: (() -> Void)?

    // MARK: - Init

    init(color: UIColor) {
        backgroundView = RoundBackgroundView(backgroundColor: color, down: true)
        super.init()
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backgroundView)
        view.addSubview(logoView)

        logoView.ub_setContentPriorityRequired()

        logoView.snp.makeConstraints { make in
            let statusHeight = UIApplication.shared.statusBarFrame.height
            make.top.equalTo(view.safeAreaLayoutGuide).inset(statusHeight > 20.0 ? 11.0 : 18.0)
            make.centerX.equalToSuperview()
        }

        #if DEBUG || RELEASE_DEV
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(openDebugSettings))
            recognizer.numberOfTapsRequired = 2
            logoView.addGestureRecognizer(recognizer)
            logoView.isUserInteractionEnabled = true
        #endif

        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(self.logoView.snp.bottom).offset(10.0)
            make.left.right.bottom.equalToSuperview()
        }

        view.addLayoutGuide(backgroundTopLayoutGuide)

        backgroundTopLayoutGuide.snp.makeConstraints { make in
            make.top.equalTo(self.backgroundView.snp.top).offset(21.0)
        }

        view.addSubview(infoButton)

        infoButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.logoView)
            make.right.equalToSuperview().inset(Padding.medium)
            make.size.equalTo(44.0)
        }

        infoButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.infoButtonCallback?()
        }

        view.addSubview(infoBoxButton)

        infoBoxButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.logoView)
            make.left.equalToSuperview().inset(Padding.medium)
        }

        view.addSubview(boxView)

        boxView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        infoBoxButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.presentInfoBox()
        }

        boxView.showCallback = { [weak self] show in
            guard let strongSelf = self else { return }
            strongSelf.infoBoxButton.isOn = show
            strongSelf.infoBoxButton.isUserInteractionEnabled = !show
        }

        updateInfoBox(false)
    }

    #if DEBUG || RELEASE_DEV
        @objc func openDebugSettings() {
            DebugViewController().presentInNavigationController(from: self)
        }
    #endif

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.bringSubviewToFront(boxView)
        view.bringSubviewToFront(infoBoxButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.updatePath()
    }

    private func presentInfoBox() {
        boxView.infoBox = infoBox
        boxView.presentFrom(view: infoBoxButton, isPresentedFromCloseButton: true)
    }

    private func dismissInfoBox() {
        boxView.dismiss()
    }

    public func updateInfoBox(_ animated: Bool) {
        let actions = {
            self.infoBoxButton.isOn = self.infoBox == nil
            self.infoBoxButton.alpha = self.infoBox != nil ? 1.0 : 0.0
        }

        if animated {
            UIView.animate(withDuration: 0.2) {
                actions()
            }

        } else {
            actions()
        }

        if let infoBox = infoBox,
           !InfoBoxVisibilityManager.shared.dismissedInfoBoxIds.contains(infoBox.infoId ?? "") {
            presentInfoBox()
        } else {
            dismissInfoBox()
        }
    }
}
