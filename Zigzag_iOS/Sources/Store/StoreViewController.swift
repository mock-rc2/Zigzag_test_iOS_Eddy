//
//  StoreViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit
import SnapKit

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
    
    var brandStoreNameList: [String] = []
    var brandCategoryList: [String] = []
    var brandLikeNumList: [Int] = []
    var brandMaxCouponPriceList: [Int] = []
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingmallButton.isSelected ? 5 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoreRankingCell", for: indexPath) as? StoreRankingCell else { return UITableViewCell()
        }
        cell.rankingNumLabel.text = "\(indexPath.row + 1)"
        cell.storeImageView.image = UIImage(named: "66girls")
        
        if smStoreNameList.count != 0, shoppingmallButton.isSelected {
            cell.storeNameLabel.text = smStoreNameList[indexPath.row]
            cell.storeCategoryLabel.text = smStyleList[indexPath.row]
            cell.maxCouponLabel.text = "최대 \(smMaxCouponPriceList[indexPath.row])원 쿠폰"
            cell.bookmarkNumLabel.text = "\(smLikeNumList[indexPath.row])"
        } else if brandStoreNameList.count != 0, brandButton.isSelected {
            cell.storeNameLabel.text = brandStoreNameList[indexPath.row]
            cell.storeCategoryLabel.text = brandCategoryList[indexPath.row]
            cell.maxCouponLabel.text = "최대 \(brandMaxCouponPriceList[indexPath.row])원 쿠폰"
            cell.bookmarkNumLabel.text = "\(brandLikeNumList[indexPath.row])"
        } else {
            cell.storeNameLabel.text = "육육걸즈"
            cell.storeCategoryLabel.text = "심플베이직 러블리"
            cell.maxCouponLabel.text = "최대 5,000원 쿠폰"
            cell.bookmarkNumLabel.text = "1"
        }
        
        return cell
    }
    
}

extension StoreViewController {
    func didShoppingMallAPISuccess(infoList: [StoreRankingInfo]) {
        for i in 0..<5 {
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
