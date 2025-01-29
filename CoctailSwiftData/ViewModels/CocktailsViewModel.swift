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
    private let dataManager = DataManager.shared
    
    func fetchCocktails() {
        do {
            cocktails = try dataManager.fetchAll(ofType: Cocktail.self)
        } catch {
            print("Error fetching cocktails: \(error)")
        }
    }
    
    func deleteCocktail(_ cocktail: Cocktail) {
        dataManager.delete(cocktail)
        fetchCocktails()
    }
}
