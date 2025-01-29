//
//  CreateIngredientViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
final class CreateIngredientViewModel: ObservableObject {
    @Published var selectedImageName: String?
    @Published var name: String = ""
    @Published var shortDescription: String = ""
    @Published var showingAlert = false
    @Published var isImageSheetPresented = false
    
    private let dataManager = DataManager.shared
    
    let ingredientImageNames = [
        "amaretto",
        "amaro_nonino",
        "apple_schnapps",
        "benedictine",
        "cherry_liqueur",
        "chocolate_liqueur"
    ]
    
    var isSaveDisabled: Bool {
        name.isEmpty || shortDescription.isEmpty || selectedImageName == nil
    }
    
    func saveIngredient() {
        let ingredient = Ingredient(name: name, shortDescription: shortDescription, imageName: selectedImageName)
        dataManager.save(ingredient)
        clearFields()
    }
    
    private func clearFields() {
        selectedImageName = nil
        name = ""
        shortDescription = ""
    }
}
