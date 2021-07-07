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

class CertificateLightExpirationTimer: UIView {
    private let timerLabel = Label(.monospacedBold, textColor: .cc_blue, textAlignment: .center)

    private var expiration: Date?

    private var timer: Timer?

    var didExpireCallback: (() -> Void)?

    var certificate: LightCertificate? {
        didSet {
            timer?.invalidate()
            timer = nil

            guard let certificate = certificate else {
                return
            }

            switch CovidCertificateSDK.Wallet.decode(encodedData: certificate.certificate) {
            case let .success(holder):
                CovidCertificateSDK.Wallet.check(holder: holder, forceUpdate: false) { [weak self] results in
                    guard let self = self else { return }
                    switch results.nationalRules {
                    case let .success(validationResult):
                        self.expiration = validationResult.validUntil

                        guard self.expiration != nil else { return }

                        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                            guard let self = self else { return }
                            self.updateLabel()
                        }
                        self.updateLabel()
                    default:
                        self.expiration = nil
                    }
                }
            default:
                expiration = nil
            }
        }
    }

    init() {
        super.init(frame: .zero)

        timerLabel.text = 0.0.stringTime
        addSubview(timerLabel)
        timerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: Padding.small, left: 8, bottom: Padding.small, right: 8))
        }
        timerLabel.ub_setContentPriorityRequired()

        backgroundColor = .cc_blueish

        layer.cornerRadius = 10
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has ?not been implemented")
    }

    func updateLabel() {
        guard let date = expiration,
              date.timeIntervalSinceNow >= 0 else {
            timer?.invalidate()
            timer = nil
            didExpireCallback?()
            return
        }
        let timeInterval = max(date.timeIntervalSinceNow, 0.0)
        timerLabel.text = "\(timeInterval.stringTime)"
    }
}
