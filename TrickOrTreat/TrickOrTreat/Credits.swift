//
//  Credits.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//
import SwiftUI

struct Credits: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isAnimating = false // Mude para false
    
    var body: some View {
        ZStack {
            Color(.roxo)
                .ignoresSafeArea()
            
            HStack {
                VStack {
                    Button(action: {
                        dismiss()
                        hapticManager.play(option: (.pop()))
                    }, label: {
                        LittleButton(color: .laranja, imageName: "chevron.left")
                    })
                    Spacer()
                }
                Spacer()
            }
            
            VStack {
                Text("Créditos")
                    .font(.sigmar(size: 36))
                    .foregroundStyle(.branco)
                
                Spacer()
            }
            
            ScrollView {
                VStack(spacing: 32) {
                    
                    Divider(image: "bruxa")
                    
                    Text("Trick or Treak é um jogo casual de point-and-click onde você ajuda a bruxinha Carlinha a preparar poções mágicas para o Halloween.")
                        .font(.sil(size: 20))
                        .foregroundStyle(.branco)
                    
                    CauldronAnimation(isAnimating: $isAnimating)
                    
                    Text("Entre no caldeirão da diversão, você é o ajudante especial da bruxinha Carlinha. Selecione três ingredientes misteriosos e veja a magia acontecer: cada combinação transforma Carlinha em um novo visual de Halloween! Mas atenção: nem todas as poções saem como esperado...")
                        .font(.sil(size: 20))
                        .foregroundStyle(.branco)
                    
                    Divider(image: "bruxaBoom")
                    
                    Text("Produzido por: Jofi, Luna e Mih.")
                        .font(.sigmar(size: 16))
                        .foregroundStyle(.branco)
                    
                }
                .padding(.horizontal, 24)
            }
            .padding(.top, 80)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            isAnimating = true // Ativa a animação quando a view aparecer
        }
    }
}

struct Divider: View {
    var image: String
    
    var body: some View {
        HStack(spacing: 40) {
            StarAnimation(rotation: 360)
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 80)
            
            StarAnimation(rotation: -360)
        }
    }
}
