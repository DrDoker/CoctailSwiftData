//
//  Ingredient.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftData
import Foundation

@Model
final class Ingredient {
    @Attribute(.unique) var id: UUID
    var name: String
    var shortDescription: String
    var imageName: String?
    var isUserCreated: Bool
    
    @Relationship var cocktails: [Cocktail] = []
    
    init(
        id: UUID = UUID(),
        name: String,
        shortDescription: String,
        imageName: String? = nil,
        isUserCreated: Bool = false
    ) {
        self.id = id
        self.name = name
        self.shortDescription = shortDescription
        self.imageName = imageName
        self.isUserCreated = isUserCreated
    }
}

// Extension to support Hashable for Ingredient
extension Ingredient: Hashable {
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
