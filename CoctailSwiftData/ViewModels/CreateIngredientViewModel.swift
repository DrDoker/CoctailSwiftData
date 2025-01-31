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
    
    let dataManager = DataManager.shared
    
    var isSaveDisabled: Bool {
        name.isEmpty || shortDescription.isEmpty || selectedImageName == nil
    }
    
    func saveIngredient() {
        let ingredient = Ingredient(
            name: name,
            shortDescription: shortDescription,
            imageName: selectedImageName,
            isUserCreated: true
        )
        dataManager.save(ingredient)
        clearFields()
    }
    
    private func clearFields() {
        selectedImageName = nil
        name = ""
        shortDescription = ""
    }
}
