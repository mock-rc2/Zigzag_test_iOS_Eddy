//
//  CompleteViewController.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/01.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var timer: Timer = Timer()
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTransparent = true
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }

    @objc func timerCounter() -> Void {
        count += 1
        if count == 4 {
            timer.invalidate()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}
