//
//  AdBannerCell.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/02.
//

import UIKit

class AdBannerTableViewCell: UITableViewCell {

    @IBOutlet weak var adCollectionView: UICollectionView!
    
    var nowPage: Int = 0
    let imageList: [UIImage?] = [UIImage(named: "zigzagAd"), UIImage(named: "zigzagAd"), UIImage(named: "zigzagAd")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        adCollectionView.delegate = self
        adCollectionView.dataSource = self
        bannerTimer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // 2초마다 실행되는 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == imageList.count-1 {
        // 맨 처음 페이지로 돌아감
            adCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        adCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }

}

extension AdBannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: adCollectionView.frame.width , height: adCollectionView.frame.height-(adCollectionView.safeAreaInsets.top + adCollectionView.safeAreaInsets.bottom))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdBannerCVC", for: indexPath) as? AdBannerCollectionViewCell else { return UICollectionViewCell() }
        cell.adImageView.image = imageList[indexPath.item]
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}
