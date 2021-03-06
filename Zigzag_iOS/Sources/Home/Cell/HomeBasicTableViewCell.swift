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
    
    func loadImage(_ url: String?) -> UIImage {
        let data = NSData(contentsOf: NSURL(string: url!)! as URL)
        var image: UIImage?
        if (data != nil){
            image = UIImage(data: data! as Data)
        }
        return image!
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
        
            switch chapter {
            case 0:
                DispatchQueue.main.async {
                    cell.basicImageView.image = self.loadImage(HomeViewController.productUrlImage[indexPath.item])
                    cell.basicTitleLabel.text = HomeViewController.storeNameList[indexPath.item]
                    cell.basicDescriptionLabel.text = HomeViewController.productNameList[indexPath.item]
                    cell.basicPriceLabel.text = "\(HomeViewController.priceList[indexPath.item])".insertComma
                }
                return cell
            case 1:
                DispatchQueue.main.async {
                    cell.basicImageView.image = self.loadImage(HomeViewController.productUrlImage[indexPath.item + 2])
                    cell.basicTitleLabel.text = HomeViewController.storeNameList[indexPath.item + 2]
                    cell.basicDescriptionLabel.text = HomeViewController.productNameList[indexPath.item + 2]
                    cell.basicPriceLabel.text = "\(HomeViewController.priceList[indexPath.item + 2])".insertComma
                }
                return cell
            case 2:
                DispatchQueue.main.async {
                    cell.basicImageView.image = self.loadImage(HomeViewController.productUrlImage[indexPath.item + 4])
                    cell.basicTitleLabel.text = HomeViewController.storeNameList[indexPath.item + 4]
                    cell.basicDescriptionLabel.text = HomeViewController.productNameList[indexPath.item + 4]
                    cell.basicPriceLabel.text = "\(HomeViewController.priceList[indexPath.item + 4])".insertComma
                }
                return cell
            default:
                cell.basicImageView.image = UIImage(named: "zigzagsampleitem")
                cell.basicTitleLabel.text = "리리앤코"
                cell.basicDescriptionLabel.text = "텐딘 벤딩 와이드"
                cell.basicPriceLabel.text = "24,120"
                return cell
            }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.cellToVCDelegate?.pushVC()
    }
    
}
