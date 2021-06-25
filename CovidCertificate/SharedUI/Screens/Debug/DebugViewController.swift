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
import UIKit

class DebugViewController: ViewController {
    let stackView = StackScrollView(axis: .vertical, spacing: Padding.small)

    override init() {
        super.init()
        title = "Debug Settings"
        addDismissButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG || RELEASE_DEV
            view.addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            stackView.stackView.isLayoutMarginsRelativeArrangement = true
            stackView.stackView.layoutMargins = UIEdgeInsets(top: 0, left: Padding.medium, bottom: 0, right: Padding.medium)

            stackView.addArrangedView(DebugSwitchView(title: "Certificate Pinning",
                                                      isOn: URLSession.evaluator.useCertificatePinning,
                                                      valueChanged: { newValue in
                                                          URLSession.evaluator.useCertificatePinning = newValue
                                                          CovidCertificateSDK.setOptions(options: SDKOptions(certificatePinning: newValue))
                                                      }))
        #endif
    }
}
