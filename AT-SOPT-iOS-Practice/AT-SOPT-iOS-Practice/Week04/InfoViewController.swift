//
//  InfoViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/3/25.
//

import UIKit

import SnapKit
import Then

final class InfoViewController: UIViewController {
    
    private var keyword: String = ""
    private let userId: Int = 1
    
    private let keywordTextField = UITextField().then {
        $0.placeholder = "검색할 닉네임 키워드를 입력하세요"
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        $0.setLeftPadding(12)
    }
    
    private let searchButton = UIButton().then {
        $0.setTitle("검색", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 1.0, green: 0.95, blue: 0.7, alpha: 1.0)
        $0.layer.borderColor = UIColor(red: 1.0, green: 0.95, blue: 0.7, alpha: 1.0).cgColor
    }
    
    private let infoLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = .subhead2
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
        view.addSubviews(keywordTextField, infoLabel, searchButton)
    }
    
    private func setLayout() {
        keywordTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(keywordTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setAddTargets() {
        keywordTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .editingChanged)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.keyword = textField.text ?? ""
    }
    
    @objc private func searchButtonTapped() {
        Task {
            do {
                let nicknameList = try await GetInfoService.shared.fetchNicknameList(
                    keyword: self.keyword.isEmpty ? nil : self.keyword
                )
                
                let nickname = nicknameList.map { "\($0)" }.joined(separator: "\n")
                self.infoLabel.text = "닉네임 리스트:\n\n\(nickname)"
                
            } catch {
                self.infoLabel.text = "조회 실패: \(error.localizedDescription)"
            }
        }
    }
}
