//
//  GameState.swift
//  TrickOrTreat
//
//  Created by mih on 04/11/25.
//

import SwiftUI

enum IngredientType: String {
    case sugar = "Açucar Escuro"
    case blood = "Sangue Doce"
    case syrup = "Calda Carmesim"
    case flour = "Farinha Enfeitiçada"
    case nectar = "Néctar Roxo"
    case mashed = "Purê de Abóbora"
    case rocks = "Pedrinhas da Noite"
    case essence = "Essência Escura"
    case milk = "Leite Noturno"
    case honey = "Mel Sombrio"
    case powder = "Pó das Sombras"
    case cream = "Creme Lunar"
    
    
    var getImageName: String {
        switch self {
        case .sugar: return "acucarEscuro"
        case .blood: return "sangueDoce"
        case .syrup: return "caldaCarmesim"
        case .flour: return "farinhaEnfeiticada"
        case .nectar: return "nectarRoxo"
        case .cream: return "cremeLunar"
        case .mashed: return "pureDeAbobora"
        case .rocks: return "pedrinhasDaNoite"
        case .essence: return "essenciaNoturna"
        case .milk: return "leiteNoturno"
        case .powder: return "poDasSombras"
        case .honey: return "melSombrio"
        }
    }
}

enum RecipesTypes: String {
    case calaboquinha = "Calaboquinha"
    case mas = "Mas"
    case naogrita = "NaoGrita"
    // TODO: Adicionar receitas depois
}

class GameState: ObservableObject {
    @Published var selectedItems: [Int] = []
    @Published var itemsOpacity: [Int: Double] = [:]
    @Published var itemsPosition: [Int: CGPoint] = [:]
    
    let images: [IngredientType] = [
        .sugar, .blood, .syrup,
        .flour, .nectar, .cream,
        .mashed, .rocks, .essence,
        .milk, .powder, .honey
    ]
    
    func resetSelection() {
        selectedItems.removeAll()
        itemsOpacity.removeAll()
        itemsPosition.removeAll()
    }
}

// Coloque isso fora das views, pode ser em um arquivo separado ou no topo
let allRecipes: [Recipe] = [
    Recipe(
        name: "Doce Sangue",
        image: "bruxaVampira",
        character: "Bruxa vampira",
        ingredients: [.sugar, .blood, .syrup],
        description: "Um elixir doce e intenso que brilha à luz da lua."
    ),
    Recipe(
        name: "Cheesecake Enfeitiçado",
        image: "bruxaLua",
        character: "Bruxa da Lua",
        ingredients: [.nectar, .cream, .rocks],
        description: "Cremoso, ácido e misterioso."
    ),
    Recipe(
        name: "Brownie de Lápide",
        image: "bruxaFantasma",
        character: "Bruxa Fantasma",
        ingredients: [.sugar, .cream, .powder],
        description: "Assombrado com açúcar fantasma."
    ),
    Recipe(
        name: "Torta da Meia-Noite",
        image: "bruxaJack",
        character: "Bruxa Jack O’Lantern",
        ingredients: [.mashed, .sugar, .rocks],
        description: "Uma sobremesa quente e acolhedora."
    )
]
