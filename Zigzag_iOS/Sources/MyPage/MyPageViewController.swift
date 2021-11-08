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
    
    override func viewWillAppear(_ animated: Bool) {
        if AuthData.isLogin {
            authOrInfoButton.setTitle("회원님의 정보", for: .normal)
        } else{
            authOrInfoButton.setTitle("로그인/회원가입", for: .normal)
        }
    }
    
    @IBOutlet weak var authOrInfoButton: UIButton!
    

    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        self.navigationController?.modalPresentationStyle = .fullScreen
        
        let myPageLabel = UILabel()
        myPageLabel.text = "마이페이지"
        myPageLabel.textColor = .black
        myPageLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: myPageLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let noticeButton = UIButton(type: .system)
        noticeButton.setImage(UIImage(systemName: "bell"), for: .normal)
        noticeButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        
        let noticeBarButtonItem = UIBarButtonItem(customView: noticeButton)
        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)

        self.navigationItem.rightBarButtonItems = [
        cartBarButtonItem, noticeBarButtonItem]
    }
    
    @objc func goToCart() {
        let vc = UIStoryboard(name: "CartStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
