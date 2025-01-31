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
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .modelContainer(DataManager.shared.modelContainer)
                .preferredColorScheme(.dark)
        }
    }
}
