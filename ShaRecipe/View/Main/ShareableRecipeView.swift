//
//  ShareableRecipeView.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct ShareableRecipeView: View {
    @EnvironmentObject var recipeController: RecipeController
    
    var body: some View {
        NavigationView {
            ScrollView{
                ShaRecipeItems(recipes: recipeController.shareableRecipe)
            }
            .navigationTitle("Curated Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

struct ShareableRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        ShareableRecipeView()
            .environmentObject(RecipeController())
    }
}
