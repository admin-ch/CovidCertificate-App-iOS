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

class TransferCodeDetailViewController: ViewController {
    private let certificate: UserCertificate

    private let stackScrollView = StackScrollView()

    private let nameView = Label(.title, textAlignment: .center)
    private let animationView = TransferCodeAnimationView()

    // MARK: - Init

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init()

        title = UBLocalized.wallet_transfer_code_card_title.uppercased()
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.large + Padding.medium
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)

        view.addSubview(stackScrollView)

        stackScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackScrollView.addSpacerView(Padding.large)

        stackScrollView.addArrangedView(animationView)
        stackScrollView.addArrangedView(nameView)
    }
}
