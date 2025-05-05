//
//  NetworkLoginViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/3/25.
//

import UIKit

import SnapKit
import Then

final class NetworkLoginViewController: UIViewController {
    
    private var id: String = ""
    private var password: String = ""
    private var nickName: String = ""
    
    private func createTextField(placeholder: String) -> UITextField {
        return UITextField().then {
            $0.placeholder = placeholder
            $0.borderStyle = .roundedRect
            $0.textColor = .black
        }
    }
    
    private lazy var idTextField = createTextField(placeholder: "아이디")
    private lazy var passwordTextField = createTextField(placeholder: "패스워드")
    private lazy var nickNameTextField = createTextField(placeholder: "닉네임")
    
    private let registerButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textColor = .black
        $0.backgroundColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0)
        $0.layer.borderColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.textColor = .black
        $0.backgroundColor = UIColor(red: 1.0, green: 0.95, blue: 0.7, alpha: 1.0)
        $0.layer.borderColor = UIColor(red: 1.0, green: 0.95, blue: 0.7, alpha: 1.0).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    
    private let infoViewButton = UIButton().then {
        $0.setTitle("회원정보 조회", for: .normal)
        $0.titleLabel?.textColor = .black
        $0.backgroundColor = UIColor(red: 0.6, green: 0.8, blue: 0.6, alpha: 1.0)
        $0.layer.borderColor = UIColor(red: 0.6, green: 0.8, blue: 0.6, alpha: 1.0).cgColor
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
        view.addSubviews(idTextField, passwordTextField, nickNameTextField, registerButton, loginButton, infoViewButton)
    }
    
    private func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(70)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(20)
        }
        
        infoViewButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        [idTextField, passwordTextField, nickNameTextField, registerButton, loginButton, infoViewButton].forEach {
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.width.equalTo(300)
                $0.height.equalTo(50)
            }
        }
    }
    
    private func setAddTargets() {
        idTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        passwordTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        nickNameTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        infoViewButton.addTarget(self, action: #selector(infoViewButtonTapped), for: .touchUpInside)
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickName = textField.text ?? ""
        }
    }
    
    @objc private func registerButtonTapped() {
        Task {
            do {
                let response = try await RegisterService.shared.postRegisterData(loginId: self.id,
                                                                                 password: self.password,
                                                                                 nickName: self.nickName)
                
                let alert = UIAlertController(
                    title: "계정 생성 성공",
                    message: "환영합니다, \(response.nickname)님! (ID: \(response.userId))",
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "계정 생성 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("회원가입 에러:", error)
            }
        }
    }
    
    @objc private func loginButtonTapped() {
        Task {
            do {
                let response = try await LoginService.shared.postLoginData(loginId: self.id, password: self.password)
                
                let alert = UIAlertController(
                    title: "로그인 성공",
                    message: "환영합니다, ID: \(response.userId)",
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default) { _ in
                    let myPageVC = MyPageViewController()
                    self.present(myPageVC, animated: true)
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("로그인 에러:", error)
            }
        }
    }
    
    @objc private func infoViewButtonTapped() {
        let infoViewVC = InfoViewController()
        self.present(infoViewVC, animated: true)
    }
}
