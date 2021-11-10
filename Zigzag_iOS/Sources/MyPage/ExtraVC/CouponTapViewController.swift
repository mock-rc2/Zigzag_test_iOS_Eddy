//
//  CouponTapViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/10.
//

import UIKit
import Tabman
import Pageboy

class CouponTabViewController: TabmanViewController {

    private let menuList: [String] = ["보유", "완료ㆍ만료"]
    private var viewControllers = [UIStoryboard(name: "MyPageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CouponVC") as! CouponViewController, UIStoryboard(name: "MyPageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ExpireCouponVC") as! ExpireCouponViewController]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.dataSource = self
        setBar()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.title = "쿠폰"
        self.navigationItem.leftBarButtonItem = leftBarButton
        let rightButton = UIButton()
        rightButton.setTitle("등록", for: .normal)
        rightButton.tintColor = .black
        let rightBarButton = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
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
    
    @objc func backToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CouponTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
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
