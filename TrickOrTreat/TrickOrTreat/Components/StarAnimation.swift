//
//  StarAnimation.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//

import SwiftUI

struct StarAnimation: View {
    @State private var isShining = false
    var rotation: Double
    
    var body: some View {
        Image("star")
            .resizable()
            .scaledToFit()
            .frame(width: 40)
            .opacity(isShining ? 1 : 0)
            .scaleEffect(isShining ? 1 : 0.8)
            .rotationEffect(.degrees(isShining ? rotation : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    isShining = true
                }
            }
    }
}

#Preview {
    StarAnimation(rotation: 360)
}
