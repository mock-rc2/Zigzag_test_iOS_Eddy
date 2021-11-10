//
//  OrderViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/10.
//

import UIKit

class OrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.title = "주문ㆍ배송"
        self.navigationItem.leftBarButtonItem = leftBarButton
    }

    @objc func backToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}
