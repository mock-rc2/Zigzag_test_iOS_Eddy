//
//  LoginViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/31.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        self.navigationController?.navigationBar.isTransparent = true
    }
    
    @IBOutlet weak var zigzagLogoImageView: UIImageView!
    @IBOutlet weak var kakaoLoginButton: UIView!
    @IBOutlet weak var appleLoginButton: UIView!
    @IBOutlet weak var emailLoginButton: UIButton!
    
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TapEmailLoginButton(_ sender: Any) {
        
    }
    
    @IBAction func signUpBottomSheetButton(_ sender: Any) {
        
    }
    
    func setUI() {
        zigzagLogoImageView.clipsToBounds = true
        zigzagLogoImageView.layer.cornerRadius = 20
        kakaoLoginButton.layer.cornerRadius = 20
        kakaoLoginButton.backgroundColor = .kakaoYellow
        appleLoginButton.layer.cornerRadius = 20
        appleLoginButton.backgroundColor = .white
        appleLoginButton.layer.borderWidth = 1
        appleLoginButton.layer.borderColor = UIColor.black.cgColor
        emailLoginButton.setTitle("이메일로 로그인", for: .normal)
        emailLoginButton.setTitleColor(.black, for: .normal)
        emailLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        emailLoginButton.clipsToBounds = true
        emailLoginButton.layer.cornerRadius = 20
        emailLoginButton.setBackgroundColor(.tertiarySystemGroupedBackground, for: .normal)
    }
    
}
