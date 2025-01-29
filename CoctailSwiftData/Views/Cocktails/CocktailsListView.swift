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
        NavigationStack {
            List {
                ForEach(viewModel.cocktails) { cocktail in
                    NavigationLink(
                        destination: CocktailDetailView(cocktail: cocktail)
                    ) {
                        HStack {
                            if let imageName = cocktail.imageName {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            Text(cocktail.name)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        viewModel.deleteCocktail(viewModel.cocktails[index])
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Cocktails")
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
