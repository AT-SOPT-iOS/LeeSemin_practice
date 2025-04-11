//
//  UIView+.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/11/25.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
