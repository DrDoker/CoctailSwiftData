//
//  CreateCocktailViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
final class CreateCocktailViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var instructions: String = ""
    @Published var selectedIngredients: Set<Ingredient> = []
    @Published var availableIngredients: [Ingredient] = []
    
    private let dataManager = DataManager.shared
    
    let cocktailImageNames = [
        "20th_century",
        "amaretto_sour",
        "americano",
        "aperol_spritz",
        "appletini",
        "aviation"
    ]
    
    func fetchAvailableIngredients() {
        do {
            availableIngredients = try dataManager.fetchAll(ofType: Ingredient.self)
        } catch {
            print("Error fetching ingredients: \(error)")
        }
    }
    
    func saveCocktail() {
        let cocktail = Cocktail(
            name: name,
            instructions: instructions,
            ingredients: Array(selectedIngredients)
        )
        dataManager.save(cocktail)
        clearFields()
    }
    
    private func clearFields() {
        name = ""
        instructions = ""
        selectedIngredients.removeAll()
    }
}
