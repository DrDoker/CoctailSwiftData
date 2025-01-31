//
//  IngredientsViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
final class IngredientsViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = []
    
    func fetchIngredients() {
        do {
            ingredients = try DataManager.shared.fetchAll(ofType: Ingredient.self)
        } catch {
            print("Error fetching ingredients: \(error)")
        }
    }
    
    func deleteIngredient(_ ingredient: Ingredient) {
        DataManager.shared.delete(ingredient)
        fetchIngredients()
    }
}
