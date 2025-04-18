//
//  UITextField+.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/11/25.
//

import UIKit

extension UITextField {
    func setLeftPadding(_ width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
