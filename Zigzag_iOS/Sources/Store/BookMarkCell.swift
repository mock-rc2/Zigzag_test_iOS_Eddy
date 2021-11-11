//
//  BookMarkCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import UIKit

class BookMarkCell: UITableViewCell {

    @IBOutlet weak var bookmarkStoreImageView: UIImageView!
    @IBOutlet weak var bookmarkStoreNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
