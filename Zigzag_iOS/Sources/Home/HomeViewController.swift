//
//  HomeViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/10/30.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let menuList: [String] = ["홈", "Brand", "베스트", "세일"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setCollectionView()
        setFirstIndexIsSelected()
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
    
    func setCollectionView() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.reloadData()
    }
    
    func setFirstIndexIsSelected() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom) // 0번째 Index로
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4 , height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeMenuCell", for: indexPath) as? HomeMenuCell
        else {
            return UICollectionViewCell()
        }
        if indexPath.item == 0 {
            cell.isSelected = true
        } else {
            cell.isSelected = false
        }
        cell.menuLabel.text = menuList[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
