//
//  CategoryTableViewCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/10.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryInfoList: [CategoryInfo] = [CategoryInfo(image: UIImage(named: "freeshipping"), name: "무료배송"), CategoryInfo(image: UIImage(named: "outer"), name: "아우터"), CategoryInfo(image: UIImage(named: "top"), name: "상의"), CategoryInfo(image: UIImage(named: "onepiece"), name: "원피스/세트"),CategoryInfo(image: UIImage(named: "pants"), name: "바지"), CategoryInfo(image: UIImage(named: "skirt"), name: "치마"),CategoryInfo(image: UIImage(named: "shoes"), name: "슈즈"), CategoryInfo(image: UIImage(named: "bag"), name: "가방"),CategoryInfo(image: UIImage(named: "accessary"), name: "액세서리"), CategoryInfo(image: UIImage(named: "socks"), name: "패션소품"),CategoryInfo(image: UIImage(named: "beachwear"), name: "비치웨어"), CategoryInfo(image: UIImage(named: "pazama"), name: "란제리/파자마"),CategoryInfo(image: UIImage(named: "training"), name: "트레이닝"), CategoryInfo(image: UIImage(named: "big"), name: "빅사이즈"),CategoryInfo(image: UIImage(named: "beauty"), name: "뷰티")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        setSeparator()
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


}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoryCollectionView.frame.width/5 , height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVC", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.categoryImageView.image = categoryInfoList[indexPath.item].image
        cell.categoryLabel.text = categoryInfoList[indexPath.item].name

        return cell
    }
    
    
}
