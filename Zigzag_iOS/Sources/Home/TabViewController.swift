//
//  HomeViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {

    private let menuList: [String] = ["홈", "Brand", "베스트", "세일"]
    private var viewControllers = [UIViewController(), UIViewController(), UIViewController(), UIViewController()]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.dataSource = self
        setBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        let logoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        logoButton.setBackgroundImage(UIImage(named: "zigzaghomelogo"), for: .normal)
        let leftBarButton = UIBarButtonItem(customView: logoButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.searchTextField.layer.cornerRadius = 15
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 12)
        self.navigationItem.titleView = searchBar
        
        // UIView를 오른쪽 customView에 연결
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.mainPink
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

}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
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

