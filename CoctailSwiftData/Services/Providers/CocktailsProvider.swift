//
//  CocktailsProvider.swift
//  CoctailSwiftData
//
//  Created by Serhii on 30.01.2025.
//


import Foundation

struct CocktailsProvider {
    static let recipes: [Cocktail] = [
        Cocktail(
            name: "Americano",
            imageName: "americano",
            instructions: """
                1. Fill a highball glass with ice
                2. Add 30ml Campari
                3. Add 30ml sweet vermouth
                4. Top with soda water
                5. Gently stir to combine
                6. Garnish with an orange slice
                """,
            ingredients: [
                IngredientsProvider.ingredient(.campari),
                IngredientsProvider.ingredient(.sweetVermouth),
                IngredientsProvider.ingredient(.sodaWater),
                IngredientsProvider.ingredient(.orangeSlice)
            ]
        ),
        
        Cocktail(
            name: "Aperol Spritz",
            imageName: "aperol_spritz",
            instructions: """
                1. Fill a wine glass with ice
                2. Add 90ml prosecco
                3. Add 60ml Aperol
                4. Top with a splash of soda water
                5. Gently stir to combine
                6. Garnish with an orange slice
                """,
            ingredients: [
                IngredientsProvider.ingredient(.aperol),
                IngredientsProvider.ingredient(.prosecco),
                IngredientsProvider.ingredient(.sodaWater),
                IngredientsProvider.ingredient(.orangeSlice)
            ]
        ),
        
        Cocktail(
            name: "Aviation",
            imageName: "aviation",
            instructions: """
                1. Fill a shaker with ice
                2. Add 45ml gin
                3. Add 15ml maraschino liqueur
                4. Add 15ml crème de violette
                5. Add 22ml fresh lemon juice
                6. Shake well
                7. Double strain into a chilled coupe glass
                8. Garnish with a brandied cherry
                """,
            ingredients: [
                IngredientsProvider.ingredient(.gin),
                IngredientsProvider.ingredient(.maraschinoLiqueur),
                IngredientsProvider.ingredient(.cremeDeViolette),
                IngredientsProvider.ingredient(.lemonJuice)
            ]
        ),
        
        Cocktail(
            name: "20th Century",
            imageName: "20th_century",
            instructions: """
                1. Add ice to a shaker
                2. Pour 45ml gin
                3. Add 20ml Lillet Blanc
                4. Add 20ml white creme de cacao
                5. Add 20ml fresh lemon juice
                6. Shake well
                7. Strain into a chilled coupe glass
                8. Garnish with a lemon twist
                """,
            ingredients: [
                IngredientsProvider.ingredient(.gin),
                IngredientsProvider.ingredient(.lilletBlanc),
                IngredientsProvider.ingredient(.cremeDeCacao),
                IngredientsProvider.ingredient(.lemonJuice)
            ]
        ),
        
        Cocktail(
            name: "Appletini",
            imageName: "appletini",
            instructions: """
                1. Fill a shaker with ice
                2. Add 45ml vodka
                3. Add 15ml apple schnapps
                4. Add 15ml fresh lemon juice
                5. Shake well
                6. Strain into a chilled martini glass
                7. Garnish with a thin apple slice
                """,
            ingredients: [
                IngredientsProvider.ingredient(.vodka),
                IngredientsProvider.ingredient(.appleSchnapps),
                IngredientsProvider.ingredient(.lemonJuice)
            ]
        ),
        
        Cocktail(
            name: "Amaretto Sour",
            imageName: "amaretto_sour",
            instructions: """
                1. Fill a shaker with ice
                2. Pour 45ml amaretto
                3. Add 30ml bourbon whiskey
                4. Add 30ml fresh lemon juice
                5. Add 15ml simple syrup
                6. Add 1 egg white (optional)
                7. Dry shake without ice
                8. Add ice and shake again
                9. Strain into a rocks glass with ice
                10. Garnish with lemon wedge and cherry
                """,
            ingredients: [
                IngredientsProvider.ingredient(.amaretto),
                IngredientsProvider.ingredient(.bourbon),
                IngredientsProvider.ingredient(.lemonJuice),
                IngredientsProvider.ingredient(.simpleSyrup),
                IngredientsProvider.ingredient(.eggWhite)
            ]
        )
    ]
}
