//
//  CartViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/06.
//

import UIKit

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
        setGoToPurchaseButton()
        setButtonTarget()
    }
    
    func setGoToPurchaseButton() {
        goToPurchaseButton.setBackgroundColor(UIColor.tertiarySystemFill, for: .disabled)
        goToPurchaseButton.setBackgroundColor(UIColor.mainPink, for: .normal)
        goToPurchaseButton.clipsToBounds = true
        goToPurchaseButton.layer.cornerRadius = 18
        goToPurchaseButton.isEnabled = false
    }
    
    func setButtonTarget() {
        [headerAllSelectButton, goToPurchaseButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
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

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        return cell
    }
    
    
}
