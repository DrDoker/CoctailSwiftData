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
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    static let shared = DataManager()
    
    private init() {
        let schema = Schema([
            Ingredient.self,
            Cocktail.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
        
        self.modelContext = modelContainer.mainContext
    }
    
    // MARK: - Common methods for all Models
    /// Save a model
    func save<T: PersistentModel>(_ object: T) {
        modelContext.insert(object)
        saveContext()
    }
    
    /// Update context
    func update() {
        saveContext()
    }
    
    /// Delete a model
    func delete<T: PersistentModel>(_ object: T) {
        modelContext.delete(object)
        saveContext()
    }
    
    /// Fetch all objects of type
    func fetchAll<T: PersistentModel>(ofType type: T.Type) throws -> [T] {
        let fetchDescriptor = FetchDescriptor<T>()
        return try modelContext.fetch(fetchDescriptor)
    }
    
    /// Delete all objects of type
    func deleteAll<T: PersistentModel>(ofType type: T.Type) throws {
        let objects = try fetchAll(ofType: type)
        objects.forEach { modelContext.delete($0) }
        saveContext()
    }
    
    // MARK: - Private save method
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
