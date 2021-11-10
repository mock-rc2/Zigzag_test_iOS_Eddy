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
    
    var storeNameList: [String] = []
    var styleList: [String] = []
    var likeNumList: [Int] = []
    var maxCouponPriceList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButtonUI()
        StoreRequest().getShoppingMallData(viewController: self)
    }
    
    func setButtonUI() {
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
    
}

extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoreRankingCell", for: indexPath) as? StoreRankingCell else { return UITableViewCell()
        }
        cell.rankingNumLabel.text = "\(indexPath.row + 1)"
        cell.storeImageView.image = UIImage(named: "66girls")
        
        if storeNameList.count != 0 {
            cell.storeNameLabel.text = storeNameList[indexPath.row]
            cell.storeCategoryLabel.text = styleList[indexPath.row]
            cell.maxCouponLabel.text = "최대 \(maxCouponPriceList[indexPath.row])원 쿠폰"
            cell.bookmarkNumLabel.text = "\(likeNumList[indexPath.row])"
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
            storeNameList.append(infoList[i].storeName)
            
            if infoList[i].style.count == 2 {
                let styles: String = infoList[i].style[0] + " " + infoList[i].style[1]
                styleList.append(styles)
            } else {
                styleList.append(infoList[i].style[0])
            }
                        
            likeNumList.append(infoList[i].likeNum)
            maxCouponPriceList.append(infoList[i].maxCouponPrice)
        }
        storeTableView.reloadData()
    }
    
    func didShoppingMallAPIFailure(message: String) {
        presentBottomAlert(message: message)
    }
}
