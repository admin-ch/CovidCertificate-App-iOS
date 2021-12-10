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

class HomescreenCertificatesViewController: ViewController {
    // MARK: - API

    public var touchedCertificateCallback: ((UserCertificate) -> Void)?

    // MARK: - Subviews

    private let stackScrollView = StackScrollView(axis: .horizontal, spacing: 0)
    private let pageControl = UIPageControl()
    private var certificateViews: [HomescreenCertificateView] = []

    private var certificateHints: [String: ConfigResponseBody.VaccinationHint] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupInteraction()

        UIStateManager.shared.addObserver(self) { [weak self] state in
            guard let strongSelf = self else { return }
            strongSelf.refresh(state.certificateState.certificates)
        }
    }

    private func setup() {
        view.backgroundColor = .clear

        view.addSubview(pageControl)

        stackScrollView.scrollView.isPagingEnabled = true
        view.addSubview(stackScrollView)

        stackScrollView.clipsToBounds = false
        stackScrollView.scrollView.clipsToBounds = false
        stackScrollView.stackView.clipsToBounds = false
        stackScrollView.scrollView.delegate = self
    }

    private func setupInteraction() {
        pageControl.addTarget(self, action: #selector(handlePageChange), for: .valueChanged)
    }

    @objc private func handlePageChange() {
        let width = stackScrollView.scrollView.frame.width

        stackScrollView.scrollView.delegate = nil
        UIView.animate(withDuration: 0.3) {
            self.stackScrollView.scrollView.setContentOffset(CGPoint(x: width * CGFloat(self.pageControl.currentPage), y: 0.0), animated: false)
        } completion: { _ in
            self.stackScrollView.scrollView.delegate = self
        }
    }

    private func refresh(_ certificates: [UserCertificate]) {
        stackScrollView.removeAllViews()

        certificateViews.removeAll()

        let oldNumberOfPages = pageControl.numberOfPages
        pageControl.numberOfPages = certificates.count
        pageControl.alpha = certificates.count <= 1 ? 0.0 : 1.0

        let isSmall = view.frame.size.width <= 375
        let pageControlBottomPadding = isSmall ? Padding.large : (Padding.large + Padding.medium)

        pageControl.snp.remakeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(pageControlBottomPadding)
        }

        stackScrollView.snp.remakeConstraints { make in
            make.left.right.equalToSuperview().inset(Padding.large - HomescreenCertificateView.inset)
            make.top.equalToSuperview()
            if certificates.count <= 1 {
                make.bottom.equalToSuperview().inset(pageControlBottomPadding + Padding.medium)
            } else {
                make.bottom.equalTo(self.pageControl.snp.top).offset(-Padding.medium)
            }
        }

        for c in certificates {
            var vaccinationHint = ConfigManager.currentConfig?.randomVaccinationInfoHint

            if let code = c.transferCode?.transferCode {
                if let hint = certificateHints[code] {
                    vaccinationHint = hint
                } else {
                    certificateHints[code] = vaccinationHint
                }
            }
            let v = HomescreenCertificateView(certificate: c, vaccinationHint: vaccinationHint)
            stackScrollView.addArrangedView(v)
            certificateViews.append(v)

            v.snp.makeConstraints { make in
                make.width.equalTo(stackScrollView)
            }

            v.touchUpCallback = { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.touchedCertificateCallback?(c)
            }

            v.vaccinationButtonTouchUpCallback = { [weak self] in
                guard let strongSelf = self else { return }
                let vc = VaccinationInformationViewController()
                vc.presentInNavigationController(from: strongSelf)
            }

            v.dismissedVaccinationHintTouchUpCallback = { [weak self] in
                guard let strongSelf = self else { return }
                WalletUserStorage.shared.lastVaccinationHintDismissal = Date()
                strongSelf.dismissAllVaccinationHints()
            }
        }

        // If there are more certificates than before, i.e. a certificate has been added,
        // scroll to the beginning (since new certificate are inserted at the beginning)
        if oldNumberOfPages < certificates.count {
            stackScrollView.scrollView.setContentOffset(.zero, animated: false)
            scrollViewDidScroll(stackScrollView.scrollView)
        }

        startChecks()
    }

    private func dismissAllVaccinationHints() {
        for certificateView in certificateViews {
            certificateView.dismissVaccinationHint()
        }
    }

    private func startChecks() {
        for i in certificateViews {
            if let lightQrCode = i.certificate?.lightCertificate?.certificate {
                VerifierManager.shared.addObserver(self, for: lightQrCode, modes: Verifier.currentModes()) { [weak i] state in
                    i?.verificationState = state
                }
            } else if let qrCode = i.certificate?.qrCode {
                VerifierManager.shared.addObserver(self, for: qrCode, modes: Verifier.currentModes()) { [weak i] state in
                    i?.verificationState = state
                }
            } else if let transferCode = i.certificate?.transferCode,
                      transferCode.state != .failed // only start when not already failed
            {
                TransferManager.shared.addObserver(self, for: transferCode.transferCode) { [weak i] result in
                    guard let strongI = i else { return }
                    switch result {
                    case .success:
                        // TransferManager adds all the certificates
                        strongI.transferError = nil
                    case let .failure(error):
                        strongI.transferError = error
                    }
                }
            }
        }
    }
}

extension HomescreenCertificatesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = pageControl.currentPage
        let currentScrollPage = scrollView.currentPage

        if currentPage != currentScrollPage {
            pageControl.currentPage = currentScrollPage
        }
    }
}

extension UIScrollView {
    var currentPage: Int {
        guard frame.width > 0.0 else { return 0 }
        return Int((contentOffset.x + 0.5 * frame.size.width) / frame.width)
    }
}
