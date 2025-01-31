//
//  CocktailsViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
final class CocktailsViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    
    func deleteCocktail(_ cocktail: Cocktail) {
        DataManager.shared.delete(cocktail)
    }
}
