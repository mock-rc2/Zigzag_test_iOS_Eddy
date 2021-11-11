//
//  BookMarkViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/09.
//

import UIKit

class BookMarkViewController: UIViewController {

    @IBOutlet weak var numOfCellLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}

extension BookMarkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookMarkCell", for: indexPath) as? BookMarkCell else { return UITableViewCell()
        }
        cell.bookmarkStoreImageView.image = UIImage(named: "66girls")
        cell.bookmarkStoreNameLabel.text = "육육걸즈"
        return cell
    }
    
    
}
