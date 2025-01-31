//
//  MainTabView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    var body: some View {
        TabView {
            CocktailsListView()
                .tabItem {
                    Label("Cocktails", systemImage: "wineglass")
                }
            
            IngredientsListView()
                .tabItem {
                    Label("Ingredients", systemImage: "list.bullet")
                }
            
            CreateIngredientView()
                .tabItem {
                    Label("Add Ingredient", systemImage: "plus.circle")
                }
            
            CreateCocktailView()
                .tabItem {
                    Label("Create Cocktail", systemImage: "plus.square")
                }
        }
    }
}

#Preview {
    MainTabView()
        .modelContainer(DataManager.preview)
}
