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

class OnboardingBaseViewController: ViewController {
    private let leftSwipeRecognizer = UISwipeGestureRecognizer()
    private let rightSwipeRecognizer = UISwipeGestureRecognizer()

    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))

    internal var stepViewControllers: [OnboardingContentViewController] {
        []
    }

    internal var stepsWithoutContinue: [Int] {
        []
    }

    internal var splashViewController: ViewController? {
        nil
    }

    internal var disableSwipeForwardScreens: [Int] {
        []
    }

    internal var disableSwipeBackToScreens: [Int] {
        []
    }

    internal var finalStepIndex: Int {
        0
    }

    private let continueContainer = UIView()
    private let continueButton = Button(titleKey: .continue_button, style: .normal(.cc_blue))

    private var currentStep: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cc_background

        setupButtons()

        setupSwipeRecognizers()
        addStepViewControllers()
        addSplashViewController()

        addStatusBarBlurView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setOnboardingStep(0, animated: true)
        startSplashCountDown()

        UIAccessibility.post(notification: .screenChanged, argument: stepViewControllers[currentStep].stackScrollView)
    }

    private func addSplashViewController() {
        guard let splashVC = splashViewController else { return }

        addChild(splashVC)
        view.addSubview(splashVC.view)
        splashVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func startSplashCountDown() {
        guard let splashVC = splashViewController else {
            blurView.alpha = 1
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            UIView.animate(withDuration: 0.5) {
                splashVC.view.alpha = 0
                self.blurView.alpha = 1
            }
        }
    }

    fileprivate func addStatusBarBlurView() {
        blurView.alpha = 0

        view.addSubview(blurView)

        let statusBarHeight: CGFloat
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }

        blurView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(statusBarHeight)
        }
    }

    internal func animateToNextStep() {
        setOnboardingStep(currentStep + 1, animated: true)
    }

    internal func setOnboardingStep(_ step: Int, animated: Bool) {
        guard step >= 0, step < stepViewControllers.count else { return }

        continueButton.isUserInteractionEnabled = false

        if stepsWithoutContinue.contains(step) {
            hideContinueButton()
        } else {
            showContinueButton()
        }

        let forward = step >= currentStep

        let vcToShow = stepViewControllers[step]
        vcToShow.view.isHidden = false

        vcToShow.view.setNeedsLayout()
        vcToShow.view.layoutIfNeeded()

        if animated {
            vcToShow.fadeAnimation(fromFactor: forward ? 1 : -1, toFactor: 0, delay: 0.2, completion: { completed in if completed {
                self.continueButton.isUserInteractionEnabled = true
            }
            })
        }

        if step > 0, forward {
            continueButton.titleKey = stepViewControllers[step].continueButtonTextKey

            let vcToHide = stepViewControllers[step - 1]
            vcToHide.fadeAnimation(fromFactor: 0, toFactor: -1, delay: 0.0, completion: { completed in
                if completed {
                    vcToHide.view.isHidden = true
                    self.continueButton.isUserInteractionEnabled = true
                }
            })
        } else if step < stepViewControllers.count - 1, !forward {
            continueButton.titleKey = stepViewControllers[step].continueButtonTextKey
            let vcToHide = stepViewControllers[step + 1]
            vcToHide.fadeAnimation(fromFactor: 0, toFactor: 1, delay: 0.0, completion: { completed in
                if completed {
                    vcToHide.view.isHidden = true
                    self.continueButton.isUserInteractionEnabled = true
                }
            })
        } else {
            continueButton.titleKey = vcToShow.continueButtonTextKey
            continueButton.isUserInteractionEnabled = true
        }

        vcToShow.view.setNeedsLayout()
        vcToShow.view.layoutIfNeeded()

        currentStep = step

        UIAccessibility.post(notification: .layoutChanged, argument: vcToShow.stackScrollView)
    }

    private func showContinueButton() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
            self.continueContainer.transform = .identity
            if self.currentStep != 0 {
                self.view.bringSubviewToFront(self.continueContainer)
            }
        }, completion: nil)
    }

    private func hideContinueButton() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
            self.continueContainer.transform = CGAffineTransform(translationX: 0, y: 130)
        }, completion: nil)
    }

    internal func finishAnimation() {
        completedOnboarding()
        dismiss(animated: true, completion: nil)
    }

    internal func completedOnboarding() {
        // use subclasses to override
    }

    private func setupButtons() {
        continueContainer.backgroundColor = .cc_background
        continueContainer.ub_addShadow(radius: 8, opacity: 0.3, xOffset: 0, yOffset: 0)

        continueContainer.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-self.view.safeAreaInsets.bottom)
        }

        view.addSubview(continueContainer)
        continueContainer.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(80 + self.view.safeAreaInsets.bottom)
        }

        continueButton.contentEdgeInsets = UIEdgeInsets(top: Padding.medium, left: 2 * Padding.large, bottom: Padding.medium, right: 2 * Padding.large)
        continueButton.touchUpCallback = { [weak self] in
            guard let self = self else { return }

            if self.currentStep == self.finalStepIndex {
                self.finishAnimation()
            } else {
                self.setOnboardingStep(self.currentStep + 1, animated: true)
            }
        }

        // initialize continue button to first text
        if let cbt = stepViewControllers.first?.continueButtonTextKey {
            continueButton.titleKey = cbt
        }
    }

    override func viewSafeAreaInsetsDidChange() {
        continueButton.snp.updateConstraints { make in
            make.centerY.equalToSuperview().offset(-self.view.safeAreaInsets.bottom / 2.0)
        }

        continueContainer.snp.updateConstraints { make in
            make.height.equalTo(80 + self.view.safeAreaInsets.bottom)
        }
    }

    private func setupSwipeRecognizers() {
        leftSwipeRecognizer.direction = .left
        leftSwipeRecognizer.addTarget(self, action: #selector(didSwipe(recognizer:)))
        view.addGestureRecognizer(leftSwipeRecognizer)

        rightSwipeRecognizer.direction = .right
        rightSwipeRecognizer.addTarget(self, action: #selector(didSwipe(recognizer:)))
        view.addGestureRecognizer(rightSwipeRecognizer)
    }

    private func addStepViewControllers() {
        for vc in stepViewControllers {
            addChild(vc)
            view.insertSubview(vc.view, belowSubview: continueContainer)
            vc.view.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.bottom.equalTo(continueContainer.snp.top)
            }
            vc.didMove(toParent: self)

            if vc != stepViewControllers.first {
                vc.view.isHidden = true
            }
        }
    }

    @objc private func didSwipe(recognizer: UISwipeGestureRecognizer) {
        if currentStep == finalStepIndex { // Completely disable swipe on last screen
            return
        }

        switch recognizer.direction {
        case .left:
            _ = didSwipeLeft()
        case .right:
            _ = didSwipeRight()
        default:
            break
        }
    }

    override func accessibilityScroll(_ direction: UIAccessibilityScrollDirection) -> Bool {
        if direction == .right {
            // Previous Page
            return didSwipeRight()
        } else if direction == .left {
            // next page
            return didSwipeLeft()
        }

        return true
    }

    private func didSwipeLeft() -> Bool {
        if let splashVC = splashViewController {
            guard splashVC.view.alpha == 0 else {
                return false
            }
        }

        if disableSwipeForwardScreens.contains(currentStep) {
            // Disable swipe forward on permission screens
            return false
        }
        setOnboardingStep(currentStep + 1, animated: true)
        return true
    }

    private func didSwipeRight() -> Bool {
        if let splashVC = splashViewController {
            guard splashVC.view.alpha == 0 else {
                return false
            }
        }

        // Disable swipe back to permission screens
        if disableSwipeBackToScreens.contains(currentStep - 1) {
            return false
        }

        setOnboardingStep(currentStep - 1, animated: true)

        return true
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.userInterfaceStyle != traitCollection.userInterfaceStyle {
            continueContainer.ub_addShadow(with: .cc_text, radius: 8, opacity: 0.3, xOffset: 0, yOffset: 0)
        }
    }
}
