//
//  CuratedRecipeView.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct CuratedRecipeView: View {
    @EnvironmentObject var recipeController: RecipeController
    
    var body: some View {
        NavigationView {
            ScrollView{
                RecipeItems(recipes: recipeController.fetchedCuratedRecipe, isFetching: recipeController.isFetching, isError: recipeController.isError)
            }
            .navigationTitle("Curated Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

struct CuratedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CuratedRecipeView()
            .environmentObject(RecipeController())
    }
}
