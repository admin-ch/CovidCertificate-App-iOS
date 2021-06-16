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

class TransferCodeNextStepsViewController: StackScrollViewController {
    private let transferCodeStatusView = TransferCodeStatusView()

    private let insets = UIEdgeInsets(top: 0, left: 2 * Padding.medium, bottom: 0, right: 2 * Padding.medium)

    private let loadingView = LoadingView()

    private let doneContainer = UIView()
    private let doneButton = Button(title: UBLocalized.wallet_transfer_code_done_button)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        // Done button
        doneContainer.backgroundColor = .cc_background
        doneContainer.ub_addShadow(radius: 8, opacity: 0.3, xOffset: 0, yOffset: 0)

        doneContainer.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-self.view.safeAreaInsets.bottom)
        }

        view.addSubview(doneContainer)
        doneContainer.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(80 + self.view.safeAreaInsets.bottom)
        }

        doneButton.contentEdgeInsets = UIEdgeInsets(top: Padding.medium, left: 2 * Padding.large, bottom: Padding.medium, right: 2 * Padding.large)
        doneButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismiss(animated: true, completion: nil)
        }

        // Content
        stackScrollView.stackView.alignment = .fill
        stackScrollView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(doneContainer.snp.top)
        }

        stackScrollView.addSpacerView(2 * Padding.medium)
        let title = Label(.title, textAlignment: .center)
        title.text = UBLocalized.wallet_transfer_code_code_created_title
        addArrangedView(title, insets: insets)
        stackScrollView.addSpacerView(3 * Padding.medium)
        addArrangedView(transferCodeStatusView, insets: insets)
        stackScrollView.addSpacerView(40)
        let subtitle = Label(.textBoldLarge, textAlignment: .left)
        subtitle.text = UBLocalized.wallet_transfer_code_next_steps
        addArrangedView(subtitle, insets: insets)
        stackScrollView.addSpacerView(2 * Padding.medium)

        let step1 = OnboardingInfoView(icon: UIImage(named: "ic-write"), text: UBLocalized.wallet_transfer_code_next_steps1, alignment: .left)
        addArrangedView(step1)
        stackScrollView.addSpacerView(Padding.large)

        let step2 = OnboardingInfoView(icon: UIImage(named: "ic-info-outline")?.ub_image(with: .cc_blue), text: UBLocalized.wallet_transfer_code_next_steps2, alignment: .left)
        addArrangedView(step2)
        stackScrollView.addSpacerView(2 * Padding.medium)

        // Loading view
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func startLoading() {
        loadingView.startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.stopLoading()
        }
    }

    func stopLoading() {
        loadingView.stopLoading()
    }

    override func viewSafeAreaInsetsDidChange() {
        doneButton.snp.updateConstraints { make in
            make.centerY.equalToSuperview().offset(-self.view.safeAreaInsets.bottom / 2.0)
        }

        doneContainer.snp.updateConstraints { make in
            make.height.equalTo(80 + self.view.safeAreaInsets.bottom)
        }
    }
}

private class LoadingView: UIView {
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
        UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
            self.alpha = 1
        }, completion: nil)
        activityIndicator.startAnimating()
    }

    func stopLoading() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {
            self.alpha = 0
        }, completion: nil)
        activityIndicator.stopAnimating()
    }
}
