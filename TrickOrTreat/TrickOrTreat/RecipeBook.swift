//
//  RecipeBook.swift
//  TrickOrTreat
//
//  Created by mih on 04/11/25.
//
import SwiftUI

struct RecipeBook: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var recipeSelected: Bool = true
    @State private var selectedRecipe: Recipe?

    var body: some View {
        ZStack {
            Color.verde
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("livroReceitas")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading, 20)
            }
            
            VStack(spacing: 20) {
                HStack {
                    Button {
                        recipeSelected = true
                    } label: {
                        Image(recipeSelected ? "receitaSelect" : "receitaUnselect")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                        Spacer()
                    }
                    .padding(.leading, 8)
                }
                
                HStack {
                    Button {
                        recipeSelected = false
                    } label: {
                        Image(recipeSelected ? "comidaUnselect" : "comidaSelect")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 48)
                        Spacer()
                    }
                    .padding(.leading, 8)
                }
                
                Spacer()
            }
            .padding(.top, 168)
            
            if recipeSelected {
                Recipes(
                    onSelect: { recipe in
                        selectedRecipe = recipe
                        recipeSelected = false
                    }
                )
            } else {
                if let recipe = selectedRecipe {
                    Dish(recipe: recipe)
                }
            }
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        LittleButton(color: .roxo, imageName: "chevron.left")
                    }
                    
                    Spacer()
                    
                    Text("Receitas")
                        .font(.sigmar(size: 40))
                        .foregroundStyle(.branco)
                        .shadow(color: .roxo, radius: 0, x: -4, y: 4)
                    
                    Spacer()
                }
                .padding(.trailing, 24)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RecipeBook()
}
