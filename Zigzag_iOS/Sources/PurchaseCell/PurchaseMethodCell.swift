//
//  PurchaseMethodCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/08.
//

import UIKit

class PurchaseMethodCell: UITableViewCell {

    @IBOutlet weak var simplePayButton: UIButton!
    @IBOutlet weak var creditCheckCardButton: UIButton!
    @IBOutlet weak var phonePayButton: UIButton!
    @IBOutlet weak var mooTongChangButton: UIButton!
    @IBOutlet weak var againUseMethodButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSeparator()
        setButtons()
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
    
    func setButtons() {
        simplePayButton.clipsToBounds = true
        creditCheckCardButton.clipsToBounds = true
        phonePayButton.clipsToBounds = true
        mooTongChangButton.clipsToBounds = true
        simplePayButton.layer.borderWidth = 2
        creditCheckCardButton.layer.borderWidth = 2
        phonePayButton.layer.borderWidth = 2
        mooTongChangButton.layer.borderWidth = 2
        simplePayButton.layer.borderColor = UIColor.mainPink.cgColor
        simplePayButton.setTitleColor(.mainPink, for: .normal)
        simplePayButton.layer.cornerRadius = 17.5
        creditCheckCardButton.layer.cornerRadius = 17.5
        phonePayButton.layer.cornerRadius = 17.5
        mooTongChangButton.layer.cornerRadius = 17.5
        creditCheckCardButton.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        phonePayButton.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        mooTongChangButton.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
    }

    @IBAction func againUseMethodButtonTap(_ sender: Any) {
        if !againUseMethodButton.isSelected {
            againUseMethodButton.isSelected = true
            againUseMethodButton.tintColor = .mainPink
        } else {
            againUseMethodButton.isSelected = false
            againUseMethodButton.tintColor = .tertiaryLabel
        }
        
    }
}
