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

class QRScanErrorView: UIView {
    private let stackView = UIStackView()
    public let imageView = UIImageView()
    public let errorLabel = Label(.textBold)

    init(imageColor: UIColor, backgroundColor: UIColor, textColor: UIColor) {
        super.init(frame: .zero)

        self.backgroundColor = backgroundColor
        imageView.image = UIImage(named: "ic-info-alert")?.ub_image(with: imageColor)
        errorLabel.textColor = textColor

        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        layer.cornerRadius = 10.0

        stackView.axis = .horizontal
        stackView.spacing = Padding.small
        stackView.alignment = .center
        imageView.ub_setContentPriorityRequired()

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Padding.small)
        }

        errorLabel.text = UBLocalized.qr_scanner_error
        errorLabel.ub_setContentPriorityRequired()
        errorLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        stackView.addArrangedView(imageView)
        stackView.addArrangedView(errorLabel)
    }
}
