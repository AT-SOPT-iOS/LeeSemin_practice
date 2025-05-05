//
//  RegisterRequestModel.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/3/25.
//

import Foundation

struct RegisterRequestModel: Codable {
    let loginId: String
    let password: String
    let nickname: String
}
