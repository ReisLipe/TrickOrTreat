//
//  ResultPopup.swift
//  TrickOrTreat
//
//  Created by mih on 04/11/25.
//

import SwiftUI

struct ResultPopup: View {
    @ObservedObject var gameState: GameState // Mude para @ObservedObject
    @Binding var isShowing: Bool
    let resultImage: String
    
    var body: some View {
        ZStack {
            // Fundo escuro
            Color.black.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture {
                    closePopup()
                }
            
            // Popup
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.azulEscuro)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 140)
                
                VStack(spacing: 40) {
                    Text("Receita Completa!")
                        .font(.sigmar(size: 32))
                        .foregroundStyle(.white)
                    
                    Image(resultImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140)
                    
                    Button {
                        closePopup()
                    } label: {
                        Text("Fechar")
                            .font(.sigmar(size: 24))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color.roxo)
                            .cornerRadius(12)
                            .shadow(color: .white, radius: 0, x: -4, y: 4)
                    }
                }
            }
            .scaleEffect(isShowing ? 1 : 0.5)
            .opacity(isShowing ? 1 : 0)
        }
    }
    
    func closePopup() {
        isShowing = false
        withAnimation(.easeInOut(duration: 0.5)) {
            gameState.resetSelection()
        }
    }
}

#Preview {
    ResultPopup(gameState: GameState(), isShowing: .constant(true), resultImage: "acucar")
}
