//
//  WelcomeViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/5/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String? = ""
    
    private let daangnImageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.centeredFrame(y: 87, width: 150, height: 150))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Daangnee")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: UIScreen.centeredFrame(y: 295, width: 96, height: 60))
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .head1
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: UIScreen.centeredFrame(y: 426, width: 335, height: 57))
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: UIScreen.centeredFrame(y: 498, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        bindID()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.addSubviews(daangnImageView, welcomeLabel, mainButton, backButton)
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    private func bindID() {
        if let id = self.id, !id.isEmpty {
            self.welcomeLabel.text = "\(id)님\n반가워요!"
        }
        else {
            self.welcomeLabel.text = "???님\n반가워요!"
        }
    }
}
