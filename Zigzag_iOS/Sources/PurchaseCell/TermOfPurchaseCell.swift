//
//  TermOfPurchaseCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/09.
//

import UIKit

class TermOfPurchaseCell: UITableViewCell {

    @IBOutlet weak var agreeOver14Button: UIButton!
    @IBOutlet weak var agreeTermOfServiceButton: UIButton!
    @IBOutlet weak var serviceSubButton1: UIButton!
    @IBOutlet weak var serviceSubButton2: UIButton!
    @IBOutlet weak var confirmOrderButton: UIButton!
    @IBOutlet weak var orderSubButton1: UIButton!
    @IBOutlet weak var orderSubButton2: UIButton!
    @IBOutlet weak var orderSubButton3: UIButton!
    @IBOutlet weak var orderSubButton4: UIButton!
    @IBOutlet weak var realPurchaseButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSeparator()
        setRealPurchaseButton()
        setButtonTarget()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSeparator() {
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(8.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = UIColor.tertiarySystemGroupedBackground
        self.addSubview(additionalSeparator)
    }
    
    func setRealPurchaseButton() {
        realPurchaseButton.clipsToBounds = true
        realPurchaseButton.layer.cornerRadius = 20
        realPurchaseButton.setBackgroundColor(.mainPink, for: .normal)
    }
    
    func setButtonTarget() {
        [agreeOver14Button, agreeTermOfServiceButton, confirmOrderButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    func activateServiceSubButton() {
        serviceSubButton1.isSelected = true
        serviceSubButton1.tintColor = .mainPink
        serviceSubButton2.isSelected = true
        serviceSubButton2.tintColor = .mainPink
    }
    
    func deactivateServiceSubButton() {
        serviceSubButton1.isSelected = false
        serviceSubButton1.tintColor = .tertiaryLabel
        serviceSubButton2.isSelected = false
        serviceSubButton2.tintColor = .tertiaryLabel
    }
    
    func activateOrderSubButton() {
        orderSubButton1.isSelected = true
        orderSubButton1.tintColor = .mainPink
        orderSubButton2.isSelected = true
        orderSubButton2.tintColor = .mainPink
        orderSubButton3.isSelected = true
        orderSubButton3.tintColor = .mainPink
        orderSubButton4.isSelected = true
        orderSubButton4.tintColor = .mainPink
    }
    
    func deactivateOrderSubButton() {
        orderSubButton1.isSelected = false
        orderSubButton1.tintColor = .tertiaryLabel
        orderSubButton2.isSelected = false
        orderSubButton2.tintColor = .tertiaryLabel
        orderSubButton3.isSelected = false
        orderSubButton3.tintColor = .tertiaryLabel
        orderSubButton4.isSelected = false
        orderSubButton4.tintColor = .tertiaryLabel
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case agreeOver14Button:
            if !sender.isSelected {
                sender.isSelected = true
                sender.tintColor = .mainPink
            } else {
                sender.isSelected = false
                sender.tintColor = .tertiaryLabel
            }
        case agreeTermOfServiceButton:
            if !sender.isSelected {
                sender.isSelected = true
                sender.tintColor = .mainPink
                activateServiceSubButton()
            } else {
                sender.isSelected = false
                sender.tintColor = .tertiaryLabel
                deactivateServiceSubButton()
            }
        case confirmOrderButton:
            if !sender.isSelected {
                sender.isSelected = true
                sender.tintColor = .mainPink
                activateOrderSubButton()
            } else {
                sender.isSelected = false
                sender.tintColor = .tertiaryLabel
                deactivateOrderSubButton()
            }
        default:
            return
        }
        
    }

}
