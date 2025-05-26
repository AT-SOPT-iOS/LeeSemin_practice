//
//  InstagramChatView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/17/25.
//

import SwiftUI

struct InstagramChatView: View {
    let users = ["가현", "혜연", "치욱", "나연", "석기", "세민"]
    let messages = [
        "안녕하세요!",
        "영화 보러 가자요 ",
        "사진 잘 봤어요!",
        "내일 점심 어때요?",
        "내 말 들리나요",
        "배고프다"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(users, id: \.self) { user in
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.blue)
                            
                            Circle()
                                .fill(Color.green)
                                .frame(width: 15, height: 15)
                                .offset(x: 0, y: -2)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            
            List {
                ForEach(0..<users.count, id: \.self) { index in
                    HStack(spacing: 12) {
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                            
                            Circle()
                                .fill(Color.green)
                                .frame(width: 12, height: 12)
                                .offset(x: 0, y: -2)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(users[index])
                                .font(.headline)
                            
                            Text(messages[index])
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        Text("오전 9:41")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    InstagramChatView()
}
