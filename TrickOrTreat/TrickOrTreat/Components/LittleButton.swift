//
//  LittleButton.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//

import SwiftUI

struct LittleButton: View {
    var color: Color
    var imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(width: 40, height: 40)
            .padding(.leading, 24)
            .padding(.top, 8)
            .foregroundStyle(color)
            .shadow(color: .white.opacity(1), radius: 0, x: -4, y: 4)
            .overlay(
                Image(systemName: imageName)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 8)
                    .padding(.leading, 24)
            )
    }
}

#Preview {
    LittleButton(color: .laranja, imageName: "chevron.left")
}
