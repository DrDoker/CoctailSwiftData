//
//  IngredientsProvider.swift
//  CoctailSwiftData
//
//  Created by Serhii on 30.01.2025.
//


import Foundation

struct IngredientsProvider {
    enum IngredientType: String {
        case gin = "Gin"
        case lilletBlanc = "Lillet Blanc"
        case cremeDeCacao = "White Creme de Cacao"
        case lemonJuice = "Lemon Juice"
        case amaretto = "Amaretto"
        case bourbon = "Bourbon"
        case simpleSyrup = "Simple Syrup"
        case eggWhite = "Egg White"
        case campari = "Campari"
        case sweetVermouth = "Sweet Vermouth"
        case sodaWater = "Soda Water"
        case aperol = "Aperol"
        case prosecco = "Prosecco"
        case vodka = "Vodka"
        case appleSchnapps = "Apple Schnapps"
        case maraschinoLiqueur = "Maraschino Liqueur"
        case cremeDeViolette = "Crème de Violette"
        case orangeSlice = "Orange Slice"
        
        var ingredient: Ingredient {
            switch self {
            case .gin:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "London dry gin, 40% ABV",
                    imageName: "gin"
                )
            case .lilletBlanc:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "French wine-based aperitif",
                    imageName: "lillet_blanc"
                )
            case .cremeDeCacao:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Sweet chocolate liqueur",
                    imageName: "creme_de_cacao"
                )
            case .lemonJuice:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Fresh squeezed lemon juice",
                    imageName: "lemon_juice"
                )
            case .amaretto:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Sweet almond-flavored liqueur",
                    imageName: "amaretto"
                )
            case .bourbon:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "American whiskey, 40% ABV",
                    imageName: "bourbon"
                )
            case .simpleSyrup:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "1:1 sugar and water mixture",
                    imageName: "simple_syrup"
                )
            case .eggWhite:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Fresh egg white for texture (optional)",
                    imageName: "egg_white"
                )
            case .campari:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Italian bitter aperitif",
                    imageName: "campari"
                )
            case .sweetVermouth:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Red Italian fortified wine",
                    imageName: "sweet_vermouth"
                )
            case .sodaWater:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Carbonated water",
                    imageName: "soda_water"
                )
            case .aperol:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Italian bitter aperitif",
                    imageName: "aperol"
                )
            case .prosecco:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Italian sparkling wine",
                    imageName: "prosecco"
                )
            case .vodka:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Premium vodka, 40% ABV",
                    imageName: "vodka"
                )
            case .appleSchnapps:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Sweet apple-flavored liqueur",
                    imageName: "apple_schnapps"
                )
            case .maraschinoLiqueur:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Cherry liqueur",
                    imageName: "maraschino_liqueur"
                )
            case .cremeDeViolette:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Violet flower liqueur",
                    imageName: "creme_de_violette"
                )
            case .orangeSlice:
                return Ingredient(
                    name: rawValue,
                    shortDescription: "Fresh orange slice for garnish",
                    imageName: "orange_slice"
                )
            }
        }
    }
    
    private static var ingredientsCache: [IngredientType: Ingredient] = [:]
    
    static func ingredient(_ type: IngredientType) -> Ingredient {
        if let cached = ingredientsCache[type] {
            return cached
        }
        let ingredient = type.ingredient
        ingredientsCache[type] = ingredient
        return ingredient
    }
}