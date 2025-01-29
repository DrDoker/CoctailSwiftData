//
//  Cocktail.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftData
import Foundation

@Model
final class Cocktail {
    @Attribute(.unique) var id: UUID
    var name: String
    var instructions: String
    
    @Relationship(inverse: \Ingredient.cocktails)
    var ingredients: [Ingredient] = []
    
    init(
        id: UUID = UUID(),
        name: String,
        instructions: String,
        ingredients: [Ingredient] = []
    ) {
        self.id = id
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredients
    }
}
