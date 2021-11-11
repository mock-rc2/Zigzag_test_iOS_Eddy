//
//  StoreRankingCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import UIKit

class StoreRankingCell: UITableViewCell {

    @IBOutlet weak var rankingNumLabel: UILabel!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeCategoryLabel: UILabel!
    @IBOutlet weak var maxCouponLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var bookmarkNumLabel: UILabel!
    
    var bookmarkDelegate: BookMarkButtonProtocol?
    
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
        storeImageView.layer.masksToBounds = true
        storeImageView.layer.cornerRadius = 22.5
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case bookmarkButton:
            if !sender.isSelected {
                sender.isSelected = true
                self.bookmarkDelegate?.enterBookmark(index: sender.tag)
            } else {
                sender.isSelected = false
                self.bookmarkDelegate?.dismissBookmark(index: sender.tag)
            }
        default:
            return
        }
    }

}
