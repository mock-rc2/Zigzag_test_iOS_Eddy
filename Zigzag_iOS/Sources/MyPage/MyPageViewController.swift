//
//  MyPageViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var myPageTableView: UITableView!
    @IBOutlet weak var authOrInfoButtonView: UIView!
    @IBOutlet weak var authOrInfoTitleLabel: UILabel!
    @IBOutlet weak var authOrInfoSubtitleLabel: UILabel!
    
    @IBOutlet weak var orderOrShipButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var couponButton: UIButton!
    @IBOutlet weak var pointButton: UIButton!
    
    @IBAction func ExecuteAuthOrShowInfo(_ sender: Any) {
        if !AuthData.isLogin {
            let vc = UIStoryboard(name: "MyPageStoryboard", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let nvc = UINavigationController(rootViewController: vc)
            nvc.modalPresentationStyle = .fullScreen
            present(nvc, animated: true, completion: nil)
        } else{
            
        }
    }
    
    var valueArray: [[String]] = [["문의내역", "최근 본 상품"], ["실험실", "설정"], ["공유 리워드"], ["FAQ", "공지사항", "앱 문의 / 건의"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        myPageTableView.register(MyPageHeaderView.self, forHeaderFooterViewReuseIdentifier: "myPageHeaderView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !AuthData.isLogin {
            authOrInfoTitleLabel.text = "지그재그 로그인 및 회원가입"
            authOrInfoSubtitleLabel.text = "지금 가입하면, 특별한 쇼핑 혜택을 드려요!"
        } else{
            authOrInfoTitleLabel.text = "회원님 안녕하세요!"
            authOrInfoSubtitleLabel.text = "\(AuthData.email ?? "")"
        }
    }
        

    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        self.navigationController?.modalPresentationStyle = .fullScreen
        
        let myPageLabel = UILabel()
        myPageLabel.text = "마이페이지"
        myPageLabel.textColor = .black
        myPageLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let leftBarButton = UIBarButtonItem(customView: myPageLabel)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let noticeButton = UIButton(type: .system)
        noticeButton.setImage(UIImage(systemName: "bell"), for: .normal)
        noticeButton.tintColor = .black
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        cartButton.tintColor = .mainPink
        cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        
        let noticeBarButtonItem = UIBarButtonItem(customView: noticeButton)
        let cartBarButtonItem = UIBarButtonItem(customView: cartButton)

        self.navigationItem.rightBarButtonItems = [
        cartBarButtonItem, noticeBarButtonItem]
    }
    
    @objc func goToCart() {
        let vc = UIStoryboard(name: "CartStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 1
        case 3:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 51
        }

    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = myPageTableView.dequeueReusableHeaderFooterView(withIdentifier: "myPageHeaderView") as? MyPageHeaderView else {
            return nil
        }
        
        switch section {
        case 0:
            header.setTitleText(title: "쇼핑")
            return header
        case 1:
            header.setTitleText(title: "서비스 설정")
            return header
        case 2:
            header.setTitleText(title: "리워드")
            return header
        case 3:
            header.setTitleText(title: "고객센터")
            return header
        default:
            return nil
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath) as? MyPageCell else { return UITableViewCell() }
        cell.titleLabel.text = valueArray[indexPath.section][indexPath.row]
        return cell
    }
    
    
}
