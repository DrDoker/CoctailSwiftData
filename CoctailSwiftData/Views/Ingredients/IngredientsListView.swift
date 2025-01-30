//
//  IngredientsListView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI

struct IngredientsListView: View {
    @StateObject private var viewModel = IngredientsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.ingredients) { ingredient in
                    NavigationLink(
                        destination: IngredientDetailView(ingredient: ingredient)
                    ) {
                        HStack {
                            if let imageName = ingredient.imageName {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            VStack(alignment: .leading) {
                                Text(ingredient.name)
                                Text(ingredient.shortDescription)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            if ingredient.isUserCreated {
                                Image(systemName: "person.badge.plus")
                                    .foregroundColor(.yellow)
                                    .padding(.trailing, 5)
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        viewModel.deleteIngredient(viewModel.ingredients[index])
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Ingredients")
            .onAppear {
                viewModel.fetchIngredients()
            }
            .refreshable {
                viewModel.fetchIngredients()
            }
        }
    }
}

#Preview {
    IngredientsListView()
}
