//
//  HomeBasicTableViewCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/02.
//

import UIKit

class HomeBasicTableViewCell: UITableViewCell {

    @IBOutlet weak var homeBasicCollectionView: UICollectionView!
    
    var cellToVCDelegate: CellToViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        homeBasicCollectionView.delegate = self
        homeBasicCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension HomeBasicTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (homeBasicCollectionView.frame.width/2) - 20 , height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBasicCVC", for: indexPath) as? HomeBasicCollectionViewCell else { return UICollectionViewCell() }
        
        cell.basicImageView.image = UIImage(named: "zigzagsampleitem")
        cell.basicTitleLabel.text = "리리앤코"
        cell.basicDescriptionLabel.text = "텐딘 밴딩 와이드"
        cell.basicPriceLabel.text = "24,120"

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.cellToVCDelegate?.performSegue(with: "쇼핑몰 이름")
    }
    
}
