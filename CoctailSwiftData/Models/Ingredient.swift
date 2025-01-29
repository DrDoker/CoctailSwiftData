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
    
    @Relationship var cocktails: [Cocktail] = []
    
    init(
        id: UUID = UUID(),
        name: String,
        shortDescription: String,
        imageName: String? = nil
    ) {
        self.id = id
        self.name = name
        self.shortDescription = shortDescription
        self.imageName = imageName
    }
}
