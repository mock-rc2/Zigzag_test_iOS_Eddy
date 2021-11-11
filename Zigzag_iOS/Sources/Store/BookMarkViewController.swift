//
//  BookMarkViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/09.
//

import UIKit

class BookMarkViewController: UIViewController {

    @IBOutlet weak var bookmarkTableView: UITableView!
    @IBOutlet weak var numOfCellLabel: UILabel!
    
    var bookmarkUrlImage: [String] = []
    var bookmarkStoreNameList: [String] = []
    var numOfCell: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        StoreRequest().getBookMarkData(viewController: self)
    }
    
    func loadImage(_ url: String?) -> UIImage {
        let data = NSData(contentsOf: NSURL(string: url!)! as URL)
        var image: UIImage?
        if (data != nil){
            image = UIImage(data: data! as Data)
        }
        return image!
    }

}

extension BookMarkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookMarkCell", for: indexPath) as? BookMarkCell else { return UITableViewCell()
        }
        
        if bookmarkUrlImage.count != 0 {
            cell.bookmarkStoreImageView.image = loadImage(bookmarkUrlImage[indexPath.row])
            cell.bookmarkStoreNameLabel.text = bookmarkStoreNameList[indexPath.row]
        } else {
            cell.bookmarkStoreImageView.image = nil
            cell.bookmarkStoreNameLabel.text = ""
        }
        
        return cell
    }
    
    
}

extension BookMarkViewController {
    
    func didBookMarkAPISuccess(infoList: BookMarkResult) {
        bookmarkUrlImage.removeAll()
        bookmarkStoreNameList.removeAll()
        for i in 0..<infoList.count {
            bookmarkUrlImage.append(infoList.getFavoriteStoreResList[i].storeImg)
            bookmarkStoreNameList.append(infoList.getFavoriteStoreResList[i].storeName)
        }
        numOfCellLabel.text = "\(infoList.count)"
        numOfCell = infoList.count
        bookmarkTableView.reloadData()
    }
    func didBookMarkAPIFailure(message: String) {
        
    }
}
