//
//  UIScreen+.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/11/25.
//

import UIKit

extension UIScreen {
    static func centeredFrame(y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
        let screenWidth = UIScreen.main.bounds.width
        let x = (screenWidth - width) / 2
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
