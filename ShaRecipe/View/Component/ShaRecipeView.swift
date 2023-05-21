//
//  ShaRecipeView.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import SwiftUI

struct ShaRecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var recipeController: RecipeController
    
    var recipe: ShareableRecipe
    var deleteable: Bool
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30) {
                    if !recipe.code.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Share Code (hold to copy)")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.headline)
                            Text(recipe.code)
                                .frame(maxWidth: .infinity, alignment: .center)
                                // hold to copy feature
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
                    if deleteable {
                        Button(action: {
                            recipeController.deleteShareableRecipe(recipe: recipe)
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Delete")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(20)
        }
    }
}

struct ShaRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        ShaRecipeView(recipe: RecipeController.allStaticShareableRecipe[0], deleteable: true)
            .environmentObject(RecipeController())
    }
}
