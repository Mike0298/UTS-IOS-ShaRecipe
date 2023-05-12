//
//  AddRecipe.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct AddRecipeView: View {
    var body: some View {
        NavigationView() {
            Text("Create Shareable Recipe")
            
                .navigationTitle("Add Local Recipe")
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
