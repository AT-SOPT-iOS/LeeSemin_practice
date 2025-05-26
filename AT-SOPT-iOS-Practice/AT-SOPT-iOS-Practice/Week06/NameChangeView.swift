//
//  NameChangeView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/17/25.
//

import SwiftUI

struct ParentView: View {
    @State var name = "세민"
    
    var body: some View {
        Text(name)
        ChildView(name: $name)
    }
}

struct ChildView: View {
    @Binding var name: String
    
    var body: some View {
        Button("이름 바꾸기") {
            name = "셈이"
        }
    }
}

#Preview {
    ParentView()
}

