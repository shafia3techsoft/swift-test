//
//  LiquidTabBar.swift
//  test
//
//  Created by shafia on 07/08/2025.
//

import SwiftUI

struct LiquidTabBar: View {
    @Binding var selected: Int
    let tabs: [(icon: String, title: String)]
    
    var body: some View {
        HStack {
            ForEach(0..<tabs.count, id: \.self) { index in
                let tab = tabs[index]
                TabItem(icon: tab.icon, title: tab.title, isSelected: selected == index) {
                    selected = index
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial) // This gives liquid/glass feel
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(.horizontal)
        .shadow(radius: 5)
    }
}

//#Preview {
//    LiquidTabBar()
//}
