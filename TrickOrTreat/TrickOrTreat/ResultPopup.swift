//
//  ResultPopup.swift
//  TrickOrTreat
//
//  Created by mih on 04/11/25.
//

import SwiftUI

struct ResultPopup: View {
    @ObservedObject var gameState: GameState 
    @Binding var isShowing: Bool
    let recipe: Recipe?

    var body: some View {
        ZStack {
            // Fundo escuro
            Color.preto.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture {
                    closePopup()
                }
            
            // Popup
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.azulClaro)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 140)
                
                VStack(spacing: 40) {
                    Text(recipe?.name ?? "Tente novamente")                   .font(.sigmar(size: 32))
                        .foregroundStyle(.branco)
                    
                    Image(recipe?.image ?? "bruxaBoom")  
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140)
                    
                    Button {
                        closePopup()
                    } label: {
                        Text("Fechar")
                            .font(.sigmar(size: 24))
                            .foregroundStyle(.branco)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(.roxo)
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
