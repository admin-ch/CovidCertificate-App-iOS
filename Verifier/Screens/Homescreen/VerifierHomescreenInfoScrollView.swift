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

class VerifierHomescreenInfoViewController: UIView {
    private let stackScrollView = StackScrollView(axis: .horizontal, spacing: 0)
    private let pageControl = UIPageControl()

    init() {
        super.init(frame: .zero)
        setup()
        setupInteraction()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(pageControl)

        pageControl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(Padding.medium)
        }

        stackScrollView.scrollView.isPagingEnabled = true
        addSubview(stackScrollView)

        stackScrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(self.pageControl.snp.top).offset(-Padding.small)
        }

        pageControl.numberOfPages = 2

        let image1 = UIImage(named: "illu-home-step-1")
        let v1 = InfoView(text: UBLocalized.verifier_homescreen_pager_description_1, image: image1)
        stackScrollView.addArrangedView(v1)

        v1.snp.makeConstraints { make in
            make.width.equalTo(stackScrollView)
        }

        let image2 = UIImage(named: "illu-home-step-2")
        let v2 = InfoView(text: UBLocalized.verifier_homescreen_pager_description_2, image: image2)
        stackScrollView.addArrangedView(v2)

        v2.snp.makeConstraints { make in
            make.width.equalTo(stackScrollView)
        }

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
}

extension VerifierHomescreenInfoViewController: UIScrollViewDelegate {
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
        return Int((contentOffset.x + 0.5 * frame.size.width) / frame.width)
    }
}

private class InfoView: UIView {
    public let imageView: UIImageView
    private let textLabel: Label

    init(text: String, image: UIImage?) {
        imageView = UIImageView(image: image)
        textLabel = Label(.text, textColor: UIColor(ub_hexString: "#2e2e2e"), textAlignment: .center)
        textLabel.text = text
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(textLabel)

        let inset = Padding.large + Padding.medium

        textLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(inset)
        }

        let ratio = (imageView.image?.size.width ?? 1.0) / (imageView.image?.size.height ?? 1.0)

        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.lessThanOrEqualToSuperview().inset(inset)
            make.left.greaterThanOrEqualToSuperview().inset(inset)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.textLabel.snp.top).offset(-Padding.medium)
            make.width.equalTo(self.imageView.snp.height).multipliedBy(ratio).priority(.required)
        }

        imageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

        textLabel.ub_setContentPriorityRequired()
    }
}
