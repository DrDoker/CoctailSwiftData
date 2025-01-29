//
//  CocktailsListView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//


import SwiftUI

struct CocktailsListView: View {
    @StateObject private var viewModel = CocktailsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cocktails) { cocktail in
                    NavigationLink(
                        destination: CocktailDetailView(cocktail: cocktail)
                    ) {
                        Text(cocktail.name)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        viewModel.deleteCocktail(viewModel.cocktails[index])
                    }
                }
            }
            .navigationTitle("Коктейли")
            .onAppear {
                viewModel.fetchCocktails()
            }
            .refreshable {
                viewModel.fetchCocktails()
            }
        }
    }
}

#Preview {
    CocktailsListView()
}
