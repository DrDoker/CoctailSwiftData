//
//  IngredientDetailView.swift
//  CocktailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI

struct IngredientDetailView: View {
    @StateObject private var viewModel: IngredientDetailViewModel
    
    init(ingredient: Ingredient) {
        _viewModel = StateObject(wrappedValue: IngredientDetailViewModel(ingredient: ingredient))
    }
    
    var body: some View {
        List {
            SelectedImageView(selectedImageName: viewModel.ingredient.imageName) {
                if viewModel.isEditing {
                    viewModel.isImageSheetPresented = true
                }
            }
            
            Section("Name") {
                if viewModel.isEditing {
                    VStack {
                        TextField("Name", text: $viewModel.editedName)
                        Divider()
                    }
                    .padding(.vertical, 2)
                } else {
                    Text(viewModel.ingredient.name)
                }
            }
            
            Section("Short Description") {
                if viewModel.isEditing {
                    VStack {
                        TextField("Short Description", text: $viewModel.editedShortDescription)
                        Divider()
                    }
                    .padding(.vertical, 2)
                } else {
                    Text(viewModel.ingredient.shortDescription)
                }
            }
            
            if !viewModel.ingredient.cocktails.isEmpty {
                Section("Used in Cocktails") {
                    ForEach(viewModel.ingredient.cocktails) { cocktail in
                        NavigationLink(
                            destination: CocktailDetailView(cocktail: cocktail)
                        ) {
                            HStack {
                                if let imageName = cocktail.imageName {
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                }
                                Text(cocktail.name)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(viewModel.ingredient.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(viewModel.isEditing ? "Save" : "Edit") {
                    viewModel.handleEditButtonTap()
                }
                .disabled(viewModel.isSaveDisabled)
            }
        }
        .sheet(isPresented: $viewModel.isImageSheetPresented) {
            ImageSelectionSheet(
                imageNames: viewModel.ingredientImageNames,
                selectedImageName: $viewModel.ingredient.imageName,
                isPresented: $viewModel.isImageSheetPresented
            )
        }
    }
}

#Preview {
    let ingredient = Ingredient(
        name: "Amaretto",
        shortDescription: "Amaretto is a sweet Italian liqueur that is almond-flavored.",
        imageName: "amaretto"
    )
    IngredientDetailView(ingredient: ingredient)
}
