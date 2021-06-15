/*
 * Copyright (c) 2021 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

class NavigationController: UINavigationController {
    // MARK: - Views

    let lineView = UIView()
    var useNavigationBar: Bool = true

    // MARK: - Init

    init(rootViewController: UIViewController, useNavigationBar: Bool = false) {
        super.init(rootViewController: rootViewController)
        self.useNavigationBar = useNavigationBar
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        // empty implemented for iOS 12.0
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Loading

    override func viewDidLoad() {
        // is called during init(), as rootViewController gets added
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // hide navigation bar correctly
        if !useNavigationBar {
            setNavigationBarHidden(true, animated: false)
        }
    }

    // MARK: - Setup

    private func setup() {
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = .white
        if #available(iOS 15.0, *) {
            navigationBar.backgroundColor = .white
        }
    }
}
