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
    
    private var userId: Int
    private var nickName: String = ""
    
    init(userId: Int) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        fetchNickname()
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
        nickNameTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .editingChanged)
        
        changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.nickName = textField.text ?? ""
    }
    
    @objc private func fetchNickname() {
        Task {
            do {
                let nickname = try await GetInfoService.shared.fetchMyNickname(userId: self.userId)
                nickNameTextField.text = nickname
            } catch {
                let alert = UIAlertController(
                    title: "내 닉네임 조회 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("내 닉네임 조회 에러: ", error)
            }
        }
    }
    
    @objc private func changeButtonTapped() {
        guard !nickName.isEmpty else {
            let alert = UIAlertController(
                title: "저기요",
                message: "수정할 닉네임을 입력해 주세요",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
            
            return
        }
        
        Task {
            do {
                let response = try await UpdateInfoService.shared.updateNickname(userId: self.userId, newNickname: nickName)
                
                let alert = UIAlertController(
                    title: "닉네임 변경 성공",
                    message: "변경된 닉네임: \(nickName)",
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "닉네임 변경 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("닉네임 변경 에러: ", error)
            }
        }
    }
}
