//
//  ShaRecipeApp.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

@main
struct ShaRecipeApp: App {
    @StateObject var recipeController = RecipeController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeController)
        }
    }
}
