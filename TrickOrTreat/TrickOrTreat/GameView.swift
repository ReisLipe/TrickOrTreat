//
//  Game.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//

import SwiftUI
import SwiftfulHaptics

struct GameView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var gameState = GameState()
    @State private var isAnimatingCauldron = false
    @State private var showPopup = false
    @State private var resultRecipe: Recipe?
    @State private var witchJump = false // Adicione este State
    @State private var cauldronPulse = false

    var body: some View {
        ZStack {
            Image("bg2")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                        hapticManager.play(option: (.pop()))
                    } label: {
                        LittleButton(color: .roxo, imageName: "chevron.left")
                    }
                    
                    Spacer()
                    
                    Text("\(gameState.selectedItems.count)/3")
                        .font(.sigmar(size: 40))
                        .foregroundStyle(.branco)
                        .shadow(color: .roxo, radius: 0, x: -4, y: 4)
                    
                    Spacer()
                    
                    NavigationLink(destination: RecipeBook().navigationBarBackButtonHidden()) {
                        LittleButton(color: .roxo, imageName: "book.fill")
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        hapticManager.play(option: (.pop()))
                    })
                }
                .padding(.trailing, 24)
                
                Spacer()
            }
            
            Shelf(gameState: gameState, onItemSelected: {
                // Callback quando um item for selecionado
                makeWitchJump()
            })
                .padding(.bottom, 130)
            
            VStack {
                Spacer()
                
                CauldronAnimation(isAnimating: $isAnimatingCauldron)
                    .scaleEffect(isAnimatingCauldron ? (cauldronPulse ? 1.45 : 1.3) : 1.3)
                    .padding(.bottom, 50)
                    .animation(.easeInOut(duration: 0.3), value: cauldronPulse)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Image("bruxa")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .shadow(color: .branco.opacity(1), radius: 0, x: 6, y: 2)
                        .offset(y: witchJump ? -20 : 0)
                        .rotationEffect(.degrees(witchJump ? -5 : 0))
                        .animation(.spring(response: 0.3, dampingFraction: 0.5), value: witchJump)
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                gameState.resetSelection()
                            }
                        } label: {
                            LittleButton(color: .roxo, imageName: "arrow.trianglehead.counterclockwise.rotate.90")
                        }
                        
                        Spacer()
                        
                        Button {
                            confirmRecipe()
                        } label: {
                            LittleButton(color: .roxo, imageName: "checkmark")
                                .scaleEffect(1.4)
                                .padding(.trailing, 10)
                                .padding(.bottom, 10)
                        }
                        .disabled(gameState.selectedItems.count != 3)
                        .opacity(gameState.selectedItems.count == 3 ? 1 : 0.5)
                    }
                }
                .frame(height: 200)
                .padding(.horizontal, 20)
            }
            
            // Popup
            if showPopup {
                ResultPopup(gameState: gameState, isShowing: $showPopup, recipe: resultRecipe)
                    .transition(.opacity)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func makeWitchJump() {
        witchJump = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            witchJump = false
        }
    }
    
    func confirmRecipe() {
        isAnimatingCauldron = true
        pulseCauldron()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isAnimatingCauldron = false
            resultRecipe = determineRecipe()

            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                showPopup = true
            }
        }
    }
    
    func pulseCauldron() {
        guard isAnimatingCauldron else { return }

        cauldronPulse.toggle()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            hapticManager.play(option: .inflate())
            pulseCauldron()
        }
    }

    func determineRecipe() -> Recipe? {
        let selectedIngredients = gameState.selectedItems.map { gameState.images[$0] }
        let selectedSet = Set(selectedIngredients)

        return allRecipes.first { Set($0.ingredients) == selectedSet }
    }

}

#Preview {
    GameView()
}
