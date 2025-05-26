//
//  SheetView.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/26/25.
//

import SwiftUI

struct SheetView: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("메인 화면")
                .font(.largeTitle)
            
            Button("시트 열기") {
                isSheetPresented = true
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetDetailView(isSheetPresented: $isSheetPresented)
        }
    }
}

#Preview {
    SheetView()
}
