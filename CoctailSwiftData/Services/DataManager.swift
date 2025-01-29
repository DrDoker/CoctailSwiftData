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
    
    // MARK: - Универсальные методы для любых типов Model
    
    /// Сохранить любую Model
    func save<T: PersistentModel>(_ object: T) {
        modelContext.insert(object)
        saveContext()
    }
    
    /// Обновить изменения в контексте
    func update() {
        saveContext()
    }
    
    /// Удалить любую Model
    func delete<T: PersistentModel>(_ object: T) {
        modelContext.delete(object)
        saveContext()
    }
    
    /// Получить все объекты нужного типа
    func fetchAll<T: PersistentModel>(ofType type: T.Type) throws -> [T] {
        let fetchDescriptor = FetchDescriptor<T>()
        return try modelContext.fetch(fetchDescriptor)
    }
    
    /// Удалить все объекты нужного типа
    func deleteAll<T: PersistentModel>(ofType type: T.Type) throws {
        let objects = try fetchAll(ofType: type)
        objects.forEach { modelContext.delete($0) }
        saveContext()
    }
    
    // MARK: - Приватный метод для сохранения контекста
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
