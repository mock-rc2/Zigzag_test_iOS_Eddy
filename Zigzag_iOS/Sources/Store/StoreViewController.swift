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
        self.navigationController?.modalPresentationStyle = .fullScreen
        
        let storeLabel = UILabel()
        storeLabel.text = "스토어"
        storeLabel.textColor = .black
        storeLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: storeLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let hashTagButton = UIButton(type: .system)
        hashTagButton.setImage(UIImage(systemName: "number"), for: .normal)
        hashTagButton.tintColor = .black
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        
        let hashTagBarButtonItem = UIBarButtonItem(customView: hashTagButton)
        let searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        self.navigationItem.rightBarButtonItems = [
        cartBarButtonItem, searchBarButtonItem, hashTagBarButtonItem]
    }
    
    @objc func goToCart() {
        let vc = UIStoryboard(name: "CartStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
