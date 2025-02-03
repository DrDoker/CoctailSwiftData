//
//  CocktailsViewModel.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import Foundation

@MainActor
final class CocktailsViewModel: ObservableObject {
    @Published var sortOption: CocktailSortOption = .nameAsc
    let dataManager = DataManager.shared
    
    func deleteCocktail(_ cocktail: Cocktail) {
        dataManager.delete(cocktail)
    }
    
    func sortCocktails(_ cocktails: [Cocktail]) -> [Cocktail] {
        switch sortOption {
        case .nameAsc:
            return cocktails.sorted { $0.name < $1.name }
        case .nameDesc:
            return cocktails.sorted { $0.name > $1.name }
        case .userCreatedFirst:
            return cocktails.sorted {
                if $0.isUserCreated == $1.isUserCreated {
                    return $0.name < $1.name
                }
                return $0.isUserCreated && !$1.isUserCreated
            }
        }
    }
}

enum CocktailSortOption: String, CaseIterable, Identifiable {
    case nameAsc = "By name (A-Z)"
    case nameDesc = "By name (Z-A)"
    case userCreatedFirst = "User created first"

    var id: String { rawValue }
}
