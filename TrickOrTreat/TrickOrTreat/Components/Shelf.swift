//
//  Shelf.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//

import SwiftUI

struct Shelf: View {
    @ObservedObject var gameState: GameState
    var onItemSelected: () -> Void // Adicione este callback
    
    let columns = [
        GridItem(.fixed(100), spacing: 8),
        GridItem(.fixed(100), spacing: 2),
        GridItem(.fixed(100), spacing: 2)
    ]
    
    let targetPosition = CGPoint(x: 0, y: 200)
    
    var body: some View {
        ZStack {
            Image("shelf")
                .resizable()
                .scaledToFit()
                .frame(width: 340)

            LazyVGrid(columns: columns, spacing: 52) {
                ForEach(0..<12, id: \.self) { index in
                    Button {
                        handleTap(index)
                    } label: {
                        Image(gameState.images[index].getImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36)
                            .opacity(
                                gameState.selectedItems.count >= 3 && !gameState.selectedItems.contains(index)
                                ? 0.4
                                : gameState.itemsOpacity[index] ?? 1.0
                            )
                            .offset(
                                x: gameState.itemsPosition[index]?.x ?? 0,
                                y: gameState.itemsPosition[index]?.y ?? 0
                            )
                    }
                    .disabled(gameState.selectedItems.contains(index))
                }
            }
            .padding(.top, 20)
        }
    }
    
    func selectItem(_ index: Int) {
        guard gameState.selectedItems.count < 3 else { return }
        
        gameState.selectedItems.append(index)
        
        // Chama o callback para fazer a bruxa pular
        onItemSelected()
        hapticManager.play(option: (.pop()))

        withAnimation(.easeInOut(duration: 0.8)) {
            gameState.itemsPosition[index] = targetPosition
            gameState.itemsOpacity[index] = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            if gameState.selectedItems.count == 3 {
                print("Todos os 3 itens foram selecionados!")
            }
        }
    }
    
    func handleTap(_ index: Int) {
        if gameState.selectedItems.count >= 3 {
            hapticManager.play(option: .wrongAnswerStandard())
            return
        }

        selectItem(index)
    }
}

#Preview {
    Shelf(gameState: GameState()) {
    }
}
