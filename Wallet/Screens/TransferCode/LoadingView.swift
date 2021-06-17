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

class LoadingView: UIView {
    private let activityIndicator = UIActivityIndicatorView(style: .gray)

    init() {
        super.init(frame: .zero)

        setupView()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .cc_white
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        alpha = 0
    }

    func startLoading() {
        alpha = 1.0
        activityIndicator.startAnimating()
    }

    func stopLoading() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
            self.alpha = 0
        }, completion: nil)
        activityIndicator.stopAnimating()
    }
}
