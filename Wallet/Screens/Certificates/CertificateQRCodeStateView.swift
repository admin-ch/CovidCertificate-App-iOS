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

    var state: TemporaryVerifierState {
        didSet {
            updateBackground(animated: state != .verifying)
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
    }

    private func updateBackground(animated: Bool) {
        let actions = {
            self.alpha = self.state != .idle ? 1 : 0
            switch self.state {
            case .idle:
                self.imageView.layer.removeAllAnimations()
                self.imageView.image = nil
                self.backgroundView.backgroundColor = nil
            case .verifying:
                self.imageView.image = UIImage(named: "ic-header-load")
                self.imageView.rotate(time: 1.0)
                self.backgroundView.backgroundColor = .cc_grey
            case .success:
                self.imageView.layer.removeAllAnimations()
                self.imageView.image = UIImage(named: "ic-header-valid")
                self.backgroundView.backgroundColor = .cc_green
            case .failure:
                self.imageView.layer.removeAllAnimations()
                self.imageView.image = UIImage(named: "ic-header-invalid")
                self.backgroundView.backgroundColor = .cc_red
            case let .retry(error):
                self.imageView.layer.removeAllAnimations()
                let imageName = error == .noInternetConnection ? "ic-header-offline" : "ic-header-error"
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
