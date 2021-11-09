//
//  StoreTabViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/09.
//

import UIKit
import Tabman
import Pageboy

class StoreTabViewController: TabmanViewController {

    private let menuList: [String] = ["랭킹", "즐겨찾기"]
    private var viewControllers = [UIStoryboard(name: "StoreStoryboard", bundle: nil).instantiateViewController(withIdentifier: "StoreViewController") as! StoreViewController, BookMarkViewController()]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.dataSource = self
        setBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        self.navigationController?.modalPresentationStyle = .fullScreen
        
        let storeLabel = UILabel()
        storeLabel.text = "스토어"
        storeLabel.textColor = .black
        storeLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: storeLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let hashTagButton = UIButton(type: .system)
        hashTagButton.setImage(UIImage(systemName: "number"), for: .normal)
        hashTagButton.tintColor = .black
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        
        let hashTagBarButtonItem = UIBarButtonItem(customView: hashTagButton)
        let searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        self.navigationItem.rightBarButtonItems = [
        cartBarButtonItem, searchBarButtonItem, hashTagBarButtonItem]
    }
    
    func setBar() {
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        bar.buttons.customize { (button) in
            button.tintColor = .gray
            button.selectedTintColor = .black
        }
        bar.indicator.weight = .light
        bar.indicator.tintColor = .black
        bar.indicator.overscrollBehavior = .none
        addBar(bar, dataSource: self, at: .top)
    }
    
    @objc func goToCart() {
        let vc = UIStoryboard(name: "CartStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension StoreTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        return TMBarItem(title: menuList[index])
    }
    
}
