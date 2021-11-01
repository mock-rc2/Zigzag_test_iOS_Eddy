//
//  SignUpBottonSheetViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/01.
//

import UIKit
import PanModal

class SignUpBottonSheetViewController: UIViewController {

    @IBOutlet weak var kakaoLoginButton: UIView!
    @IBOutlet weak var appleLoginButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKakaoLoginButton()
        setAppleLoginButton()
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
    
    @IBAction func signUpForEmailButtonTap(_ sender: Any) {
        
    }
    
}

extension SignUpBottonSheetViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(250)
    }

    var longFormHeight: PanModalHeight {
        return .contentHeight(250)
    }
    
    var anchorModalToLongForm: Bool {
        return true
    }
    
}
