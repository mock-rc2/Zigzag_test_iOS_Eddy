//
//  CartViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/06.
//

import UIKit

protocol UpdateVC {
    func updateVC()
}

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var headerAllSelectButton: UIButton!
    @IBOutlet weak var deleteSelectedItemButton: UIButton!
    @IBOutlet weak var totalItemPriceLabel: UILabel!
    @IBOutlet weak var totalShippingPriceLabel: UILabel!
    @IBOutlet weak var totalExpectedPriceLabel: UILabel!
    @IBOutlet weak var realTotalPriceLabel: UILabel!
    @IBOutlet weak var goToPurchaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setGoToPurchaseButton()
        setButtonTarget()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.title = "장바구니"
        self.navigationController?.modalPresentationStyle = .fullScreen
    }
    
    func setGoToPurchaseButton() {
        goToPurchaseButton.setBackgroundColor(UIColor.tertiarySystemFill, for: .disabled)
        goToPurchaseButton.setBackgroundColor(UIColor.mainPink, for: .normal)
        goToPurchaseButton.clipsToBounds = true
        goToPurchaseButton.layer.cornerRadius = 18
        goToPurchaseButton.isEnabled = false
    }
    
    func setButtonTarget() {
        [headerAllSelectButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    @objc func backToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func purchaseButtonTap(_ sender: Any) {
        let vc = UIStoryboard(name: "CartStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PurchaseVC") as! PurchaseViewController
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case headerAllSelectButton:
            if !sender.isSelected {
                sender.isSelected = true
                sender.tintColor = .mainPink
                goToPurchaseButton.isEnabled = true
                cartTableView.reloadData()
            } else {
                sender.isSelected = false
                sender.tintColor = .tertiaryLabel
                goToPurchaseButton.isEnabled = false
                cartTableView.reloadData()
            }
        default:
            return
        }
        
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource, UpdateVC {
    
    func updateVC() {
        if !headerAllSelectButton.isSelected {
            headerAllSelectButton.isSelected = true
            headerAllSelectButton.tintColor = .mainPink
            goToPurchaseButton.isEnabled = true
            cartTableView.reloadData()
        } else {
            headerAllSelectButton.isSelected = false
            headerAllSelectButton.tintColor = .tertiaryLabel
            goToPurchaseButton.isEnabled = false
            cartTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTVC", for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
        if headerAllSelectButton.isSelected {
            cell.cartItemCheckButton.isSelected = true
            cell.cartItemCheckButton.tintColor = .mainPink
        } else {
            cell.cartItemCheckButton.isSelected = false
            cell.cartItemCheckButton.tintColor = .tertiaryLabel
        }
        cell.updateVCDelegate = self
        return cell
    }
    
    
}
