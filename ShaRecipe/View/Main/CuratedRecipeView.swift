//
//  CuratedRecipeView.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct CuratedRecipeView: View {
    @ObservedObject var recipeController = RecipeController()
    
    var body: some View {
        NavigationView {
            ScrollView{
                RecipeItems(recipes: recipeController.fetchedCuratedRecipe)
            }
            .navigationTitle("Curated Recipes")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            Task {
                await recipeController.fetchCuratedRecipes()
            }
        }
    }
}

struct CuratedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CuratedRecipeView()
    }
}
