//
//  User.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/26/25.
//

import Foundation

struct User: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let age: Int
}

let userDummy = [
    User(name: "김가현", age: 29),
    User(name: "이세민", age: 25),
    User(name: "사람", age: 36)
]
