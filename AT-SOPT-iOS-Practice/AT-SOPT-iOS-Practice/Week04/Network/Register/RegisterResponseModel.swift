//
//  RegisterResponseModel.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/3/25.
//

import Foundation

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseModel
}

struct RegisterResponseModel: Codable {
    let userId: Int
    let nickname: String
}
