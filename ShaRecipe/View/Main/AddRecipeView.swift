//
//  AddRecipe.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var showForm = false
    
    
    var body: some View {
        NavigationView() {
            Button("Create shareable recipe") {
                showForm = true
            }
                .navigationTitle("Add Local Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showForm) {
            AddRecipeForm()
        }
    }
}

struct AddRecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
