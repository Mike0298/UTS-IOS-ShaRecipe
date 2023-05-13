//
//  AddRecipeForm.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import SwiftUI

struct CreateRecipeForm: View {
    @EnvironmentObject var recipeController: RecipeController
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var direction: String = ""
    
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView() {
            Form {
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                Section(header: Text("Category")) {
                    Picker("Choose Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Direction")) {
                    TextEditor(text: $direction)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem() {
                    NavigationLink(isActive: $navigateToRecipe) {
                        ShaRecipeView(recipe: ShareableRecipe(
                            name: name,
                            description: description,
                            ingredients: ingredients,
                            direction: direction,
                            category: selectedCategory.rawValue,
                            code: name)
                        )
                        .navigationBarBackButtonHidden(true)
                    } label: {
                        Button {
                            saveRecipe()
                            navigateToRecipe = true
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .disabled(name.isEmpty || description.isEmpty || ingredients.isEmpty || direction.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct CreateRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeForm()
    }
}

extension CreateRecipeForm {
    private func saveRecipe() {
        let recipe = ShareableRecipe(name: name,
                                     description: description,
                                     ingredients: ingredients,
                                     direction: direction,
                                     category: selectedCategory.rawValue,
                                     code: name)
        recipeController.addShareableRecipe(recipe: recipe)
    }
}
