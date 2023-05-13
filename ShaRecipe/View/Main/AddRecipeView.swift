//
//  AddRecipe.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var showCreateForm = false
    @State private var showAddForm = false
    
    
    var body: some View {
        NavigationView() {
            VStack(spacing: 100) {
                Spacer()
                
                Button(action: {
                    showCreateForm = true
                }) {
                    Text("Create Shareable Recipe")
                        .font(.headline)
                        .padding()
                }
                Button(action: {
                    showAddForm = true
                }) {
                    Text("Add Shareable Recipe")
                        .font(.headline)
                        .padding()
                }
                Spacer()
            }
            .navigationTitle("Add Local Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showCreateForm) {
            CreateRecipeForm()
        }
        .sheet(isPresented: $showAddForm) {
            AddRecipeForm()
        }
    }
}

struct AddRecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
