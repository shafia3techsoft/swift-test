//
//  CircleShadowButton.swift
//  test
//
//  Created by shafia on 07/08/2025.
//

import SwiftUI


struct CircleShadowButton: View {
    var icon: String
    var iconColor: Color = .white
    var backgroundColor: Color = .purple
    var size: CGFloat = 50
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.white)
                .background(Defs.darkPurpleColor)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
        .padding()
    }
}


//#Preview {
//    CircleShadowButton()
//}
