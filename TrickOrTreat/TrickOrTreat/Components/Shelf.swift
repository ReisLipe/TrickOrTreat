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

            LazyVGrid(columns: columns, spacing: 44) {
                ForEach(0..<12, id: \.self) { index in
                    Button {
                        selectItem(index)
                    } label: {
                        Image(gameState.images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36)
                            .opacity(gameState.itemsOpacity[index] ?? 1.0)
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
}

#Preview {
    Shelf(gameState: GameState()) {
    }
}
