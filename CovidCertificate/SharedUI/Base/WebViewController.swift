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
import WebKit

class WebViewController: ViewController {
    // MARK: - Variables

    private let webView: WKWebView
    private var loadCount: Int = 0
    private let closeable: Bool
    private let mode: Mode

    enum Mode {
        case local(String)
    }

    // MARK: - Init

    init(mode: Mode, closeable: Bool = true) {
        self.mode = mode
        self.closeable = closeable

        let config = WKWebViewConfiguration()
        config.dataDetectorTypes = []

        switch mode {
        case .local:
            // Disable zoom in web view
            let source: String = "var meta = document.createElement('meta');" +
                "meta.name = 'viewport';" +
                "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
                "var head = document.getElementsByTagName('head')[0];" + "head.appendChild(meta);"
            let script = WKUserScript(source: source, injectionTime: .atDocumentEnd,
                                      forMainFrameOnly: true)

            let contentController = WKUserContentController()
            contentController.addUserScript(script)
            config.userContentController = contentController
        }

        webView = WKWebView(frame: .zero, configuration: config)

        super.init()
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        switch mode {
        case let .local(local):
            loadLocal(local)
        }

        if closeable {
            addDismissButton()
        }
    }

    private func loadLocal(_ local: String) {
        guard let path = Bundle.main.path(forResource: local, ofType: "html", inDirectory: "Impressum/\(String.languageKey)/")
        else { return }

        let url = URL(fileURLWithPath: path)

        do {
            var string = try String(contentsOf: url)

            string = string.replacingOccurrences(of: "{VERSION}", with: Bundle.appVersion)
            string = string.replacingOccurrences(of: "{BUILD}", with: Bundle.buildNumber + Bundle.environment)
            string = string.replacingOccurrences(of: "{APPVERSION}", with: Bundle.appVersion)
            string = string.replacingOccurrences(of: "{RELEASEDATE}", with: DateFormatter.ub_dayString(from: Bundle.buildDate ?? Date()))

            #if VERIFIER
                string = string.replacingOccurrences(of: "{APP_NAME}", with: UBLocalized.verifier_app_title)
                string = string.replacingOccurrences(of: "{LAW_LINK}", with: UBLocalized.verifier_terms_privacy_link)
            #elseif WALLET
                string = string.replacingOccurrences(of: "{APP_NAME}", with: UBLocalized.wallet_onboarding_app_title)
                string = string.replacingOccurrences(of: "{LAW_LINK}", with: UBLocalized.wallet_terms_privacy_link)
            #endif

            webView.loadHTMLString(string, baseURL: url.deletingLastPathComponent())
        } catch {}
    }

    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Setup

    private func setup() {
        webView.navigationDelegate = self
        webView.scrollView.delegate = self
        webView.scrollView.showsHorizontalScrollIndicator = false

        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.backgroundColor = UIColor.cc_background

        webView.isOpaque = false
        webView.backgroundColor = UIColor.clear
    }

    // MARK: - Navigation

    @objc private func didPressClose() {
        dismiss(animated: true, completion: nil)
    }
}

extension WebViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Disable vertical scrolling
        scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        switch navigationAction.navigationType {
        case .linkActivated:
            guard let url = navigationAction.request.url,
                  let scheme = url.scheme
            else {
                decisionHandler(.allow)
                return
            }

            if scheme == "http" || scheme == "https" || scheme == "mailto" || scheme == "tel" {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                decisionHandler(.cancel)
                return
            }

            if scheme == "ccert" {
                let path = (url.host ?? url.lastPathComponent).replacingOccurrences(of: ".html", with: "")
                let webVC = WebViewController(mode: .local(path))
                webVC.title = title
                if let navVC = navigationController {
                    navVC.pushViewController(webVC, animated: true)
                } else {
                    present(NavigationController(rootViewController: webVC, useNavigationBar: true), animated: true, completion: nil)
                }

                decisionHandler(.cancel)
                return
            }

            decisionHandler(.allow)
            return

        default:
            decisionHandler(.allow)
            return
        }
    }
}

extension Bundle {
    static var environment: String {
        #if ENABLE_TESTING
            switch Environment.current {
            case .dev:
                return " DEV"
            case .abnahme:
                return " ABNAHME"
            case .prod:
                return " PROD"
            }
        #else
            switch Environment.current {
            case .dev:
                return " DEV"
            case .abnahme:
                return " ABNAHME"
            case .prod:
                return "p"
            }
        #endif
    }
}
