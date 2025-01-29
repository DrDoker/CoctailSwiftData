//
//  SelectedImageView.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//


import SwiftUI

struct SelectedImageView: View {
    let selectedImageName: String?
    let onImageTap: () -> Void
    
    var body: some View {
        if let imageName = selectedImageName {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .padding()
                .onTapGesture {
                    onImageTap()
                }
        } else {
            Text("Choose a picture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
                .onTapGesture {
                    onImageTap()
                }
        }
    }
}

#Preview {
    SelectedImageView(selectedImageName: "amaretto", onImageTap: {})
}
