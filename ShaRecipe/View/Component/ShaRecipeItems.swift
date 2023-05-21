//
//  ShaRecipeItems.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import SwiftUI

struct ShaRecipeItems: View {
    @EnvironmentObject var recipeController: RecipeController
    
    var recipes: [ShareableRecipe]
    
    var body: some View {
        VStack {
            HStack {
                Text(
                    recipes.count == 0 ?
                    "No recipe found locally"
                    :
                    "\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe") found"
                )
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                    
                Spacer()
                Button {
                    recipeController.clearShareableRecipe()
                } label: {
                    Label("Delete all", systemImage: "trash")
                }
                .foregroundColor(.red)
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: ShaRecipeView(recipe: recipe, deleteable: true)) {
                        ShaRecipeItemCard(recipe: recipe)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }

}

struct ShaRecipeItems_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ShaRecipeItems(recipes: RecipeController.allStaticShareableRecipe)
        }
    }
}
