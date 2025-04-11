//
//  ViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    private var testView: UIView = UIView(frame: .init(origin: .init(x: 150, y: 100),
                                                       size: .init(width: 150, height: 150)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        testView.backgroundColor = .magenta
        
        self.view.addSubview(testView)
    }
}
