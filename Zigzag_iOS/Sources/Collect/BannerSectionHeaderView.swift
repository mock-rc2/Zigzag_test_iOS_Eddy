//
//  bannerSectionHeaderView.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/10.
//

import UIKit

import SnapKit

class BannerSectionHeaderView: UITableViewHeaderFooterView {
    static let identifier = "bannerSectionHeaderView"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initSectionHeaderView()
        setLayouts()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("coder doesn't exist")
    }

    private func initSectionHeaderView() {
        contentView.backgroundColor = .white
    }

    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }

    private func setViewHierarchy() {
        contentView.addSubview(titleLabel)
    }

    private func setConstraints() {
        contentView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-12)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }

    public func setTitleText(title: String) {
        titleLabel.text = title
    }
}
