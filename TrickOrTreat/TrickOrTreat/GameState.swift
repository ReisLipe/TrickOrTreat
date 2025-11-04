//
//  GameState.swift
//  TrickOrTreat
//
//  Created by mih on 04/11/25.
//

import SwiftUI

class GameState: ObservableObject {
    @Published var selectedItems: [Int] = []
    @Published var itemsOpacity: [Int: Double] = [:]
    @Published var itemsPosition: [Int: CGPoint] = [:]
    
    let images = ["acucar", "sangue", "calda", "acucar", "sangue", "calda","acucar", "sangue", "calda","acucar", "sangue", "calda"]
    
    func resetSelection() {
        selectedItems.removeAll()
        itemsOpacity.removeAll()
        itemsPosition.removeAll()
    }
}
