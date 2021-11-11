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
        setImageView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setImageView() {
        bookmarkStoreImageView.layer.masksToBounds = true
        bookmarkStoreImageView.layer.cornerRadius = 22.5
    }

}
