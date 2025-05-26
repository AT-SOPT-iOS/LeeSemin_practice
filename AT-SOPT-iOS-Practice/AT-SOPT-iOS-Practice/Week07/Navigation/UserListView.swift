//
//  UserListView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/26/25.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        NavigationStack {
            List(userDummy) { user in
                NavigationLink(value: user) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text("나이: \(user.age)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("사용자 목록")
            .navigationDestination(for: User.self) { selectedUser in
                UserDetailView(user: selectedUser)
            }
        }
    }
}

#Preview {
    UserListView()
}
