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

class CertificateAddDetailViewController: ViewController {
    // MARK: - Public API

    public var addOrOkCertificateTouchUpCallback: ((UserCertificate?) -> Void)?
    public var scanAgainTouchUpCallback: (() -> Void)?

    public var certificate: UserCertificate? {
        didSet {
            guard let cert = certificate else {
                certificateDetailView.certificate = nil
                alreadyHasCertificate = false
                return
            }

            certificateDetailView.certificate = cert
            alreadyHasCertificate = CertificateStorage.shared.userCertificates.contains(cert)
        }
    }

    private var alreadyHasCertificate: Bool = false {
        didSet {
            addOkButton.titleKey = alreadyHasCertificate ? .ok_button : .wallet_add_certificate_button
        }
    }

    // MARK: - Subviews

    private let bottomView = UIView()
    private let certificateDetailView = CertificateAddDetailView()

    private let addOkButton = Button(titleKey: .wallet_add_certificate_button)
    private let scanAgainButton = SimpleTextButton(titleKey: .wallet_scan_again, color: .cc_blue)

    let showScanAgainButton: Bool

    // MARK: - View

    init(showScanAgainButton: Bool = true) {
        self.showScanAgainButton = showScanAgainButton
        super.init()
        title = UBLocalized.wallet_add_certificate.uppercased()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cc_greyBackground

        setupViews()
        setupInteraction()
    }

    // MARK: - Setup

    private func setupViews() {
        view.addSubview(certificateDetailView)
        view.addSubview(bottomView)

        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
        }

        setupBottomView()

        certificateDetailView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
    }

    private func setupBottomView() {
        let gv = GradientView()

        view.addSubview(gv)

        gv.snp.makeConstraints { make in
            make.bottom.equalTo(self.bottomView.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(160.0)
        }

        bottomView.addSubview(addOkButton)

        addOkButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.medium + Padding.large)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().offset(Padding.large)
            make.right.lessThanOrEqualToSuperview().offset(-Padding.large)

            if !self.showScanAgainButton {
                let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
                if bottomPadding > 0 {
                    make.bottom.equalTo(self.view.snp.bottomMargin).inset(Padding.medium)
                } else {
                    make.bottom.equalToSuperview().inset(Padding.large)
                }
            }
        }

        if showScanAgainButton {
            bottomView.addSubview(scanAgainButton)

            scanAgainButton.snp.makeConstraints { make in
                make.top.equalTo(addOkButton.snp.bottom).offset(Padding.medium + Padding.large)
                make.centerX.equalToSuperview()
                make.left.greaterThanOrEqualToSuperview().offset(Padding.large)
                make.right.lessThanOrEqualToSuperview().offset(-Padding.large)

                let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
                if bottomPadding > 0 {
                    make.bottom.equalTo(self.view.snp.bottomMargin).inset(Padding.medium)
                } else {
                    make.bottom.equalToSuperview().inset(Padding.large)
                }
            }
        }
    }

    // MARK: - Interaction

    private func setupInteraction() {
        scanAgainButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.scanAgainTouchUpCallback?()
        }

        addOkButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.addOrOkCertificateTouchUpCallback?(strongSelf.certificate)
        }
    }
}

private class GradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    init() {
        super.init(frame: .zero)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.cc_greyBackground.withAlphaComponent(0.0).cgColor, UIColor.cc_greyBackground.cgColor]

        isUserInteractionEnabled = false
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
