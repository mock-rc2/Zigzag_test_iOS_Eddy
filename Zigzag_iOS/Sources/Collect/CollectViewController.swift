//
//  CollectViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit

class CollectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let collectLabel = UILabel()
        collectLabel.text = "모아보기"
        collectLabel.textColor = .black
        collectLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: collectLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.mainPink
    }
}
