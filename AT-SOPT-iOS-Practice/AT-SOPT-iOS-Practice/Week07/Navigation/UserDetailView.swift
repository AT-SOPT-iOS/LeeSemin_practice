//
//  UserDetailView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/26/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .resizable()
                .frame(width: 145, height: 120)
                .foregroundColor(.blue)
            
            Text(user.name)
                .font(.title)
                .bold()
            
            Text("나이: \(user.age)세")
                .font(.title2)
        }
        .padding()
        
        Spacer()
    }
}
