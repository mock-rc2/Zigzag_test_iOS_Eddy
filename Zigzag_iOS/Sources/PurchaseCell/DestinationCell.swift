//
//  DestinationCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/08.
//

import UIKit

class DestinationCell: UITableViewCell {

    @IBOutlet weak var recentDestinationButton: UIButton!
    @IBOutlet weak var findPostNumberButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSeparator()
        setRecentDestinationButton()
        setFindPostNumberButton()
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
    
    func setRecentDestinationButton() {
        recentDestinationButton.clipsToBounds = true
        recentDestinationButton.layer.cornerRadius = 15
    }
    
    func setFindPostNumberButton() {
        findPostNumberButton.clipsToBounds = true
        findPostNumberButton.layer.cornerRadius = 15
    }

}
