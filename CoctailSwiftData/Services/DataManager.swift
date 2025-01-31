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
            
            Task { await setupInitialDataIfNeeded() }
        } catch {
            fatalError("ModelContainer initialization failed: \(error)")
        }
    }
    
    // MARK: - CRUD Operations
    func save<T: PersistentModel>(_ model: T) {
        modelContext.insert(model)
        saveContext()
    }
    
    func delete<T: PersistentModel>(_ model: T) {
        modelContext.delete(model)
        saveContext()
    }
    
    func update() {
        saveContext()
    }
    
    // MARK: - Fetch Operations
    func fetchAll<T: PersistentModel>(ofType type: T.Type) -> [T] {
        do {
            let fetchDescriptor = FetchDescriptor<T>()
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch \(type): \(error)")
            return []
        }
    }
    
    func deleteAll<T: PersistentModel>(of type: T.Type) {
        let items = fetchAll(ofType: type) as [T]
        items.forEach { modelContext.delete($0) }
        saveContext()
    }
    
    // MARK: - Private Methods
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}

// MARK: - Initial Data Setup
private extension DataManager {
    func setupInitialDataIfNeeded() async {
        let existingCocktails = fetchAll(ofType: Cocktail.self)
        
        guard existingCocktails.isEmpty else { return }
        
        CocktailsProvider.recipes.forEach { modelContext.insert($0) }
        saveContext()
        print("Initial cocktails added successfully")
    }
}
