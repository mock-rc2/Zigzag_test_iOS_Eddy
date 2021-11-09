//
//  CollectViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit

class CollectViewController: UIViewController {

    @IBOutlet weak var collectTableView: UITableView!
    var bannerImageList: [UIImage?] = [UIImage(named: "moabogi1.jpeg"), UIImage(named: "moabogi2.jpeg")!, UIImage(named: "moabogi3.jpeg")!, UIImage(named: "moabogi4.jpeg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        collectTableView.register(BannerSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: "bannerSectionHeaderView")
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        self.navigationController?.modalPresentationStyle = .fullScreen
        
        let collectLabel = UILabel()
        collectLabel.text = "모아보기"
        collectLabel.textColor = .black
        collectLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: collectLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(goToCart))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.mainPink
    }
    
    @objc func goToCart() {
        let vc = UIStoryboard(name: "CartStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CollectViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 290
        case 1:
            return 310
        default:
            return 0
        }
    }
    
    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            switch section {
            case 0:
                return 0
            case 1:
                return 50
            default:
                return 0
            }
        }

        func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            switch section {
            case 0:
                return nil
            case 1:
                guard let header = collectTableView.dequeueReusableHeaderFooterView(withIdentifier: "bannerSectionHeaderView") as? BannerSectionHeaderView else {
                    return nil
                }
                header.setTitleText(title: "할인 기획전")
                return header
            default:
                return nil
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTVC", for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BigBannerTVC", for: indexPath) as? BigBannerTableViewCell else { return UITableViewCell() }
            cell.bannerImageView.image = bannerImageList[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
}
