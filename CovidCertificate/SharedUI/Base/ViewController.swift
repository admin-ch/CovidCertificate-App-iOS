/*
 * Copyright (c) 2021 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

import SnapKit
import UIKit

class ViewController: UIViewController {
    // MARK: - Init

    private var hasDismissButton = false

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, message: "unavailable")
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Present

    func presentInNavigationController(from rootViewController: UIViewController) {
        let navCon = NavigationController(rootViewController: self, useNavigationBar: true)

        if UIDevice.current.isSmallScreenPhone {
            navCon.modalPresentationStyle = .fullScreen
        }

        rootViewController.present(navCon, animated: true, completion: nil)
    }

    @objc func dismissAction() {
        dismiss(animated: true, completion: nil)
    }

    func addDismissButton() {
        hasDismissButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-close")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(dismissAction))
        navigationItem.rightBarButtonItem?.accessibilityLabel = UBLocalized.accessibility_close_button
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cc_background
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)

        if hasDismissButton {
            if (navigationController?.viewControllers.count ?? 0) > 1 {
                navigationItem.rightBarButtonItem = nil
            } else {
                addDismissButton()
            }
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
            navigationController?.navigationBar.titleTextAttributes = [
                .font: LabelType.textBold.font,
                .foregroundColor: UIColor.cc_text,
            ]
        }
    }

    public func addSubviewController(_ vc: UIViewController, constraints: ((_ make: ConstraintMaker) -> Void) = { $0.edges.equalToSuperview() }) {
        addChild(vc)
        view.addSubview(vc.view)
        vc.view.snp.makeConstraints(constraints)
        vc.didMove(toParent: self)
    }
}
