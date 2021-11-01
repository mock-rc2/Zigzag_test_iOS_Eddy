//
//  PhoneAuthViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/01.
//

import UIKit

class PhoneAuthViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var authNumberTextField: UITextField!
    @IBOutlet weak var sendAuthNumberButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        dismissKeyboardWhenTappedAround()
        setPhoneTextField()
        setAuthNumberTextField()
        setsendAuthNumberButton()
        setLoginButton()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        let rightButton = UIButton()
        rightButton.setImage(UIImage(systemName: "questionmark.circle.fill"), for: .normal)
        rightButton.setTitle("문의", for: .normal)
        rightButton.setTitleColor(.lightGray, for: .normal)
        rightButton.tintColor = .lightGray
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        let rightBarButton = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        self.navigationController?.modalPresentationStyle = .fullScreen
    }
    
    func setPhoneTextField() {
        phoneTextField.backgroundColor = .white
        phoneTextField.clipsToBounds = true
        phoneTextField.layer.cornerRadius = 8
        phoneTextField.layer.borderWidth = 2
        phoneTextField.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        phoneTextField.addLeftPadding()
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func setAuthNumberTextField() {
        authNumberTextField.isEnabled = false
        authNumberTextField.backgroundColor = .white
        authNumberTextField.clipsToBounds = true
        authNumberTextField.layer.cornerRadius = 8
        authNumberTextField.layer.borderWidth = 2
        authNumberTextField.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        authNumberTextField.addLeftPadding()
        authNumberTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func setsendAuthNumberButton() {
        sendAuthNumberButton.setBackgroundColor(.tertiarySystemGroupedBackground, for: .normal)
        sendAuthNumberButton.clipsToBounds = true
        sendAuthNumberButton.layer.cornerRadius = 20
        sendAuthNumberButton.isEnabled = false
    }
    
    func setLoginButton() {
        nextButton.setBackgroundColor(UIColor.mainPink, for: .normal)
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 20
        nextButton.isEnabled = false
        nextButton.alpha = 0.25
    }
    
    @objc func textFieldDidChange() {
        if phoneTextField.text?.count ?? 0 >= 10 {
            sendAuthNumberButton.isEnabled = true
            sendAuthNumberButton.setTitleColor(.black, for: .normal)
        } else {
            sendAuthNumberButton.isEnabled = false
        }
        
        if authNumberTextField.text?.count ?? 0 == 4 {
            nextButton.isEnabled = true
            nextButton.alpha = 1.0
        } else {
            nextButton.isEnabled = false
            nextButton.alpha = 0.25
        }
    }
    
    @IBAction func sendAuthNumberButtonTap(_ sender: Any) {
        authNumberTextField.isEnabled = true
    }
    
    @objc func backToPrevious() {
        navigationController?.popViewController(animated: true)
    }
}
