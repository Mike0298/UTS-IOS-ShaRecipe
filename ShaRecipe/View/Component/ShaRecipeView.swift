//
//  ShaRecipeView.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import SwiftUI

struct ShaRecipeView: View {
    var recipe: ShareableRecipe
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30) {
                    if !recipe.description.isEmpty {
                        Text(recipe.description)
                    }
                    
                    if !recipe.ingredients.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Ingredients")
                                .font(.headline)
                            Text(recipe.ingredients)
                        }
                    }
                    
                    if !recipe.direction.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Direction")
                                .font(.headline)
                            Text(recipe.direction)
                        }
                    }
                    if !recipe.code.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Share Code (hold to copy)")
                                .font(.headline)
                            Text(recipe.code)
                                .contextMenu {
                                    Button(action: {
                                        UIPasteboard.general.string = recipe.code
                                    }) {
                                        Text("Copy")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ShaRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        ShaRecipeView(recipe: RecipeController.allStaticShareableRecipe[0])
    }
}
