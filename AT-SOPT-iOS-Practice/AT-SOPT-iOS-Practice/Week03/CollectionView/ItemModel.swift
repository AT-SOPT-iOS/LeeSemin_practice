//
//  ItemModel.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/26/25.
//

import UIKit

struct ItemModel {
    let item: UIImage
    let name: String
    let price: String
    var isLiked: Bool
}

extension ItemModel {
    static let mockData: [ItemModel] = [
        ItemModel(item: .item1, name: "퉁퉁퉁사후르", price: "5,000", isLiked: false),
        ItemModel(item: .item2, name: "오쏘몰", price: "5,000", isLiked: false),
        ItemModel(item: .item3, name: "애플워치", price: "5,000", isLiked: true),
        ItemModel(item: .item4, name: "가방", price: "5,000", isLiked: true),
        ItemModel(item: .item5, name: "헤드셋", price: "5,000", isLiked: true),
        ItemModel(item: .item1, name: "틴트", price: "5,000", isLiked: false),
        ItemModel(item: .item2, name: "카메라", price: "5,000", isLiked: false),
        ItemModel(item: .item3, name: "로션", price: "5,000", isLiked: false),
        ItemModel(item: .item4, name: "락스", price: "5,000", isLiked: false),
        ItemModel(item: .item5, name: "가방", price: "5,000", isLiked: false),
        ItemModel(item: .item1, name: "헤드셋", price: "5,000", isLiked: false),
        ItemModel(item: .item2, name: "틴트", price: "5,000", isLiked: false)
    ]
}
