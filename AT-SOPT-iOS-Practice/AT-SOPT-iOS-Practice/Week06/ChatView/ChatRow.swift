//
//  ChatRow.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/17/25.
//

import SwiftUI

struct ChatRow: View {
    let chat: ChatModelWithID
    
    var body: some View {
        HStack (spacing: 20) {
            Image(chat.profile)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack {
                    Text(chat.name)
                        .font(.title2)
                    Text(chat.place)
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                Text(chat.chat)
            }
            
            Spacer()
            
            Image(chat.item)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
        }
    }
}
