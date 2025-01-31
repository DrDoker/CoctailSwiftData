//
//  CoctailSwiftDataApp.swift
//  CoctailSwiftData
//
//  Created by Serhii on 29.01.2025.
//

import SwiftUI
import SwiftData

@main
struct CoctailSwiftDataApp: App {
    let dataManager = DataManager.shared
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .modelContainer(dataManager.modelContainer)
                .preferredColorScheme(.dark)
        }
    }
}
