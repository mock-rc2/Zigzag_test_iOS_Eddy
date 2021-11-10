//
//  ReviewTabViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/10.
//

import UIKit
import Tabman
import Pageboy

class ReviewTabViewController: TabmanViewController {

    private let menuList: [String] = ["작성 가능한 리뷰", "작성한 리뷰"]
    private var viewControllers = [UIStoryboard(name: "MyPageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ReviewVC") as! ReviewViewController, UIStoryboard(name: "MyPageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "AlreadyReviewVC") as! AlreadyReviewViewController]

    
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
        self.navigationItem.title = "리뷰"
        self.navigationItem.leftBarButtonItem = leftBarButton
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

extension ReviewTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
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
