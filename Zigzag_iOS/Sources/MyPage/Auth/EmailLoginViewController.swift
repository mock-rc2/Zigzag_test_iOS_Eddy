//
//  EmailLoginViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/31.
//

import UIKit

class EmailLoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setEmailTextField()
        setPasswordTextField()
        setLoginButton()
        emailTextField.becomeFirstResponder()
        dismissKeyboardWhenTappedAround()
    }

    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
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
            loginButton.isEnabled = true
            loginButton.alpha = 1.0
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.25
        }
    }
    
    @objc func backToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    func setLoginButton() {
        loginButton.setBackgroundColor(UIColor.mainPink, for: .normal)
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 20
        loginButton.isEnabled = false
        loginButton.alpha = 0.25
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        
    }
    
    @IBAction func findEmailButton(_ sender: Any) {
        
    }
    
    @IBAction func findPasswordButton(_ sender: Any) {
        
    }
    
    @IBAction func showSignUpBottomSheet(_ sender: Any) {
        
    }
}
