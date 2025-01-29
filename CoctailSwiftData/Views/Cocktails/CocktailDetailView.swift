//
//  CocktailDetailView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//


import SwiftUI

struct CocktailDetailView: View {
    let cocktail: Cocktail
    
    var body: some View {
        List {
            Section("Инструкция") {
                Text(cocktail.instructions)
            }
            
            Section("Ингредиенты") {
                ForEach(cocktail.ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        Text(ingredient.shortDescription)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationTitle(cocktail.name)
    }
}
