//
//  SettingUserInfoViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/12.
//

import UIKit

class SettingUserInfoViewController: UIViewController {

    @IBOutlet weak var userInfoTableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var withdrawButton: UIButton!
    
    var valueArray: [[String]] = [["회원정보 수정", "체형 정보"], ["간편결제 관리", "환불계좌 관리"], ["로그아웃"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTitle()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.isTransparent = true
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.title = "내 정보"
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func setTitle() {
        userEmailLabel.text = AuthData.email
    }
    
    @objc func backToPrevious() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func withDrawButtonTap(_ sender: Any) {
        AuthRequest().withDrawData(viewController: self)
    }
}

extension SettingUserInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 8
        }

    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = userInfoTableView.dequeueReusableHeaderFooterView(withIdentifier: "settingUserInfoHeaderView") as? SettingUserInfoHeaderView else {
            return nil
        }
        
        return header
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageUserCell", for: indexPath) as? MyPageUserCell else { return UITableViewCell() }
        
        cell.titleLabel.text = valueArray[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
}

extension SettingUserInfoViewController {
    func successWithDraw() {
        presentBottomAlert(message: "탈퇴에 성공하셨습니다.")
        AuthData.email = nil
        AuthData.jwtToken = nil
        AuthData.isLogin = false
        AuthData.userIdx = nil
        navigationController?.popViewController(animated: true)
    }
    func faliureWithDraw() {
        presentBottomAlert(message: "탈퇴에 실패하셨습니다.")
    }
}
