//
//  DeliveryCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/02.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var deliveryButton: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDeliveryButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setDeliveryButton() {
        deliveryButton.layer.masksToBounds = false
        deliveryButton.layer.shadowRadius = 10
        deliveryButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        deliveryButton.layer.shadowOpacity = 0.2
        deliveryButton.layer.shadowColor = UIColor.black.cgColor
    }
    
}
