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
            if let imageName = cocktail.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            
            Section("Instructions") {
                Text(cocktail.instructions)
            }
            
            if !cocktail.ingredients.isEmpty {
                Section("Ingredients") {
                    ForEach(cocktail.ingredients) { ingredient in
                        HStack {
                            if let imageName = ingredient.imageName {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                            Text(ingredient.name)
                        }
                    }
                }
            }
        }
        .navigationTitle(cocktail.name)
    }
}

#Preview {
    let cocktail = Cocktail(
        name: "Americano",
        imageName: "americano",
        instructions: "Pour all ingredients directly into lowball glass filled with ice. Stir gently. Garnish with half orange slice.",
        isUserCreated: true
    )
    
    NavigationStack {
        CocktailDetailView(cocktail: cocktail)
    }
}
