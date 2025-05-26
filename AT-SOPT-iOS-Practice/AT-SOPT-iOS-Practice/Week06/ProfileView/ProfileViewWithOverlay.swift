//
//  ProfileViewWithOverlay.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/26/25.
//

import SwiftUI

struct ProfileViewWithOverlay: View {
    var body: some View {
        VStack {
            Image(.glassesDumpling)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(ProfileViewDetail(), alignment: .bottom)
        }
    }
}

struct ProfileViewDetail: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("안경만두")
                    .font(.headline)
                Text("안경만두를 보신 적 있으신가요")
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
        .foregroundColor(.primary)
        .background(Color.primary.colorInvert().opacity(0.75))
    }
}

#Preview {
    ProfileViewWithOverlay()
}
