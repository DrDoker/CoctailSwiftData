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
        do {
            let allIngredients = try DataManager.shared.fetchAll(ofType: Ingredient.self)
            let images = allIngredients.compactMap { $0.imageName }
            let uniqueImages = Set(images)
            return Array(uniqueImages)
        } catch {
            print("Error fetching ingredient images: \(error)")
            return []
        }
    }
    
    static var allCocktailImageNames: [String] {
        do {
            let allCocktails = try DataManager.shared.fetchAll(ofType: Cocktail.self)
            let images = allCocktails.compactMap { $0.imageName }
            let uniqueImages = Set(images)
            return Array(uniqueImages)
        } catch {
            print("Error fetching cocktail images: \(error)")
            return []
        }
    }
}
