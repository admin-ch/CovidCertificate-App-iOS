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

import UIKit

class CertificateQRCodeStateView: UIView {
    private let backgroundView = UIView()
    private let imageView = UIImageView()

    private let modeView = ModeStackView(itemHeight: 32.0, validColor: .cc_white, invalidColor: .cc_text)

    var state: TemporaryVerifierState {
        didSet {
            if oldValue != state {
                updateBackground(animated: state != .verifying)
            }
        }
    }

    init(initialState: TemporaryVerifierState) {
        state = initialState
        super.init(frame: .zero)

        setupView()

        updateBackground(animated: false)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundView.alpha = 0.9
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        addSubview(modeView)
        modeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.snp.bottom).multipliedBy(0.75)
        }
    }

    private func updateBackground(animated: Bool) {
        let actions = {
            self.alpha = self.state != .idle ? 1 : 0

            switch self.state {
            case .idle:
                self.imageView.layer.removeAllAnimations()
                self.imageView.image = nil
                self.backgroundView.backgroundColor = nil
                self.modeView.modeResults = nil

            case .verifying:
                self.imageView.image = UIImage(named: "ic-header-load")
                self.imageView.rotate(time: 1.0)
                self.backgroundView.backgroundColor = .cc_grey
                self.modeView.modeResults = nil

            case let .success(_, modeResults):
                self.imageView.layer.removeAllAnimations()
                self.imageView.image = UIImage(named: "ic-header-valid")
                self.backgroundView.backgroundColor = .cc_green
                self.modeView.modeResults = modeResults
            case .failure:
                self.imageView.layer.removeAllAnimations()
                self.imageView.image = UIImage(named: "ic-header-invalid")
                self.backgroundView.backgroundColor = .cc_red
                self.modeView.modeResults = nil

            case let .retry(error, _):
                self.imageView.layer.removeAllAnimations()
                let imageName: String
                switch error {
                case .noInternetConnection:
                    imageName = "ic-header-offline"
                case .timeShift:
                    imageName = "ic-header-time"
                default:
                    imageName = "ic-header-error"
                }
                self.imageView.image = UIImage(named: imageName)
                self.backgroundView.backgroundColor = .cc_orange
                self.modeView.modeResults = nil
            }
        }

        if animated {
            UIView.animate(withDuration: 0.2) { actions() }
        } else {
            actions()
        }
    }
}
