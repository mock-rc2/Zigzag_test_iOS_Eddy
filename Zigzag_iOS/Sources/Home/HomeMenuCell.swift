//
//  HomeMenuCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/01.
//

import UIKit

class HomeMenuCell: UICollectionViewCell {
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuUnderBarView: UIView!
    
    override var isHighlighted: Bool {
        didSet {
            menuLabel.textColor = isSelected ? .black : .gray
            
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                self.menuUnderBarView.layoutIfNeeded()
                self.menuUnderBarView.alpha = self.isSelected ? 1 : 0
                
            }, completion: nil)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menuLabel.textColor = isSelected ? .black : .gray
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.menuUnderBarView.layoutIfNeeded()
                self.menuUnderBarView.alpha = self.isSelected ? 1 : 0
            }, completion: nil)
        }
    }
    
}
