//
//  StoreViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit
import SnapKit

protocol BookMarkButtonProtocol {
    func enterBookmark()
    func deleteBookmark()
}

class StoreViewController: UIViewController {

    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var shoppingmallButton: UIButton!
    @IBOutlet weak var brandButton: UIButton!
    @IBOutlet weak var pinButton: UIButton!
    @IBOutlet weak var shirtButton: UIButton!
    @IBOutlet weak var styleButton: UIButton!
    @IBOutlet weak var ageButton: UIButton!
    
    var smStoreNameList: [String] = []
    var smStyleList: [String] = []
    var smLikeNumList: [Int] = []
    var smMaxCouponPriceList: [Int] = []
    var smUrlImage: [String] = []
    
    var brandStoreNameList: [String] = []
    var brandCategoryList: [String] = []
    var brandLikeNumList: [Int] = []
    var brandMaxCouponPriceList: [Int] = []
    var brandUrlImage: [String] = []
    
    var shoppingMallBookMarkTap: [Bool] = [false, false, false, false, false]
    var brandBookMarkTap: [Bool] = [false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButtonUI()
        setButtonTarget()
        StoreRequest().getShoppingMallRankingData(viewController: self)
        StoreRequest().getBrandRankingData(viewController: self)
    }
    
    func setButtonUI() {
        shoppingmallButton.isSelected = true
        shoppingmallButton.setTitleColor(.secondaryLabel, for: .normal)
        shoppingmallButton.setTitleColor(.black, for: .selected)
        brandButton.isSelected = false
        brandButton.setTitleColor(.secondaryLabel, for: .normal)
        brandButton.setTitleColor(.black, for: .selected)
        pinButton.clipsToBounds = true
        shirtButton.clipsToBounds = true
        styleButton.clipsToBounds = true
        ageButton.clipsToBounds = true
        pinButton.layer.cornerRadius = 12.5
        shirtButton.layer.cornerRadius = 12.5
        styleButton.layer.cornerRadius = 12.5
        ageButton.layer.cornerRadius = 12.5
        styleButton.layer.borderWidth = 1
        styleButton.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        ageButton.layer.borderWidth = 1
        ageButton.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
    }
    
    func setButtonTarget() {
        [shoppingmallButton, brandButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    func loadImage(_ url: String?) -> UIImage {
        let data = NSData(contentsOf: NSURL(string: url!)! as URL)
        var image: UIImage?
        if (data != nil){
            image = UIImage(data: data! as Data)
        }
        return image!
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case shoppingmallButton:
            if !sender.isSelected {
                sender.isSelected = true
                brandButton.isSelected = false
                storeTableView.reloadData()
            }
        case brandButton:
            if !sender.isSelected {
                sender.isSelected = true
                shoppingmallButton.isSelected = false
                storeTableView.reloadData()
            }
        default:
            return
        }
        
    }
    
}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func enterBookmark() {
//        <#code#>
//    }
//
//    func deleteBookmark() {
//        <#code#>
//    }
    
    
    func numberOfSections(in _: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shoppingmallButton.isSelected {
            switch section {
            case 0:
                return 5
            case 1:
                return 0
            default:
                return 0
            }
        } else {
            switch section {
            case 0:
                return 0
            case 1:
                return 2
            default:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoreRankingCell", for: indexPath) as? StoreRankingCell else { return UITableViewCell()}
            
            cell.rankingNumLabel.text = "\(indexPath.row + 1)"
            
            if smStoreNameList.count != 0 {
                DispatchQueue.main.async {
                    cell.storeImageView.image = self.loadImage(self.smUrlImage[indexPath.row])
                    cell.storeNameLabel.text = self.smStoreNameList[indexPath.row]
                    cell.storeCategoryLabel.text = self.smStyleList[indexPath.row]
                    cell.maxCouponLabel.text = "최대 \(self.smMaxCouponPriceList[indexPath.row])원 쿠폰"
                    cell.bookmarkNumLabel.text = "\(self.smLikeNumList[indexPath.row])"
                }
            } else {
                cell.storeImageView.image = nil
                cell.storeNameLabel.text = ""
                cell.storeCategoryLabel.text = ""
                cell.maxCouponLabel.text = ""
                cell.bookmarkNumLabel.text = ""
            }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrandRankingCell", for: indexPath) as? BrandRankingCell else { return UITableViewCell() }
            
            cell.brandRankingNumLabel.text = "\(indexPath.row + 1)"
            
            if brandStoreNameList.count != 0 {
                DispatchQueue.main.async {
                    cell.brandImageView.image = self.loadImage(self.brandUrlImage[indexPath.row])
                    cell.brandNameLabel.text = self.brandStoreNameList[indexPath.row]
                    cell.brandCategoryLabel.text = self.brandCategoryList[indexPath.row]
                    cell.brandMaxCouponLabel.text = "최대 \(self.brandMaxCouponPriceList[indexPath.row])원 쿠폰"
                    cell.bookmarkNumLabel.text = "\(self.brandLikeNumList[indexPath.row])"
                }
            } else {
                cell.brandImageView.image = nil
                cell.brandNameLabel.text = ""
                cell.brandCategoryLabel.text = ""
                cell.brandMaxCouponLabel.text = ""
                cell.bookmarkNumLabel.text = ""
            }
            return cell
        default:
            return UITableViewCell()
        }
    
    }
    
}

extension StoreViewController {
    func didShoppingMallAPISuccess(infoList: [StoreRankingInfo]) {
        for i in 0..<5 {
            smUrlImage.append(infoList[i].storeImg)
            smStoreNameList.append(infoList[i].storeName)
            
            if infoList[i].style.count == 2 {
                let styles: String = infoList[i].style[0] + " " + infoList[i].style[1]
                smStyleList.append(styles)
            } else {
                smStyleList.append(infoList[i].style[0])
            }
                        
            smLikeNumList.append(infoList[i].likeNum)
            smMaxCouponPriceList.append(infoList[i].maxCouponPrice)
        }
        storeTableView.reloadData()
    }
    
    func didShoppingMallAPIFailure(message: String) {
        presentBottomAlert(message: message)
    }
    
    func didBrandAPISuccess(infoList: [BrandRankingInfo]) {
        for i in 0..<2 {
            brandUrlImage.append(infoList[i].storeImg)
            brandStoreNameList.append(infoList[i].storeName)
            brandCategoryList.append(infoList[i].storeCategoryName)
            brandLikeNumList.append(infoList[i].likeNum)
            brandMaxCouponPriceList.append(infoList[i].maxCouponPrice)
        }
        storeTableView.reloadData()
    }
    
    func didBrandAPIFailure(message: String) {
        presentBottomAlert(message: message)
    }
}
