//
//  BrandRankingCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import UIKit

class BrandRankingCell: UITableViewCell {

    @IBOutlet weak var brandRankingNumLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandCategoryLabel: UILabel!
    @IBOutlet weak var brandMaxCouponLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var bookmarkNumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonTarget()
        setImageView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setButtonTarget() {
        [bookmarkButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    func setImageView() {
        brandImageView.layer.masksToBounds = true
        brandImageView.layer.cornerRadius = 22.5
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case bookmarkButton:
            if !sender.isSelected {
                sender.isSelected = true
            } else {
                sender.isSelected = false
            }
        default:
            return
        }
    }

}
