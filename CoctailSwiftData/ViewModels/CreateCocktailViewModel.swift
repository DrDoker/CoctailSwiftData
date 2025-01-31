//
//  CreateCocktailViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
final class CreateCocktailViewModel: ObservableObject {
    @Published var selectedImageName: String?
    @Published var name: String = ""
    @Published var instructions: String = ""
    @Published var selectedIngredients: Set<Ingredient> = []
    @Published var availableIngredients: [Ingredient] = []
    @Published var showingAlert = false
    @Published var isImageSheetPresented = false
    
    var isCreateDisabled: Bool {
        name.isEmpty || instructions.isEmpty || selectedIngredients.isEmpty || selectedImageName == nil
    }
    
    func fetchAvailableIngredients() {
        do {
            availableIngredients = try DataManager.shared.fetchAll(ofType: Ingredient.self)
        } catch {
            print("Error fetching ingredients: \(error)")
        }
    }
    
    func saveCocktail() {
        let cocktail = Cocktail(
            name: name,
            imageName: selectedImageName,
            instructions: instructions,
            ingredients: Array(selectedIngredients),
            isUserCreated: true
        )
        DataManager.shared.save(cocktail)
        clearFields()
    }
    
    private func clearFields() {
        selectedImageName = nil
        name = ""
        instructions = ""
        selectedIngredients.removeAll()
    }
}
