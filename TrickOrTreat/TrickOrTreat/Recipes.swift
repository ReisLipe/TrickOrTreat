//
//  Recipes.swift
//  TrickOrTreat
//
//  Created by mih on 05/11/25.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let character: String
    let ingredients: [IngredientType]
    let description: String
}

struct Recipes: View {
    var onSelect: (Recipe) -> Void

    var body: some View {
        HStack {
            Spacer()
            
            UnevenRoundedRectangle(
                topLeadingRadius: 20,
                bottomLeadingRadius: 20,
                bottomTrailingRadius: 0,
                topTrailingRadius: 0
            )
            .frame(width: 290, height: 520)
            .foregroundStyle(.azulEscuro)
            .overlay(
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 16) {
                        ForEach(0..<(allRecipes.count + 1) / 2, id: \.self) { row in
                            HStack(spacing: 20) {
                                if row * 2 < allRecipes.count {
                                    recipeBlock(recipe: allRecipes[row * 2])
                                }
                                if row * 2 + 1 < allRecipes.count {
                                    recipeBlock(recipe: allRecipes[row * 2 + 1])
                                }
                            }
                            HStack(spacing: 20) {
                                mock
                                mock
                            }
                        }
                    }
                }
                    .padding(.vertical, 24)
                    )
            .padding(.top, 60)
        }
    }
    
    var mock: some View {
        VStack(spacing: 4) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 104, height: 104)
                .foregroundStyle(.azulClaro)
                .overlay(
                    Image("acucar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                )
            Text("Açucar")
                .font(.sil(size: 13))
                .foregroundStyle(.branco)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 116)
        }
    }
    
    private func recipeBlock(recipe: Recipe) -> some View {
        Button {
            onSelect(recipe)
        } label: {
            VStack(spacing: 4) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 104, height: 104)
                    .foregroundStyle(.azulClaro)
                    .overlay(
                        Image(recipe.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                    )
                Text(recipe.name)
                    .font(.sil(size: 13))
                    .foregroundStyle(.branco)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: 116)
            }
        }
    }
}

#Preview {
    RecipeBook()
}
