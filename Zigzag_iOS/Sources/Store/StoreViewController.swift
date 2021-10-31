//
//  StoreViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit
import SnapKit

class StoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let storeLabel = UILabel()
        storeLabel.text = "스토어"
        storeLabel.textColor = .black
        storeLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: storeLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let rightView = UIView()
        rightView.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        
        let hashTagButton = UIButton(type: .system)
        hashTagButton.setImage(UIImage(systemName: "number"), for: .normal)
        hashTagButton.tintColor = .black
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        
        rightView.addSubview(hashTagButton)
        rightView.addSubview(searchButton)
        rightView.addSubview(cartButton)
        
        hashTagButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.leading.equalTo(hashTagButton.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
        }
        
        cartButton.snp.makeConstraints { make in
            make.leading.equalTo(searchButton.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        let rightItem = UIBarButtonItem(customView: rightView)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
}
