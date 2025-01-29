//
//  IngredientDetailViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
class IngredientDetailViewModel: ObservableObject {
    @Published var ingredient: Ingredient
    @Published var isEditing: Bool = false
    @Published var editedName: String = ""
    @Published var editedShortDescription: String = ""
    @Published var isImageSheetPresented: Bool = false
    
    private let dataManager = DataManager.shared
    
    let ingredientImageNames = [
        "amaretto",
        "amaro_nonino", 
        "apple_schnapps",
        "benedictine",
        "cherry_liqueur",
        "chocolate_liqueur"
    ]
    
    init(ingredient: Ingredient) {
        self.ingredient = ingredient
    }
    
    func startEditing() {
        editedName = ingredient.name
        editedShortDescription = ingredient.shortDescription
        isEditing = true
    }
    
    func saveChanges() {
        ingredient.name = editedName
        ingredient.shortDescription = editedShortDescription
        dataManager.update()
        isEditing = false
    }
    
    var isSaveDisabled: Bool {
        isEditing && (editedName.isEmpty || editedShortDescription.isEmpty)
    }
    
    func handleEditButtonTap() {
        if isEditing {
            saveChanges()
        } else {
            startEditing()
        }
    }
}
