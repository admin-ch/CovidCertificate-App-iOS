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

    private let statusView = TransferCodeStatusView()

    private let updateView = TransferCodeUpdateView()
    private let refreshView = TransferCodeRefreshView()
    private let errorLabel = Label(.smallErrorLight, textAlignment: .center)

    private let deleteButton = Button(title: UBLocalized.delete_button, style: .normal(.cc_bund))

    // MARK: - Variables

    public var error: CryptoError? {
        didSet { update() }
    }

    public var updateDate: Date? {
        didSet {
            error = nil
            update()
        }
    }

    public var refreshCallback: (() -> Void)?

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

        refreshView.refreshButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.refreshCallback?()
        }

        updateView.refreshButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.refreshCallback?()
        }

        deleteButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.removeTransfer()
        }
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

        stackScrollView.addArrangedView(animationView)
        stackScrollView.addSpacerView(Padding.medium)
        stackScrollView.addArrangedView(nameView)
        stackScrollView.addSpacerView(Padding.large + Padding.small)

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Padding.small
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(updateView)
        stackView.addArrangedSubview(refreshView)
        stackView.addArrangedSubview(errorLabel)

        stackScrollView.addArrangedView(stackView)

        stackScrollView.addSpacerView(2.0 * Padding.large)

        let models = ConfigManager.currentConfig?.transferWorksViewModels ?? []
        StaticContentViewController.setupViews(models: models, stackView: stackScrollView.stackView, showAllViews: true)

        stackScrollView.addSpacerView(Padding.large)

        stackScrollView.addArrangedViewCentered(deleteButton)

        stackScrollView.addSpacerView(5.0 * Padding.large)

        nameView.text = UBLocalized.wallet_transfer_code_state_waiting
        statusView.transferCode = certificate.transferCode

        update()
    }

    private func update() {
        // data changes
        statusView.error = error
        refreshView.error = error
        errorLabel.text = error?.errorCode
        updateView.date = updateDate

        // visibility changes
        refreshView.ub_setHidden(error == nil)
        errorLabel.ub_setHidden(error == nil)
        updateView.ub_setHidden(error != nil)
    }

    private func removeTransfer() {
        let alert = UIAlertController(title: nil, message: UBLocalized.wallet_transfer_delete_confirm_text, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: UBLocalized.delete_button, style: .destructive, handler: { _ in
            CertificateStorage.shared.userCertificates = CertificateStorage.shared.userCertificates.filter { $0 != self.certificate }
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: UBLocalized.cancel_button, style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}