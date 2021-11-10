//
//  MyPageHeaderView.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/10.
//

import UIKit

import SnapKit

class MyPageHeaderView: UITableViewHeaderFooterView {
    static let identifier = "myPageHeaderView"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let additionalSeparator: UIView = {
        let seperator = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat(1.0)))
        seperator.backgroundColor = UIColor.tertiarySystemGroupedBackground
        return seperator
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
        contentView.addSubview(additionalSeparator)
    }

    private func setConstraints() {
        contentView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        
        additionalSeparator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
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
