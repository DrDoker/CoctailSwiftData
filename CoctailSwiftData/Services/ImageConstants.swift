//
//  ImageConstants.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
struct ImageConstants {
    static var allIngredientImageNames: [String] {
        let allIngredients = DataManager.shared.fetchAll(ofType: Ingredient.self)
        let images = allIngredients.compactMap { $0.imageName }
        let uniqueImages = Set(images)
        return Array(uniqueImages)
    }
    
    static var allCocktailImageNames: [String] {
        let allCocktails = DataManager.shared.fetchAll(ofType: Cocktail.self)
        let images = allCocktails.compactMap { $0.imageName }
        let uniqueImages = Set(images)
        return Array(uniqueImages)
    }
}
