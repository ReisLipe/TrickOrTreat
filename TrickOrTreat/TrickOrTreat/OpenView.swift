//
//  OpenView.swift
//  TrickOrTreat
//
//  Created by Joao Filipe Reis Justo da Silva on 10/10/25.
//

import SwiftUI

struct OpenView: View {
    @State private var zoom: CGFloat = 1
    
    private var logoHeight: CGFloat = 160
    private var optionHeight: CGFloat = 70
    
    var body: some View {
        NavigationStack {
            ZStack {
                animatedBackground
                
                VStack {
                    Spacer()
                    VStack(spacing: 32) {
                        OptionLink(title: "jogar", color: .roxo, height: optionHeight) { GameView() }
                        OptionLink(title: "créditos", color: .laranja, height: optionHeight) { Credits() }
                    }
                    .padding(.horizontal, 56)
                }
                .padding(24)
                .padding(.bottom, 60)
            }
        }
        .onAppear {
            startAnimation()
        }
    }
}

// MARK: - Animation

extension OpenView {
    var animatedBackground: some View {
        Image("bg1")
            .resizable()
            .scaledToFill()
            .scaleEffect(zoom)
            .ignoresSafeArea()
    }
    
    func startAnimation() {
        withAnimation(
            .easeInOut(duration: 6).repeatForever(autoreverses: true)
        ) {
            zoom = 1.2
        }
    }
}

#Preview {
    OpenView()
}
