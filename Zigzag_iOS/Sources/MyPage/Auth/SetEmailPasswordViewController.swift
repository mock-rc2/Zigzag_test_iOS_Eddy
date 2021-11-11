//
//  SetEmailPasswordViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/01.
//

import UIKit
import Dispatch

class SetEmailPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setEmailTextField()
        setPasswordTextField()
        setSignUpButton()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationController?.modalPresentationStyle = .fullScreen
    }
    
    func setEmailTextField() {
        emailTextField.backgroundColor = .white
        emailTextField.clipsToBounds = true
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        emailTextField.addLeftPadding()
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func setPasswordTextField() {
        passwordTextField.backgroundColor = .white
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        passwordTextField.addLeftPadding()
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if emailTextField.text != "", passwordTextField.text?.count ?? 0 >= 6 {
            signUpButton.isEnabled = true
            signUpButton.alpha = 1.0
        } else {
            signUpButton.isEnabled = false
            signUpButton.alpha = 0.25
        }
    }
    
    func setSignUpButton() {
        signUpButton.setBackgroundColor(UIColor.mainPink, for: .normal)
        signUpButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 20
        signUpButton.isEnabled = false
        signUpButton.alpha = 0.25
    }
    
    @objc func backToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    func delayDismiss(_ closure: @escaping ()-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now()+4) {
            closure()
        }
    }
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            AuthRequest().sendSignUpData(email: email, password: password, viewController: self)
        }
    }
    
}

extension SetEmailPasswordViewController {
    
    func didSignUpSuccess() {
        AuthData.isLogin = true
        
        let vc = UIStoryboard(name: "MyPageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CompleteVC") as! CompleteViewController
        self.navigationController?.pushViewController(vc, animated: true)

        delayDismiss {
            self.dismiss(animated: true, completion: nil)
        }
       
    }
    
    func didSignUpFailure(message: String) {
        presentBottomAlert(message: message)
    }
}
