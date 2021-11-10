//
//  LoginViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/31.
//

import UIKit
import PanModal

class LoginViewController: UIViewController {

    @IBOutlet weak var zigzagLogoImageView: UIImageView!
    @IBOutlet weak var kakaoLoginButton: UIView!
    @IBOutlet weak var appleLoginButton: UIView!
    @IBOutlet weak var emailLoginButton: UIButton!
    static var isTappedEmailSignUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setLogoImageView()
        setKakaoLoginButton()
        setAppleLoginButton()
        setEmailLoginButton()
        self.navigationController?.navigationBar.isTransparent = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if LoginViewController.isTappedEmailSignUp {
            let vc = UIStoryboard(name: "MyPageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TermOfServiceViewController") as! TermOfServiceViewController
            self.navigationController?.pushViewController(vc, animated: true)
            LoginViewController.isTappedEmailSignUp = false
        }
    }
    
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBottomSheetButton(_ sender: Any) {
        let vc = UIStoryboard(name: "MyPageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "SignUpBottonSheetVC") as! SignUpBottonSheetViewController
        presentPanModal(vc)
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationController?.modalPresentationStyle = .fullScreen
    }
    
    func setLogoImageView() {
        zigzagLogoImageView.clipsToBounds = true
        zigzagLogoImageView.layer.cornerRadius = 20
    }
    
    func setKakaoLoginButton() {
        kakaoLoginButton.layer.cornerRadius = 20
        kakaoLoginButton.backgroundColor = .kakaoYellow
    }
    
    func setAppleLoginButton() {
        appleLoginButton.layer.cornerRadius = 20
        appleLoginButton.backgroundColor = .white
        appleLoginButton.layer.borderWidth = 1
        appleLoginButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func setEmailLoginButton() {
        emailLoginButton.setTitle("이메일로 로그인", for: .normal)
        emailLoginButton.setTitleColor(.black, for: .normal)
        emailLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        emailLoginButton.clipsToBounds = true
        emailLoginButton.layer.cornerRadius = 20
        emailLoginButton.setBackgroundColor(.tertiarySystemGroupedBackground, for: .normal)
    }
    
    @objc func backToPrevious() {
        dismiss(animated: true, completion: nil)
    }
    
}
