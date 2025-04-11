//
//  LoginViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/5/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: UIScreen.centeredFrame(y: 163, width: 236, height: 60))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .subhead1
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: UIScreen.centeredFrame(y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = .subhead4
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        textField.setLeftPadding(25)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: UIScreen.centeredFrame(y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = .subhead4
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        textField.setLeftPadding(25)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: UIScreen.centeredFrame(y: 422, width: 335, height: 57))
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(descriptionLabel, idTextField, passwordTextField, loginButton)
    }
    
    @objc func loginButtonTapped() {
        let nextVC = WelcomeViewController()
        
        //        nextVC.id = idTextField.text
        nextVC.setLabelText(id: idTextField.text)
        
        // push
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        // 모달
        //        self.present(nextVC,animated: true)
    }
}
