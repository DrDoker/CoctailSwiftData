//
//  CreateCocktailView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI

struct CreateCocktailView: View {
    @StateObject private var viewModel = CreateCocktailViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                SelectedImageView(selectedImageName: viewModel.selectedImageName) {
                    viewModel.isImageSheetPresented = true
                }
                
                Section {
                    TextField("Cocktail Name", text: $viewModel.name)
                    TextField("Instructions", text: $viewModel.instructions, axis: .vertical)
                        .lineLimit(3)
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
                        viewModel.showingAlert = true
                    }
                    .disabled(viewModel.isCreateDisabled)
                }
            }
            .navigationTitle("New Cocktail")
            .onAppear {
                viewModel.fetchAvailableIngredients()
            }
            .alert("Success", isPresented: $viewModel.showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Cocktail created successfully")
            }
            .sheet(isPresented: $viewModel.isImageSheetPresented) {
                ImageSelectionSheet(
                    imageNames: ImageConstants.allCocktailImageNames,
                    selectedImageName: $viewModel.selectedImageName,
                    isPresented: $viewModel.isImageSheetPresented
                )
            }
        }
    }
}

#Preview {
    CreateCocktailView()
}
