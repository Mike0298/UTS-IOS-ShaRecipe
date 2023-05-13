//
//  ShaRecipeItemCard.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import SwiftUI

struct ShaRecipeItemCard: View {
    var recipe: ShareableRecipe
    
    var body: some View {
        VStack {
            Color.black.opacity(0.3)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .center) {
                    Text(recipe.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: 136)
                        .padding()
                        .multilineTextAlignment(.center)
                }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 0)
    }
}

struct ShaRecipeItemCard_Previews: PreviewProvider {
    static var previews: some View {
        ShaRecipeItemCard(recipe: RecipeController.allStaticShareableRecipe[0])
    }
}
