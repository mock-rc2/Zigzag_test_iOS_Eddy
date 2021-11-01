//
//  TermOfServiceViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/01.
//

import UIKit

class TermOfServiceViewController: UIViewController {

    @IBOutlet weak var agreeAllButton: UIButton!
    
    @IBOutlet weak var necessary1Button: UIButton!
    @IBOutlet weak var necessary2Button: UIButton!
    @IBOutlet weak var necessary3Button: UIButton!
    @IBOutlet weak var selectiveButton: UIButton!
    @IBOutlet weak var selectiveMarketingButton: UIButton!
    @IBOutlet weak var agreeSMSButton: UIButton!
    @IBOutlet weak var agreeEmailButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var show1Button: UIButton!
    @IBOutlet weak var show2Button: UIButton!
    @IBOutlet weak var show3Button: UIButton!
    @IBOutlet weak var show4Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setButtonTarget()
        setNextButton()
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
    
    func setButtonTarget() {
        [agreeAllButton, necessary1Button, necessary2Button, necessary3Button, selectiveButton, selectiveMarketingButton, agreeSMSButton, agreeEmailButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    func setNextButton() {
        nextButton.setBackgroundColor(UIColor.mainPink, for: .normal)
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 20
        nextButton.isEnabled = false
        nextButton.alpha = 0.25
    }
    
    func allButtonSelected() {
        agreeAllButton.isSelected = true
        necessary1Button.isSelected = true
        necessary2Button.isSelected = true
        necessary3Button.isSelected = true
        selectiveButton.isSelected = true
        selectiveMarketingButton.isSelected = true
        agreeSMSButton.isSelected = true
        agreeEmailButton.isSelected = true
        agreeAllButton.tintColor = .mainPink
        necessary1Button.tintColor = .mainPink
        necessary2Button.tintColor = .mainPink
        necessary3Button.tintColor = .mainPink
        selectiveButton.tintColor = .mainPink
        selectiveMarketingButton.tintColor = .mainPink
        agreeSMSButton.tintColor = .mainPink
        agreeEmailButton.tintColor = .mainPink
    }
    
    func allButtonNotSelected() {
        agreeAllButton.isSelected = false
        necessary1Button.isSelected = false
        necessary2Button.isSelected = false
        necessary3Button.isSelected = false
        selectiveButton.isSelected = false
        selectiveMarketingButton.isSelected = false
        agreeSMSButton.isSelected = false
        agreeEmailButton.isSelected = false
        agreeAllButton.tintColor = .tertiaryLabel
        necessary1Button.tintColor = .tertiaryLabel
        necessary2Button.tintColor = .tertiaryLabel
        necessary3Button.tintColor = .tertiaryLabel
        selectiveButton.tintColor = .tertiaryLabel
        selectiveMarketingButton.tintColor = .tertiaryLabel
        agreeSMSButton.tintColor = .tertiaryLabel
        agreeEmailButton.tintColor = .tertiaryLabel
    }
    
    func checkNecessaryButton() {
        if necessary1Button.isSelected, necessary2Button.isSelected, necessary3Button.isSelected {
            nextButton.isEnabled = true
            nextButton.alpha = 1.0
        } else {
            nextButton.isEnabled = false
            nextButton.alpha = 0.25
        }
    }
    
    func checkMarketingButton() {
        if selectiveMarketingButton.isSelected, !agreeSMSButton.isSelected, !agreeEmailButton.isSelected {
            agreeSMSButton.isSelected = true
            agreeEmailButton.isSelected = true
            agreeSMSButton.tintColor = .mainPink
            agreeEmailButton.tintColor = .mainPink
        } else if !selectiveMarketingButton.isSelected {
            agreeSMSButton.isSelected = false
            agreeEmailButton.isSelected = false
            agreeSMSButton.tintColor = .tertiaryLabel
            agreeEmailButton.tintColor = .tertiaryLabel
        } else if !agreeSMSButton.isSelected, !agreeEmailButton.isSelected {
            selectiveMarketingButton.isSelected = false
            selectiveMarketingButton.tintColor = .tertiaryLabel
        }
    }
    
    @objc func backToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case agreeAllButton:
            if !agreeAllButton.isSelected {
                allButtonSelected()
                nextButton.isEnabled = true
                nextButton.alpha = 1.0
            } else {
                allButtonNotSelected()
                nextButton.isEnabled = false
                nextButton.alpha = 0.25
            }
        
        default:
            if !sender.isSelected {
                sender.isSelected = true
                sender.tintColor = .mainPink
                checkNecessaryButton()
                checkMarketingButton()
            } else {
                sender.isSelected = false
                sender.tintColor = .tertiaryLabel
                checkNecessaryButton()
                checkMarketingButton()
            }
            return
        }
        
    }

}
