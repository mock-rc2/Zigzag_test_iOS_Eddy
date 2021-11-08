//
//  PurchaseViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/08.
//

import UIKit

class PurchaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(dismissButtonTap), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.title = "결제"
        self.navigationController?.modalPresentationStyle = .fullScreen
    }
    
    @objc func dismissButtonTap() {
        dismiss(animated: true, completion: nil)
    }

}

extension PurchaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return 7
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
            return 1
        case 4:
            return 1
        case 5:
            return 1
        case 6:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 215
        case 1:
            return 100
        case 2:
            return 170
        case 3:
            return 230
        case 4:
            return 360
        case 5:
            return 220
        case 6:
            return 590
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseItemCell", for: indexPath) as? PurchaseItemCell else { return UITableViewCell() }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseCouponCell", for: indexPath) as? UseCouponCell else { return UITableViewCell() }
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsePointCell", for: indexPath) as? UsePointCell else { return UITableViewCell() }
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PurchasePriceCell", for: indexPath) as? PurchasePriceCell else { return UITableViewCell() }
            return cell
        
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationCell", for: indexPath) as? DestinationCell else { return UITableViewCell() }
            
            return cell
            
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseMethodCell", for: indexPath) as? PurchaseMethodCell else { return UITableViewCell() }
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TermOfPurchaseCell", for: indexPath) as? TermOfPurchaseCell else { return UITableViewCell() }
            return cell

        default:
            return UITableViewCell()
        }
        
    }
    
    
}
