//
//  RecommendItemTableViewCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/02.
//

import UIKit

class RecommendItemTableViewCell: UITableViewCell {

    @IBOutlet weak var recommendCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension RecommendItemTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: recommendCollectionView.frame.width/3 , height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendItemCVC", for: indexPath) as? RecommendItemCollectionViewCell else { return UICollectionViewCell() }
        cell.itemImageView.image = UIImage(named: "zigzagsampleitem")
        cell.itemTitleLabel.text = "리리앤코"
        cell.itemDescriptionLabel.text = "텐딘 밴딩 와이드"
        cell.itemPriceLabel.text = "24,120"

        return cell
    }
    
}

