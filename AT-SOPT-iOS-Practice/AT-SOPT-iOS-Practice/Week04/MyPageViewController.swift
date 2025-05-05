//
//  MyPageViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/6/25.
//

import UIKit

import SnapKit
import Then

final class MyPageViewController: UIViewController {
    
    private var nickName: String = ""
    
    private lazy var nickNameTextField = UITextField().then {
        $0.placeholder = "닉네임"
        $0.borderStyle = .roundedRect
        $0.textColor = .black
    }
    
    private let changeButton = UIButton().then {
        $0.setTitle("수정하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = UIColor(red: 0.96, green: 0.87, blue: 0.7, alpha: 1.0)
        $0.layer.borderColor = UIColor(red: 0.96, green: 0.87, blue: 0.7, alpha: 1.0).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setAddTargets()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(nickNameTextField, changeButton)
    }
    
    private func setLayout() {
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(120)
        }
        
        changeButton.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(100)
        }
        
        [nickNameTextField, changeButton].forEach {
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.width.equalTo(300)
                $0.height.equalTo(50)
            }
        }
    }
    
    private func setAddTargets() {
        nickNameTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        
        //        changeButton.addTarget(self, action: #selector(), for: .touchUpInside)
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.nickName = textField.text ?? ""
    }
}
