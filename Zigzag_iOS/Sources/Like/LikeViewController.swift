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
        self.navigationController?.modalPresentationStyle = .fullScreen
        
        let likeLabel = UILabel()
        likeLabel.text = "찜한 아이템"
        likeLabel.textColor = .black
        likeLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: likeLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let classifyButton = UIButton(type: .system)
        classifyButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        classifyButton.tintColor = .black
        
        let editButton = UIButton(type: .system)
        editButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        editButton.setImage(UIImage(systemName: "scissors"), for: .normal)
        editButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        
        let classifyBarButtonItem = UIBarButtonItem(customView: classifyButton)
        let editBarButtonItem = UIBarButtonItem(customView: editButton)
        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        self.navigationItem.rightBarButtonItems = [cartBarButtonItem, editBarButtonItem, classifyBarButtonItem]
    }
    
    @objc func goToCart() {
        let vc = UIStoryboard(name: "CartStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
