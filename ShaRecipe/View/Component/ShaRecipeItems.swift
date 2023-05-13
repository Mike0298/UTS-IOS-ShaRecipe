//
//  ShaRecipeItems.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import SwiftUI

struct ShaRecipeItems: View {
    var recipes: [ShareableRecipe]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe") found")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                    
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: ShaRecipeView(recipe: recipe)) {
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
