//
//  CocktailsListView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI
import SwiftData

struct CocktailsListView: View {
    @StateObject private var viewModel = CocktailsViewModel()
    @Query private var cocktails: [Cocktail]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sortCocktails(cocktails)) { cocktail in
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
                            
                            Spacer()
                            
                            if cocktail.isUserCreated {
                                Image(systemName: "person.badge.plus")
                                    .foregroundColor(.yellow)
                                    .padding(.trailing, 5)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Cocktails")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Sort by:", selection: $viewModel.sortOption) {
                            ForEach(CocktailSortOption.allCases) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                    }
                }
            }
        }
    }
}

#Preview {
    CocktailsListView()
        .modelContainer(DataManager.shared.modelContainer)
}
