//
//  LikeViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit

class LikeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let likeLabel = UILabel()
        likeLabel.text = "찜한 아이템"
        likeLabel.textColor = .black
        likeLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: likeLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let rightView = UIView()
        rightView.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        
        let classifyButton = UIButton(type: .system)
        classifyButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        classifyButton.tintColor = .black
        
        let editButton = UIButton(type: .system)
        editButton.setImage(UIImage(named: "scissor"), for: .normal)
        editButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        
        rightView.addSubview(classifyButton)
        rightView.addSubview(editButton)
        rightView.addSubview(cartButton)
        
        classifyButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        editButton.snp.makeConstraints { make in
            make.leading.equalTo(classifyButton.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.width.equalTo(15)
            make.height.equalTo(20)
        }
        
        cartButton.snp.makeConstraints { make in
            make.leading.equalTo(editButton.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        let rightItem = UIBarButtonItem(customView: rightView)
        self.navigationItem.rightBarButtonItem = rightItem
    }

}
