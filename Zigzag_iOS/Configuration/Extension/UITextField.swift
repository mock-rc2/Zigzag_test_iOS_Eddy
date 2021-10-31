//
//  UITextField.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/01.
//

import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
        leftView = paddingView
        leftViewMode = ViewMode.always
    }
}
