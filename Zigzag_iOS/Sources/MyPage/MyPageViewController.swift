//
//  MyPageViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
    }

    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let myPageLabel = UILabel()
        myPageLabel.text = "마이페이지"
        myPageLabel.textColor = .black
        myPageLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: myPageLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let rightView = UIView()
        rightView.frame = CGRect(x: 0, y: 0, width: 75, height: 35)
        
        let noticeButton = UIButton(type: .system)
        noticeButton.setImage(UIImage(systemName: "bell"), for: .normal)
        noticeButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        
        rightView.addSubview(noticeButton)
        rightView.addSubview(cartButton)
        
        noticeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        cartButton.snp.makeConstraints { make in
            make.leading.equalTo(noticeButton.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        let rightItem = UIBarButtonItem(customView: rightView)
        self.navigationItem.rightBarButtonItem = rightItem
    }
}
