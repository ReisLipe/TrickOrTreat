//
//  Dish.swift
//  TrickOrTreat
//
//  Created by mih on 05/11/25.
//

import SwiftUI

struct Dish: View {
    @Environment(\.dismiss) private var dismiss
    let recipe: Recipe
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 32) {
                
                VStack(spacing: 8) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 162, height: 162)
                        .foregroundStyle(.azulEscuro)
                        .overlay(
                            Image(recipe.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                        )
                    
                    Text(recipe.name)
                        .font(.sil(size: 32))
                        .foregroundStyle(.preto)
                }
                
                VStack(spacing: 8) {
                    Text("Receita de \(recipe.character)")
                        .font(.sil(size: 20))
                        .foregroundStyle(.preto)

                    HStack(spacing: 8) {
                        ForEach(0..<recipe.ingredients.count, id: \.self) { index in
                                    Image(recipe.ingredients[index].getImageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                                
                            if index < recipe.ingredients.count - 1 {
                                Text("+")
                                    .font(.sil(size: 24))
                            }
                        }
                    }
                }
                
                Text(recipe.description)
                    .font(.sil(size: 20))
                    .foregroundStyle(.preto)
                    .multilineTextAlignment(.center)
                    .frame(width: 260)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 200)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
//    Dish(recipe: allRecipes[0])
    RecipeBook()
}
