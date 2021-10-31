//
//  HomeViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        let logoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        logoButton.setBackgroundImage(UIImage(named: "zigzaghomelogo"), for: .normal)
        let leftBarButton = UIBarButtonItem(customView: logoButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.searchTextField.layer.cornerRadius = 15
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 12)
        self.navigationItem.titleView = searchBar
        
        // UIView를 오른쪽 customView에 연결
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.mainPink
    }
}
