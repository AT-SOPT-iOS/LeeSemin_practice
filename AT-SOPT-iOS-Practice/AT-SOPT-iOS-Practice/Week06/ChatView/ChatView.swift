//
//  ChatView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/17/25.
//

import SwiftUI

struct ChatView: View {
    let chats: [ChatModelWithID]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("채팅")
                .font(.title)
                .fontWeight(.bold)
                .padding([.top, .horizontal])
            
            List(chats) { chat in
                ChatRow(chat: chat)
            }
            .listStyle(PlainListStyle())
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
        }
    }
}

#Preview {
    ChatView(chats: chatDummy)
}
