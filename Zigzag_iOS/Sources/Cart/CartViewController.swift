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
    @IBOutlet weak var deleteAllItemButton: UIButton!
    @IBOutlet weak var totalItemPriceLabel: UILabel!
    @IBOutlet weak var totalShippingPriceLabel: UILabel!
    @IBOutlet weak var totalExpectedPriceLabel: UILabel!
    @IBOutlet weak var realTotalPriceLabel: UILabel!
    @IBOutlet weak var goToPurchaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGoToPurchaseButton()
    }
    
    func setGoToPurchaseButton() {
        goToPurchaseButton.setBackgroundColor(UIColor.tertiarySystemFill, for: .disabled)
        goToPurchaseButton.setBackgroundColor(UIColor.mainPink, for: .normal)
        goToPurchaseButton.clipsToBounds = true
        goToPurchaseButton.layer.cornerRadius = 18
        goToPurchaseButton.isEnabled = false
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTVC", for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
