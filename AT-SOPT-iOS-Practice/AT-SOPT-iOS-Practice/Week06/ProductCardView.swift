//
//  ProductCardView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/17/25.
//

import SwiftUI

struct ProductCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                Image(.product3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 240, height: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Image(.redHeart)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(8)
            }
            
            HStack(spacing: 8) {
                Text("갤럭시 워치")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("상암동")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text("1,000,000원")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.orange)
        }
        .padding()
    }
}


#Preview {
    ProductCardView()
}

