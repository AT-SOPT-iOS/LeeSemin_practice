//
//  ColorViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/12/25.
//

import UIKit

class ColorViewController: UIViewController {
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        [yellowView, greenView, blackView, blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout(){
        let height = UIScreen.main.bounds.height / 4
        let width = UIScreen.main.bounds.width / 2
        NSLayoutConstraint.activate([yellowView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     yellowView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     yellowView.heightAnchor.constraint(equalToConstant: height),
                                     yellowView.widthAnchor.constraint(equalToConstant: width)])
        
        NSLayoutConstraint.activate([greenView.topAnchor.constraint(equalTo: self.yellowView.bottomAnchor),
                                     greenView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     greenView.heightAnchor.constraint(equalToConstant: height),
                                     greenView.widthAnchor.constraint(equalToConstant: width)])
        
        NSLayoutConstraint.activate([blackView.topAnchor.constraint(equalTo: self.greenView.bottomAnchor),
                                     blackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     blackView.heightAnchor.constraint(equalToConstant: height),
                                     blackView.widthAnchor.constraint(equalToConstant: width)])
        
        NSLayoutConstraint.activate([blueView.topAnchor.constraint(equalTo: self.blackView.bottomAnchor),
                                     blueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     blueView.heightAnchor.constraint(equalToConstant: height),
                                     blueView.widthAnchor.constraint(equalToConstant: width)])
    }
}
