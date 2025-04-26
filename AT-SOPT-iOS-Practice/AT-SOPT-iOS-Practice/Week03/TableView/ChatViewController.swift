//
//  ChatViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/26/25.
//

import UIKit

import SnapKit
import Then

final class ChatViewController: UIViewController{
    
    private let chatList = ChatModel.mockData
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setDelegate()
    }
    
    private func setStyle() {
        tableView.do{
            $0.register(ChatTableViewCell.self,
                        forCellReuseIdentifier: ChatTableViewCell.identifier)
            $0.rowHeight = 72
        }
    }
    
    private func setUI() {
        view.addSubview(tableView)
    }
    
    private func setLayout(){
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        //        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.identifier,
            for: indexPath
        ) as? ChatTableViewCell else { return UITableViewCell() }
        cell.configure(chat: chatList[indexPath.row])
        return cell
    }
}
