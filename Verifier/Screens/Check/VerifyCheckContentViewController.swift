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
import Foundation

class VerifyCheckContentViewController: ViewController {
    private let stackScrollView = StackScrollView()
    private let okButton = Button(title: UBLocalized.ok_button, style: .normal(.cc_blue))

    private let loadingView = VerifyLoadingView()
    private let statusView = VerifyStatusView()
    private let infoView = VerifyInfoView()
    private let infoErrorView1 = VerifyInfoView()
    private let infoErrorView2 = VerifyInfoView()
    private let errorLabel = Label(.smallErrorLight, textAlignment: .right)

    private let holderView = VerifyNameBirthdayView()

    public var okButtonTouchUpCallback: (() -> Void)?
    public var dismissCallback: ((CGFloat) -> Void)?

    private var originalPosition: CGPoint = .zero
    private var currentPositionTouched: CGPoint = .zero

    public var state: VerificationState? {
        didSet { update(true) }
    }

    public var holder: DGCHolder? {
        didSet { update(true) }
    }

    public var retryButtonCallback: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupButton()
        setupStateViews()
        setupInfoBoxes()

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }

    @objc func panGestureAction(_ panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: view)

        if panGesture.state == .began {
            originalPosition = view.frame.origin
            currentPositionTouched = panGesture.location(in: view)
        } else if panGesture.state == .changed {
            view.transform = CGAffineTransform(translationX: 0.0, y: max(0.0, translation.y))
            dismissCallback?(max(0.0, min(1.0, translation.y / view.frame.size.height)))
        } else if panGesture.state == .ended {
            let velocity = panGesture.velocity(in: view).y

            if velocity >= 1200 || translation.y > 0.5 * view.frame.size.height {
                let points = max(0.0, view.frame.size.height - translation.y)
                let duration = points / velocity

                UIView.animate(withDuration: TimeInterval(min(0.2, duration)), delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction, .curveEaseInOut]) {
                    self.view.transform = CGAffineTransform(translationX: 0.0, y: self.view.frame.size.height)
                } completion: { _ in
                    self.dismissCallback?(1.0)
                }
            } else {
                let points = max(0.0, translation.y)
                let duration = points / velocity

                UIView.animate(withDuration: TimeInterval(min(0.2, duration)), delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction, .curveEaseInOut]) {
                    self.view.transform = .identity
                    self.dismissCallback?(0.0)
                } completion: { _ in }
            }
        }
    }

    private func setupView() {
        view.backgroundColor = .white

        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        view.layer.mask = maskLayer
    }

    private func setupStateViews() {
        // title View
        let label = Label(.uppercaseBold, textAlignment: .center)
        label.text = UBLocalized.covid_certificate_title

        view.addSubview(label)

        let lr = Padding.large - Padding.small
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Padding.medium)
            make.left.right.equalToSuperview().inset(lr)
        }

        // content view
        view.addSubview(stackScrollView)

        stackScrollView.scrollView.alwaysBounceVertical = false
        stackScrollView.stackView.spacing = Padding.small
        stackScrollView.stackView.isLayoutMarginsRelativeArrangement = true
        let p = Padding.medium + Padding.small
        stackScrollView.stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: p, bottom: 0.0, right: p)

        stackScrollView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(Padding.medium - 2.0)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.okButton.snp.top).offset(-p)
        }

        stackScrollView.addArrangedView(loadingView)
        stackScrollView.addArrangedView(infoErrorView1)
        stackScrollView.addArrangedView(infoErrorView2)
        stackScrollView.addArrangedView(statusView)
        stackScrollView.addArrangedView(infoView)
        stackScrollView.addArrangedView(errorLabel)

        infoErrorView1.ub_setHidden(true)
        infoErrorView2.ub_setHidden(true)
        statusView.ub_setHidden(true)
        infoView.ub_setHidden(true)
        errorLabel.ub_setHidden(true)

        let v = UIView()
        v.addSubview(holderView)

        holderView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: Padding.large + Padding.small, left: p, bottom: p, right: p))
        }

        stackScrollView.addArrangedView(v)

        infoView.retryTouchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.retryButtonCallback?()
        }
    }

    private func setupInfoBoxes() {
        infoErrorView1.set(text: UBLocalized.verifier_verify_success_info_for_certificate_valid, backgroundColor: .cc_greyish, icon: UIImage(named: "ic-privacy-gray"), showReloadButton: false)

        infoErrorView2.set(text: UBLocalized.verifier_verify_success_info_for_blacklist, backgroundColor: .cc_greyish, icon: UIImage(named: "ic-check-gray"), showReloadButton: false)
    }

    private func setupButton() {
        okButton.touchUpCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.okButtonTouchUpCallback?()
        }

        view.addSubview(okButton)

        okButton.snp.makeConstraints { make in
            make.left.greaterThanOrEqualToSuperview().inset(Padding.medium)
            make.right.lessThanOrEqualToSuperview().inset(Padding.medium)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualToSuperview().multipliedBy(0.5).priority(.medium)

            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
            if bottomPadding > 0 {
                make.bottom.equalTo(self.view.snp.bottomMargin).inset(Padding.medium)
            } else {
                make.bottom.equalToSuperview().inset(Padding.large)
            }
        }
    }

    private func update(_ animated: Bool) {
        // content changes
        holderView.holder = holder
        errorLabel.text = nil

        switch state {
        case .loading:
            loadingView.rotate()
        case .success:
            statusView.set(text: NSAttributedString(string: UBLocalized.verifier_verify_success_title), backgroundColor: .cc_greenish, icon: UIImage(named: "ic-check"))
            infoView.set(text: UBLocalized.verifier_verify_success_info, backgroundColor: .cc_blueish, icon: UIImage(named: "ic-info-outline")?.ub_image(with: .cc_blue), showReloadButton: false)
        case let .invalid(errors, errorCodes, _):
            let color: UIColor = .cc_redish

            let (signatureError, revocationError, nationalError) = state?.getVerifierErrorState() ?? (nil, nil, nil)

            // errors can never be empty in invalid state, therefore one optional will always safely unwrap
            let text: NSAttributedString = signatureError?.displayName() ?? revocationError?.displayName() ?? nationalError?.displayName() ?? errors.first?.displayName() ?? NSAttributedString(string: "")

            statusView.set(text: text, backgroundColor: color, icon: UIImage(named: "ic-info-alert-red"))

            let codes = errorCodes.joined(separator: ", ")
            if codes.count > 0 {
                errorLabel.text = codes
            }

        case let .retry(error, errorCodes):
            let color: UIColor = .cc_orangish
            let imageName = error == .noInternetConnection ? "ic-nocon" : "ic-error-orange"

            statusView.set(text: NSAttributedString(string: error.displayTitle()), backgroundColor: color, icon: UIImage(named: imageName))
            infoView.set(text: error.displayText(), backgroundColor: color, icon: UIImage(named: "ic-info-outline")?.ub_image(with: .cc_orange), showReloadButton: true)

            let codes = errorCodes.joined(separator: ", ")
            if codes.count > 0 {
                errorLabel.text = codes
            }

        case .none:
            break
        }

        // animations
        let actions = {
            switch self.state {
            case .loading:
                self.loadingView.rotate()

                self.loadingView.ub_setHidden(false)
                self.statusView.ub_setHidden(true)
                self.infoView.ub_setHidden(true)
                self.errorLabel.ub_setHidden(true)
                self.infoErrorView1.ub_setHidden(true)
                self.infoErrorView2.ub_setHidden(true)
            case .success:
                self.loadingView.stopRotation()

                self.loadingView.ub_setHidden(true)
                self.statusView.ub_setHidden(false)
                self.infoView.ub_setHidden(false)
                self.errorLabel.ub_setHidden(true)
                self.infoErrorView1.ub_setHidden(true)
                self.infoErrorView2.ub_setHidden(true)

            case .invalid:

                let (signatureError, revocationError, _) = self.state?.getVerifierErrorState() ?? (nil, nil, nil)

                let showInfo1 = signatureError == nil
                let showInfo2 = showInfo1 && revocationError == nil
                self.loadingView.stopRotation()

                self.loadingView.ub_setHidden(true)
                self.statusView.ub_setHidden(false)
                self.infoView.ub_setHidden(true)
                self.infoErrorView1.ub_setHidden(!showInfo1)
                self.infoErrorView2.ub_setHidden(!showInfo2)
                self.errorLabel.ub_setHidden(false)

            case .retry:
                self.loadingView.stopRotation()

                self.loadingView.ub_setHidden(true)
                self.statusView.ub_setHidden(false)
                self.infoView.ub_setHidden(false)
                self.infoErrorView1.ub_setHidden(true)
                self.infoErrorView2.ub_setHidden(true)
                self.errorLabel.ub_setHidden(false)
            default:
                break
            }

            self.stackScrollView.stackView.layoutIfNeeded()
            self.view.layoutIfNeeded()
        }

        if animated {
            UIView.animate(withDuration: 0.25) {
                actions()
            }
        } else {
            actions()
        }
    }
}

class VerifyNameBirthdayView: UIView {
    // MARK: - Title View

    private class TitleView: UIView {
        public let titleLabel = Label(.title)
        public let descriptionLabel = Label(.text)

        init() {
            super.init(frame: .zero)
            setup()

            isAccessibilityElement = true
        }

        @available(*, unavailable)
        required init?(coder _: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setup() {
            addSubview(titleLabel)
            addSubview(descriptionLabel)
            titleLabel.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
            }

            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(1.0)
                make.bottom.left.right.equalToSuperview()
            }
        }

        override var accessibilityLabel: String? {
            get { return [titleLabel.accessibilityLabel, descriptionLabel.accessibilityLabel].compactMap { $0 }.joined(separator: ", ") }
            set { super.accessibilityLabel = newValue }
        }
    }

    // MARK: - Subviews

    private let stackView = UIStackView()
    private let nameView = TitleView()
    private let lastNameView = TitleView()
    private let birthdayView = TitleView()

    private let monoLabel = Label(.monospaced)

    // MARK: - Holder

    public var holder: DGCHolder? {
        didSet {
            nameView.titleLabel.text = holder?.healthCert.displayName
            lastNameView.titleLabel.text = holder?.healthCert.displayLastName
            birthdayView.titleLabel.text = holder?.healthCert.displayBirthDate
            monoLabel.text = holder?.healthCert.displayMonospacedName
        }
    }

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()

        nameView.descriptionLabel.text = UBLocalized.verifier_covid_certificate_prename
        lastNameView.descriptionLabel.text = UBLocalized.verifier_covid_certificate_name
        birthdayView.descriptionLabel.text = UBLocalized.verifier_covid_certificate_birthdate

        accessibilityElements = [lastNameView, nameView, birthdayView, monoLabel]
        isAccessibilityElement = false
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 2.0 * Padding.medium

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.addArrangedView(lastNameView)
        stackView.addArrangedView(nameView)
        stackView.addArrangedView(birthdayView)
        stackView.addArrangedView(monoLabel)
    }
}
