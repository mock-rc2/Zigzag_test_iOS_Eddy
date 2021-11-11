//
//  SettingUserInfoHeaderView.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/12.
//

import UIKit

import SnapKit

class SettingUserInfoHeaderView: UITableViewHeaderFooterView {
    static let identifier = "settingUserInfoHeaderView"
    
    private let additionalSeparator: UIView = {
        let seperator = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat(8.0)))
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
        contentView.addSubview(additionalSeparator)
    }

    private func setConstraints() {
        contentView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        
        additionalSeparator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

}

