//
//  CuratedRecipeView.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct CuratedRecipeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                RecipeItems(recipes: RecipeController.allCuratedRecipe)
            }
            .navigationTitle("Curated Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

struct CuratedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CuratedRecipeView()
    }
}
