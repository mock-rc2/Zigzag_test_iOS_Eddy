//
//  RecommendItemTableViewCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/02.
//

import UIKit

class RecommendItemTableViewCell: UITableViewCell {

    @IBOutlet weak var recommendCollectionView: UICollectionView!
    
    var cellToVCDelegate: CellToViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadImage(_ url: String?) -> UIImage {
        let data = NSData(contentsOf: NSURL(string: url!)! as URL)
        var image: UIImage?
        if (data != nil){
            image = UIImage(data: data! as Data)
        }
        return image!
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
        if HomeViewController.recommendPriceList.count != 0 {
            DispatchQueue.main.async {
                cell.itemImageView.image = self.loadImage(HomeViewController.recommendUrlImage[indexPath.item])
                cell.itemTitleLabel.text =
                    HomeViewController.recommendStoreNameList[indexPath.item]
                cell.itemDescriptionLabel.text =         HomeViewController.recommendProductNameList[indexPath.item]
                cell.itemPriceLabel.text = "\(HomeViewController.recommendPriceList[indexPath.item])".insertComma
            }
        } else {
            cell.itemImageView.image = UIImage(named: "zigzagsampleitem")
            cell.itemTitleLabel.text = "리리앤코"
            cell.itemDescriptionLabel.text = "텐딘 벤딩 와이드"
            cell.itemPriceLabel.text = "24,120"
        }
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.cellToVCDelegate?.pushVC()
    }
    
}

