//
//  NicknameResponseModel.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/3/25.
//

import Foundation

struct NicknameResponseWrapper<T: Codable>: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: T
}

struct NicknameListResponseModel: Codable {
    let nicknameList: [String]
}

struct NicknameResponseModel: Codable {
    let nickname: String
}
