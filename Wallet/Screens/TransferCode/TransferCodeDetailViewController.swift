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
    private let failedImageView = UIImageView(image: UIImage(named: "illu-transfer-failed"))
    private let failedImageContainerView = UIView()

    private let statusView = TransferCodeStatusView()

    private let failedExplanatoryView = TransferCodeFailedExplanatoryView()

    private let updateView = TransferCodeUpdateView()
    private let refreshView = TransferCodeRefreshView()
    private let errorLabel = Label(.smallErrorLight, textAlignment: .center)

    private let notificationDisabledView = TransferCodeNotificationDisabledView()

    private let deleteButton = Button(titleKey: .delete_button, style: .normal(.cc_bund))

    // MARK: - Variables

    public var error: TransferError? {
        didSet { update() }
    }

    public var updateDate: Date? {
        didSet {
            error = nil
            update()
        }
    }

    public var refreshCallback: (() -> Void)?

    private var cachedResult: TransferCodeResult?

    // MARK: - Init

    init(certificate: UserCertificate) {
        self.certificate = certificate
        super.init()

        title = UBLocalized.wallet_transfer_code_card_title.uppercased()

        if let tc = certificate.transferCode, tc.state != .failed {
            TransferManager.shared.addObserver(self, for: tc.transferCode) { [weak self] result in
                guard let self = self else { return }
                self.cachedResult = result
                self.update()
            }
        }
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

        notificationDisabledView.openSettingsCallback = {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
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

        stackScrollView.addArrangedView(failedImageContainerView)

        failedImageContainerView.addSubview(failedImageView)
        failedImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(Padding.large)
            make.bottom.equalToSuperview().inset(Padding.large + Padding.medium)
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }

        stackScrollView.addArrangedView(animationView)
        stackScrollView.addSpacerView(Padding.medium)
        stackScrollView.addArrangedView(nameView)
        stackScrollView.addSpacerView(Padding.large + Padding.small + Padding.medium)

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Padding.small
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(failedExplanatoryView)
        stackView.addArrangedSubview(updateView)
        stackView.addArrangedSubview(refreshView)
        stackView.addArrangedSubview(errorLabel)

        stackScrollView.addArrangedView(stackView)

        stackScrollView.addSpacerView(2.0 * Padding.large)

        let models = ConfigManager.currentConfig?.transferWorksViewModels ?? []
        StaticContentViewController.setupViews(models: models, stackView: stackScrollView.stackView, showAllViews: true)

        stackScrollView.addArrangedView(notificationDisabledView)
        notificationDisabledView.isHidden = true
        notificationDisabledView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackScrollView.stackView).inset(Padding.medium)
        }

        stackScrollView.addSpacerView(Padding.large)

        stackScrollView.addArrangedViewCentered(deleteButton)

        stackScrollView.addSpacerView(5.0 * Padding.large)

        statusView.transferCode = certificate.transferCode

        update()
    }

    private func update() {
        // data changes
        statusView.error = error
        refreshView.error = error
        errorLabel.text = error?.errorCode
        updateView.date = updateDate

        var isFailed = certificate.transferCode?.state == .failed
        var hasTransferError = false
        if let cachedResult = cachedResult,
           case let .failure(error) = cachedResult,
           !error.isRecovarable {
            isFailed = true
            hasTransferError = true
        }

        nameView.text = !isFailed ? UBLocalized.wallet_transfer_code_state_waiting : UBLocalized.wallet_transfer_code_state_expired

        // visibility changes
        failedImageContainerView.ub_setHidden(!isFailed)
        animationView.ub_setHidden(isFailed)
        // if we have a transfer error the errorCode is directly shown in the state view
        errorLabel.ub_setHidden(error == nil || hasTransferError)
        refreshView.ub_setHidden(error == nil || isFailed)
        updateView.ub_setHidden(error != nil || isFailed)
        failedExplanatoryView.ub_setHidden(certificate.transferCode?.state != .failed)

        // notificationview
        UBPushManager.shared.queryPushPermissions { [weak self] enabled in
            guard let strongSelf = self else { return }
            strongSelf.notificationDisabledView.isHidden = enabled
        }
    }

    private func removeTransfer() {
        let alert = UIAlertController(title: nil, message: UBLocalized.wallet_transfer_delete_confirm_text, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: UBLocalized.delete_button, style: .destructive, handler: { _ in
            CertificateStorage.shared.userCertificates = CertificateStorage.shared.userCertificates.filter { $0.transferCode != self.certificate.transferCode }
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: UBLocalized.cancel_button, style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}
