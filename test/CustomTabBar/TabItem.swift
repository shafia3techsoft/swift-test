//
//  TabItem.swift
//  test
//
//  Created by shafia on 07/08/2025.
//

import SwiftUI

struct TabItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    @State private var bounce = false
    
    var body: some View {
        Button(action: {
            bounce = true
            action()
            // Reset after animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                bounce = false
            }
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .bold()
                    .font(.system(size: 24))
                    .scaleEffect(bounce ? 1.2 : 1.0)
                    .foregroundColor(isSelected ? Defs.darkPurpleColor : .black)
                    .animation(.interpolatingSpring(stiffness: 300, damping: 15), value: bounce)
                
                if isSelected {
                    Text(title)
                        .font(.caption)
                        .foregroundColor(Defs.darkPurpleColor)
                }
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
        }
    }
}

//#Preview {
//    TabItem()
//}
