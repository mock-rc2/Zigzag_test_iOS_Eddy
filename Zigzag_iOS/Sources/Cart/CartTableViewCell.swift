//
//  CartTableViewCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/07.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var storeImageButton: UIButton!
    @IBOutlet weak var storeNameLabel: UIButton!
    @IBOutlet weak var cartItemCheckButton: UIButton!
    @IBOutlet weak var cartItemImageView: UIImageView!
    @IBOutlet weak var cartItemTextView: UITextView!
    @IBOutlet weak var cartItemDeleteButton: UIButton!
    @IBOutlet weak var cartItemOptionLabel: UILabel!
    @IBOutlet weak var minusNumButton: UIButton!
    @IBOutlet weak var numOfItemButton: UIButton!
    @IBOutlet weak var plusNumButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var shippingPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var addAnotherItemButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonUI()
        setSeparator()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setButtonUI() {
        storeImageButton.clipsToBounds = true
        storeImageButton.layer.cornerRadius = 15
        minusNumButton.clipsToBounds = true
        minusNumButton.layer.cornerRadius = 11
        numOfItemButton.clipsToBounds = true
        numOfItemButton.layer.cornerRadius = 10
        numOfItemButton.layer.borderWidth = 2
        numOfItemButton.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        plusNumButton.clipsToBounds = true
        plusNumButton.layer.cornerRadius = 11
        purchaseButton.clipsToBounds = true
        purchaseButton.layer.cornerRadius = 18
        purchaseButton.layer.borderWidth = 2
        purchaseButton.layer.borderColor = UIColor.mainPink.cgColor
        addAnotherItemButton.clipsToBounds = true
        addAnotherItemButton.layer.cornerRadius = 18
        addAnotherItemButton.layer.borderWidth = 2
        addAnotherItemButton.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
    }
    
    func setSeparator() {
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(8.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = UIColor.tertiarySystemGroupedBackground
        self.addSubview(additionalSeparator)
    }

    

}
