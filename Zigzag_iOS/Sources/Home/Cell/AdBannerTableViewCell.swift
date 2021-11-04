//
//  AdBannerCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/02.
//

import UIKit

class AdBannerTableViewCell: UITableViewCell {

    @IBOutlet weak var adCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        adCollectionView.delegate = self
        adCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension AdBannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: adCollectionView.frame.width , height: adCollectionView.frame.height-(adCollectionView.safeAreaInsets.top + adCollectionView.safeAreaInsets.bottom))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdBannerCVC", for: indexPath) as? AdBannerCollectionViewCell else { return UICollectionViewCell() }
        cell.adImageView.image = UIImage(named: "zigzagAd")
        return cell
    }
    
    
}
