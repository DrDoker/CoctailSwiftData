//
//  CreateIngredientView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI

struct CreateIngredientView: View {
    @StateObject private var viewModel = CreateIngredientViewModel()

    var body: some View {
        NavigationStack {
            Form {
                SelectedImageView(selectedImageName: viewModel.selectedImageName) {
                    viewModel.isImageSheetPresented = true
                }

                Section {
                    TextField("Name", text: $viewModel.name)
                    TextField("Short Description", text: $viewModel.shortDescription)
                }
                
                Section {
                    Button("Save") {
                        viewModel.saveIngredient()
                        viewModel.showingAlert = true
                    }
                    .disabled(viewModel.isSaveDisabled)
                }
            }
            .navigationTitle("New Ingredient")
        }
        .alert("Success", isPresented: $viewModel.showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Ingredient created successfully")
        }
        .sheet(isPresented: $viewModel.isImageSheetPresented) {
            ImageSelectionSheet(
                imageNames: ImageConstants.allIngredientImageNames,
                selectedImageName: $viewModel.selectedImageName,
                isPresented: $viewModel.isImageSheetPresented
            )
        }
    }
}

#Preview {
    CreateIngredientView()
}
