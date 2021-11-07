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
    var chapter: Int = 0

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
            switch chapter {
            case 0:
                cell.basicTitleLabel.text = HomeViewController.storeNameList[indexPath.item]
                cell.basicDescriptionLabel.text = HomeViewController.productNameList[indexPath.item]
                cell.basicPriceLabel.text = "\(HomeViewController.priceList[indexPath.item])"
                return cell
            case 1:
                cell.basicTitleLabel.text = HomeViewController.storeNameList[indexPath.item + 2]
                cell.basicDescriptionLabel.text = HomeViewController.productNameList[indexPath.item + 2]
                cell.basicPriceLabel.text = "\(HomeViewController.priceList[indexPath.item + 2])"
                return cell
            case 2:
                cell.basicTitleLabel.text = HomeViewController.storeNameList[indexPath.item + 4]
                cell.basicDescriptionLabel.text = HomeViewController.productNameList[indexPath.item + 4]
                cell.basicPriceLabel.text = "\(HomeViewController.priceList[indexPath.item + 4])"
                return cell
            default:
                cell.basicTitleLabel.text = "리리앤코"
                cell.basicDescriptionLabel.text = "텐딘 벤딩 와이드"
                cell.basicPriceLabel.text = "24,120"
                return cell
            }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.cellToVCDelegate?.pushVC(data: "쇼핑몰 이름")
    }
    
}
