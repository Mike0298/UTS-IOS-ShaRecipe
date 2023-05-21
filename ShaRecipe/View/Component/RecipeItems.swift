//
//  RecipeItems.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct RecipeItems: View {
    var recipes: [CuratedRecipe]
    var isFetching: Bool
    var isError: Bool
    
    var body: some View {
        VStack {
            HStack {
                if (isFetching && !isError) {
                    Text("Fetching data, please wait...")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                } else if (!isFetching && isError){
                    Text("Hmm, we have trouble reaching our server, please try again")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                } else {
                    Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe") found")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                }
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeItemCard(recipe: recipe)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeItems_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            RecipeItems(recipes: RecipeController.allStaticCuratedRecipe, isFetching: false, isError: false)
        }
    }
}
