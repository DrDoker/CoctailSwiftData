//
//  IngredientsViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
final class IngredientsViewModel: ObservableObject {
    let dataManager = DataManager.shared
    
    func deleteIngredient(_ ingredient: Ingredient) {
        dataManager.delete(ingredient)
    }
}
