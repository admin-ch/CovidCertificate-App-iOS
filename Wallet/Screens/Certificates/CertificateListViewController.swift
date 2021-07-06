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

class CertificateListViewController: ViewController {
    private static let certificateReuseIdentifier = "certificate.cell"
    private static let transferCodeReuseIdentifier = "transfercode.cell"

    private let tableView = UITableView(frame: .zero, style: .grouped)

    private var certificates: [UserCertificate] = []
    private var didReorder: Bool = false

    // MARK: - Init

    override init() {
        super.init()
        title = UBLocalized.wallet_certificate_list_title.uppercased()
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        UIStateManager.shared.addObserver(self) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.update()
        }

        addDismissButton()
    }

    // MARK: - Setup

    private func setup() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .zero

        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))

        tableView.sectionHeaderHeight = 0.0
        tableView.sectionFooterHeight = 0.0
        tableView.separatorStyle = .none

        tableView.register(CertificateTableViewCell.classForCoder(), forCellReuseIdentifier: CertificateListViewController.certificateReuseIdentifier)
        tableView.register(TransferCodeTableViewCell.classForCoder(), forCellReuseIdentifier: CertificateListViewController.transferCodeReuseIdentifier)
        tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
    }

    // MARK: - Update

    private func update() {
        if !didReorder {
            certificates = CertificateStorage.shared.userCertificates

            if certificates.count == 0 {
                dismiss(animated: true, completion: nil)
                return
            }

            tableView.reloadData()
        }

        didReorder = false
    }
}

extension CertificateListViewController: UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return certificates.count
    }

    func tableView(_: UITableView, shouldIndentWhileEditingRowAt _: IndexPath) -> Bool {
        return false
    }

    func tableView(_: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = certificates[sourceIndexPath.row]
        certificates.remove(at: sourceIndexPath.row)
        certificates.insert(movedObject, at: destinationIndexPath.row)

        didReorder = true
        CertificateStorage.shared.userCertificates = certificates
    }

    func tableView(_: UITableView, editingStyleForRowAt _: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}

extension CertificateListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cert = certificates[indexPath.row]

        switch cert.type {
        case .lightCertificate:
            fallthrough
        case .certificate:
            let cell = tableView.dequeueReusableCell(withIdentifier: CertificateListViewController.certificateReuseIdentifier, for: indexPath) as! CertificateTableViewCell
            cell.certificate = certificates[indexPath.row]
            cell.showsReorderControl = true
            return cell
        case .transferCode:
            let cell = tableView.dequeueReusableCell(withIdentifier: CertificateListViewController.transferCodeReuseIdentifier, for: indexPath) as! TransferCodeTableViewCell
            cell.certificate = certificates[indexPath.row]
            cell.showsReorderControl = true
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cert = certificates[indexPath.row]
        let vc = WalletDetailViewController(certificate: cert)
        vc.presentInNavigationController(from: self)
    }
}
