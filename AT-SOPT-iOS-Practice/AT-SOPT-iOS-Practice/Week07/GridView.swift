//
//  GridView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/26/25.
//

import SwiftUI

struct GridView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { index in
                    VStack {
                        Rectangle()
                            .fill(Color.orange)
                            .frame(height: 100)
                            .cornerRadius(10)
                        
                        Text("아이템 \(index)")
                            .font(.headline)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridView()
}
