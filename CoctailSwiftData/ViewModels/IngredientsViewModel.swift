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

    private let dataManager = DataManager.shared
    
    func fetchIngredients() {
        do {
            ingredients = try dataManager.fetchAll(ofType: Ingredient.self)
        } catch {
            print("Error fetching ingredients: \(error)")
        }
    }
    
    func deleteIngredient(_ ingredient: Ingredient) {
        dataManager.delete(ingredient)
        fetchIngredients()
    }
}
