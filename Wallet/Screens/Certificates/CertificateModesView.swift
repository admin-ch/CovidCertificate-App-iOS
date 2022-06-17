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
import UIKit

class CertificateModeView: UIView {
    // MARK: - Subviews

    private let modeView = ModeStackView(itemHeight: 18.0, validColor: .cc_blue, invalidColor: .cc_grey)
    public let button = UBButton()

    // MARK: - Modes

    var states: (state: VerificationState, temporaryVerifierState: TemporaryVerifierState) = (.loading, .idle) {
        didSet { update(animated: true) }
    }

    private var modeResults: ModeResults? {
        didSet {
            modeView.modeResults = modeResults
            button.isHidden = modeResults == nil || (modeResults?.results.count ?? 0) <= 1
            isAccessibilityElement = !button.isHidden
        }
    }

    public func infoImageTexts(size: CGFloat) -> [IconText] {
        var result: [IconText] = []

        let modes = Verifier.currentModes()

        for m in modes {
            if let r = modeResults?.getResult(for: m) {
                switch r {
                case let .success(r):
                    var isValid = r.isValid

                    // 2G+: show "invalid" as a second certificate is needed
                    if r.code.is2GPlusSuccessWithAnotherCertificate {
                        isValid = false
                    }

                    let img = CheckModesHelper.image(for: m.id, isValid: isValid, size: size, validColor: UIColor.cc_blue, invalidColor: UIColor.cc_grey)
                    let text = CheckModesHelper.text(for: m.id, isValid: isValid)

                    if let i = img, let t = text {
                        let acc = Verifier.currentModes().first { $0.id == m.id }?.displayName
                        result.append(IconText(text: t, icon: i, iconAccessibility: acc))
                    }
                case .failure:
                    break
                }
            }
        }

        return result
    }

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()

        isAccessibilityElement = true
        accessibilityTraits = .button
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Accessibility

    override public var accessibilityLabel: String? {
        set(value) { super.accessibilityLabel = value }
        get { return modeView.accessibilityLabel }
    }

    // MARK: - Setup

    private func update(animated: Bool) {
        let actions = {
            switch self.states.temporaryVerifierState {
            case let .success(_, modeResults):
                self.modeResults = modeResults
            case .failure, .retry, .verifying:
                self.modeResults = nil
            case .idle:
                switch self.states.state {
                case .loading, .skipped, .invalid, .retry:
                    self.modeResults = nil
                case let .success(_, _, results, _, _):
                    guard let r = results, r.results.count > 1 else {
                        self.modeResults = nil
                        return
                    }

                    self.modeResults = r
                }
            }
        }

        if animated {
            UIView.animate(withDuration: 0.2) {
                actions()
            }
        } else {
            actions()
        }
    }

    private func setup() {
        let dashedLine = DashedLineView()
        addSubview(dashedLine)

        dashedLine.snp.makeConstraints { make in
            make.centerY.left.right.equalToSuperview()
        }

        addSubview(button)
        button.backgroundColor = UIColor.cc_white
        button.highlightedBackgroundColor = .cc_touchState
        button.layer.borderColor = UIColor.cc_line.cgColor
        button.layer.borderWidth = 2.0

        addSubview(modeView)
        modeView.isUserInteractionEnabled = false

        modeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(Padding.small)
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }

        button.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalTo(modeView).inset(-Padding.medium)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let h = bounds.size.height
        button.layer.cornerRadius = h * 0.5
        button.highlightCornerRadius = h * 0.5
    }
}

public class ModeStackView: UIView {
    // MARK: - Subviews

    private let stackView = UIStackView()
    private let itemHeight: CGFloat

    private let validColor: UIColor
    private let invalidColor: UIColor

    // MARK: - Modes

    public var modeResults: ModeResults? {
        didSet { updateModes() }
    }

    // MARK: - Init

    init(itemHeight: CGFloat, validColor: UIColor, invalidColor: UIColor) {
        self.itemHeight = itemHeight
        self.validColor = validColor
        self.invalidColor = invalidColor
        super.init(frame: .zero)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Update

    private func updateModes() {
        for s in stackView.subviews {
            stackView.removeArrangedSubview(s)
            s.removeFromSuperview()
        }

        if (modeResults?.results.count ?? 0) <= 1 {
            accessibilityLabel = ""
            return
        }

        let modes = Verifier.currentModes()

        var accessibilityLabels: [String] = []

        for m in modes {
            if let r = modeResults?.getResult(for: m) {
                switch r {
                case let .success(r):
                    var isValid = r.isValid

                    // 2G+: show "invalid" as a second certificate is needed
                    if r.code.is2GPlusSuccessWithAnotherCertificate {
                        isValid = false
                    }

                    let view = ModeIconView(mode: m.id, isValid: isValid, size: itemHeight, validColor: validColor, invalidColor: invalidColor)
                    stackView.addArrangedSubview(view)

                    if let t = Verifier.currentModes().first(where: { $0.id == m.id })?.displayName {
                        accessibilityLabels.append(t)
                    }

                    view.snp.makeConstraints { make in
                        make.height.equalTo(itemHeight)
                    }
                case .failure:
                    break
                }
            }
        }

        accessibilityLabel = accessibilityLabels.joined(separator: ",")
        accessibilityTraits = .button
    }

    private func setup() {
        stackView.spacing = itemHeight / 2.0

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
        }
    }
}

private class ModeIconView: UIView {
    private let imageView = UIImageView()

    init(mode: String, isValid: Bool, size: CGFloat, validColor: UIColor, invalidColor: UIColor) {
        super.init(frame: .zero)
        imageView.image = CheckModesHelper.image(for: mode, isValid: isValid, size: size, validColor: validColor, invalidColor: invalidColor)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        guard let i = imageView.image else {
            return
        }

        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(imageView.snp.width).multipliedBy(i.size.height / i.size.width)
        }
    }
}
