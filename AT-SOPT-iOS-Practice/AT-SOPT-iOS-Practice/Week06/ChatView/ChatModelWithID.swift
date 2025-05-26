//
//  ChatModelWithID.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/17/25.
//

import Foundation

struct ChatModelWithID: Identifiable {
    let id = UUID()
    let profile: String
    let name: String
    let place: String
    let chat: String
    let item: String
}

let chatDummy: [ChatModelWithID] = [
    ChatModelWithID(profile: "profile1", name: "김가현", place: "광진구", chat: "내말에답장해줘", item: "product1"),
    ChatModelWithID(profile: "profile2", name: "김현수", place: "여의도", chat: "마크내사랑", item: "product2"),
    ChatModelWithID(profile: "profile3", name: "서주영", place: "잠실", chat: "마크내꺼", item: "product3"),
    ChatModelWithID(profile: "profile4", name: "권석기", place: "회기", chat: "나는 민경훈", item: "product4"),
    ChatModelWithID(profile: "profile5", name: "김나연", place: "미국", chat: "타코팔러가야돼", item: "product5"),
    ChatModelWithID(profile: "profile6", name: "정정욱", place: "중국", chat: "보쌈정식13000원", item: "product6"),
    ChatModelWithID(profile: "profile7", name: "서상원", place: "일본", chat: "잠실의주인은두산이다", item: "product7"),
    ChatModelWithID(profile: "profile8", name: "임재현", place: "태국", chat: "뒷풀이갈게", item: "product8"),
    ChatModelWithID(profile: "profile9", name: "이은지", place: "명왕성", chat: "은지야술먹자", item: "product9"),
    ChatModelWithID(profile: "profile10", name: "성현주", place: "안드로메다", chat: "응애~", item: "product10"),
    ChatModelWithID(profile: "profile11", name: "김한열", place: "뭘보슈", chat: "생일추카해한열오빠", item: "product11")
]
