//
//  CreateCocktailView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI

struct CreateCocktailView: View {
    @StateObject private var viewModel = CreateCocktailViewModel()
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Cocktail Name", text: $viewModel.name)
                    TextEditor(text: $viewModel.instructions)
                        .frame(minHeight: 100)
                }
                
                Section("Select Ingredients") {
                    ForEach(viewModel.availableIngredients) { ingredient in
                        Toggle(isOn: Binding(
                            get: { viewModel.selectedIngredients.contains(ingredient) },
                            set: { isSelected in
                                if isSelected {
                                    viewModel.selectedIngredients.insert(ingredient)
                                } else {
                                    viewModel.selectedIngredients.remove(ingredient)
                                }
                            }
                        )) {
                            VStack(alignment: .leading) {
                                Text(ingredient.name)
                                Text(ingredient.shortDescription)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                Section {
                    Button("Create Cocktail") {
                        viewModel.saveCocktail()
                        showingAlert = true
                    }
                    .disabled(viewModel.name.isEmpty ||
                              viewModel.instructions.isEmpty ||
                              viewModel.selectedIngredients.isEmpty)
                }
            }
            .navigationTitle("New Cocktail")
            .onAppear {
                viewModel.fetchAvailableIngredients()
            }
            .alert("Success", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Cocktail created successfully")
            }
        }
    }
}

#Preview {
    CreateCocktailView()
}
