//
//  HomeViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/02.
//

import UIKit

protocol CellToViewController {
    func pushVC(data: String)
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    static var storeNameList: [String] = []
    static var productNameList: [String] = []
    static var priceList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        HomeRequest().getHomeBasicData(viewController: self)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource, CellToViewController {
    
    func pushVC(data: String) {
        let vc = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "DetailWebVC") as! DetailWebViewController
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        DetailWebViewController.navbarTitle = data
    }
    
    
    func numberOfSections(in _: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 250
        case 1:
            return 100
        case 2:
            return 280
        case 3:
            return 320
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdBannerTVC", for: indexPath) as? AdBannerTableViewCell else { return UITableViewCell() }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryTVC", for: indexPath) as? DeliveryTableViewCell else { return UITableViewCell() }
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendItemTVC", for: indexPath) as? RecommendItemTableViewCell else { return UITableViewCell() }
            cell.cellToVCDelegate = self
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBasicTVC", for: indexPath) as? HomeBasicTableViewCell else { return UITableViewCell() }
            cell.cellToVCDelegate = self
            cell.chapter = indexPath.row
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
}

extension HomeViewController {
    func didSignUpSuccess(infoList: [HomeBasicItemInfo]) {
        for i in 0..<7 {
            HomeViewController.storeNameList.append(infoList[i].storeName)
            HomeViewController.productNameList.append(infoList[i].productName)
            HomeViewController.priceList.append(infoList[i].price)
        }
        tableView.reloadData()
    }
    
    func didSignUpFailure(message: String) {
        presentBottomAlert(message: message)
    }
}
