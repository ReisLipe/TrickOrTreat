//
//  Game.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//

import SwiftUI

struct Game: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Image("bg2")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        LittleButton(color: .roxo, imageName: "chevron.left")
                    }
                    
                    Spacer()
                    
                    Text("0/3")
                        .font(.sigmar(size: 40))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    LittleButton(color: .roxo, imageName: "book.fill")
                }
                .padding(.trailing, 24)
                
                Spacer()
            }
            
            Image("shelf")
                .resizable()
                .scaledToFit()
                .frame(width: 360)
                .padding(.bottom, 140)
            
            VStack {
                Spacer()
                
                CauldronAnimation()
                    .scaleEffect(1.3)
                    .padding(.bottom, 50)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Image("bruxa")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .shadow(color: .white.opacity(1), radius: 0, x: 6, y: 2)
                    
                    Spacer()
                    
                    VStack {
                        LittleButton(color: .roxo, imageName: "arrow.trianglehead.counterclockwise.rotate.90")
                        
                        Spacer()
                        
                        LittleButton(color: .roxo, imageName: "checkmark")
                            .scaleEffect(1.4)
                            .padding(.trailing, 10)
                            .padding(.bottom, 10)
                    }
                }
                .frame(height: 200)
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    Game()
}
