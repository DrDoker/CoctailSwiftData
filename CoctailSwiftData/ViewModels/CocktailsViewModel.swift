//
//  CocktailsViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
final class CocktailsViewModel: ObservableObject {
    let dataManager = DataManager.shared
    
    func deleteCocktail(_ cocktail: Cocktail) {
        dataManager.delete(cocktail)
    }
}
