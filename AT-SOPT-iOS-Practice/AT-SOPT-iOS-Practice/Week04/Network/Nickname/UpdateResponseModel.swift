//
//  UpdateResponseModel.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/6/25.
//

import Foundation

struct UpdateResponseModel: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: String?
}
