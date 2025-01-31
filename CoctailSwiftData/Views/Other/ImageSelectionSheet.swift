//
//  ImageSelectionSheet.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI

struct ImageSelectionSheet: View {
    let imageNames: [String]
    @Binding var selectedImageName: String?
    @Binding var isPresented: Bool
        
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .padding(10)
                            .onTapGesture {
                                selectedImageName = imageName
                                isPresented = false
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Select Image")
            .navigationBarItems(trailing: Button("Close") {
                isPresented = false
            })
        }
    }
}

#Preview {
    ImageSelectionSheet(
        imageNames: ["aperol_spritz", "americano"],
        selectedImageName: .constant(""),
        isPresented: .constant(true)
    )
}
