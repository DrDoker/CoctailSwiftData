//
//  DataManager.swift
//  ShopingList
//
//  Created by Serhii on 09.01.2025.
//

import SwiftData
import Foundation

@MainActor
final class DataManager {
    // MARK: - Properties
    static let shared = DataManager()
    let modelContainer: ModelContainer
    private let modelContext: ModelContext

    // MARK: - Initialization
    private init() {
        do {
            let schema = Schema([Ingredient.self, Cocktail.self])
            let configuration = ModelConfiguration(schema: schema)
            
            modelContainer = try ModelContainer(for: schema, configurations: [configuration])
            modelContext = modelContainer.mainContext
            
            Task { try await setupInitialDataIfNeeded() }
        } catch {
            fatalError("ModelContainer initialization failed: \(error)")
        }
    }
    
    // MARK: - CRUD Operations
    func save<T: PersistentModel>(_ model: T) {
        modelContext.insert(model)
        tryToSave()
    }
    
    func delete<T: PersistentModel>(_ model: T) {
        modelContext.delete(model)
        tryToSave()
    }
    
    func update() {
        tryToSave()
    }
    
    // MARK: - Fetch Operations
    func fetchAll<T: PersistentModel>(ofType type: T.Type) throws -> [T] {
        try modelContext.fetch(FetchDescriptor<T>())
    }
    
    func deleteAll<T: PersistentModel>(of type: T.Type) throws {
        let items = try fetchAll(ofType: type) as [T]
        items.forEach { modelContext.delete($0) }
        tryToSave()
    }
}

// MARK: - Private Extensions
private extension DataManager {
    func tryToSave() {
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
    
    func setupInitialDataIfNeeded() async throws {
        let existingCocktails = try fetchAll(ofType: Cocktail.self)
        
        guard existingCocktails.isEmpty else { return }
        
        CocktailsProvider.recipes.forEach { modelContext.insert($0) }
        tryToSave()
        print("Initial cocktails added successfully")
    }
}

extension DataManager {
    static var preview: ModelContainer {
        do {
            let schema = Schema([Ingredient.self, Cocktail.self])
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: schema, configurations: [config])
            
            // Добавляем тестовые данные
            let context = container.mainContext
            
            let ingredient = Ingredient(
                name: "Test Ingredient",
                shortDescription: "Test Description",
                imageName: "amaretto"
            )
            context.insert(ingredient)
            
            let cocktail = Cocktail(
                name: "Test Cocktail",
                imageName: "americano",
                instructions: "Test Instructions",
                ingredients: [ingredient]
            )
            context.insert(cocktail)
            
            try context.save()
            
            return container
        } catch {
            fatalError("Failed to create preview container: \(error)")
        }
    }
}
