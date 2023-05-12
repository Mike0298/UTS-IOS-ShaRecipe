//
//  ShareableRecipeView.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct ShareableRecipeView: View {
    var body: some View {
        NavigationView() {
            Text("Shareable Recipes")
            
                .navigationTitle("Shareable Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

struct ShareableRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        ShareableRecipeView()
    }
}
