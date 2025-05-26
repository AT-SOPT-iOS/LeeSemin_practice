//
//  SheetDetailView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/26/25.
//

import SwiftUI

struct SheetDetailView: View {
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("시트 뷰")
                    .font(.title)
                
                Button("닫기") {
                    isSheetPresented = false
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
}
