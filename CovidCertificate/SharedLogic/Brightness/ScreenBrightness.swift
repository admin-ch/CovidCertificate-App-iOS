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

/// A helper class for the screen brightness.
///
/// This object SHOULD be kept alive as long as the view that requires a brightness change is still
/// visible. Set this object to nil to restore the previous brightness.
///
/// This object WILL also restore the initial brightness when the app resigns active and WILL set it
/// to the target brightness when the app becomes active again.
final class ScreenBrightness: NSObject {
    private var targetBrightness: CGFloat

    private var originalBrightness: CGFloat

    deinit {
        NotificationCenter.default.removeObserver(self)
        ScreenBrightnessAnimator.shared.setBrightness(to: self.originalBrightness, animated: true)
    }

    init(targetBrightness: CGFloat, currentBrightness: CGFloat = UIScreen.main.brightness) {
        originalBrightness = currentBrightness
        self.targetBrightness = max(currentBrightness, targetBrightness)
        super.init()

        NotificationCenter.default.addObserver(self, selector: #selector(restoreOriginalBrightness),
                                               name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(restoreOriginalBrightness),
                                               name: UIApplication.willTerminateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applyTargetBrightness),
                                               name: UIApplication.didBecomeActiveNotification, object: nil)

        ScreenBrightnessAnimator.shared.setBrightness(to: self.targetBrightness, animated: true)
    }

    @objc private func restoreOriginalBrightness() {
        ScreenBrightnessAnimator.shared.setBrightness(to: originalBrightness, animated: false)
    }

    @objc private func applyTargetBrightness() {
        originalBrightness = currentBrightness
        targetBrightness = max(currentBrightness, targetBrightness)
        ScreenBrightnessAnimator.shared.setBrightness(to: targetBrightness, animated: true)
    }

    private var currentBrightness: CGFloat {
        return UIScreen.main.brightness
    }
}

// MARK: - Aninmator

private final class ScreenBrightnessAnimator {
    static let shared = ScreenBrightnessAnimator()

    /// The step of brightness change
    private let brightnessAnimationStep: CGFloat = 0.02

    /// The interval at which the brightness will change
    private let brightnessAnimationInterval: TimeInterval = 0.01

    /// The timer that will act as a stepper for the animation
    private var timer: Timer?

    /// The target brightness to reach
    private var targetBrightness: CGFloat = UIScreen.main.brightness

    deinit {
        self.timer?.invalidate()
    }

    private init() {}

    func setBrightness(to value: CGFloat, animated: Bool) {
        timer?.invalidate()
        targetBrightness = value

        if animated {
            timer = Timer.scheduledTimer(timeInterval: brightnessAnimationInterval,
                                         target: self,
                                         selector: #selector(setBrightnessIncrementally),
                                         userInfo: nil, repeats: true)
        } else {
            UIScreen.main.brightness = value
        }
    }

    @objc private func setBrightnessIncrementally() {
        if needsNextStep {
            applyNextStep()
        } else {
            finish()
        }
    }

    private var needsNextStep: Bool {
        let nextStepValue = abs(UIScreen.main.brightness - targetBrightness)
        return nextStepValue > brightnessAnimationStep
    }

    private func applyNextStep() {
        assert(needsNextStep)

        // Calculate the difference according to the step specified and set it
        let delta = UIScreen.main.brightness > targetBrightness ? -brightnessAnimationStep : brightnessAnimationStep
        UIScreen.main.brightness += delta
    }

    private func finish() {
        timer?.invalidate()
        UIScreen.main.brightness = targetBrightness
    }
}
