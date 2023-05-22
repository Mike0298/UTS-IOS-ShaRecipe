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
    
    @State private var fetchedRecipe: ShareableRecipe?
    
    @State private var navigateToRecipe = false
    @State private var showErrorPrompt = false
    
    @State private var isLoading = false
    
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
                        if (fetchedRecipe != nil) {
                            ShaRecipeView(recipe: fetchedRecipe!, deleteable: false)
                                .navigationBarBackButtonHidden(true)
                        }
                    } label: {
                        Button {
                            submitForm()
                        } label: {
                            if isLoading {
                                ProgressView() // Show loading indicator when isLoading is true
                            } else {
                                Label("Done", systemImage: "checkmark")
                                    .labelStyle(.iconOnly)
                            }
                        }
                        .disabled(isLoading || isFormEmpty()) // Disable button based on submission status and form validation
                    }
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showErrorPrompt) {
                Alert(
                    title: Text("Error"),
                    message: Text("Hmm, we have trouble creating that recipe, let's try again"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .disabled(isLoading) // Disable the entire form based on submission status
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
    
    private func submitForm() {
        guard !isLoading && !isFormEmpty() else {
            return
        }
        
        isLoading = true // Disable the button and form fields and show loading indicator
        
        Task {
            fetchedRecipe = await createShareableRecipe()
            if fetchedRecipe != nil {
                showErrorPrompt = false
                navigateToRecipe = true
            }

            isLoading = false // Hide loading indicator and re-enable the button and form fields
        }
    }
    
    private func isFormEmpty() -> Bool {
        return name.isEmpty || description.isEmpty || ingredients.isEmpty || direction.isEmpty
    }
    
    
    // handle async for the form
    private func createShareableRecipe() async -> ShareableRecipe? {
        let recipeReq = CreateShareableReq(
            name: name,
            description: description,
            ingredients: ingredients,
            direction: direction,
            category: selectedCategory.rawValue
        )
        
        do {
            let recipe = try await recipeController.createShareableRecipe(recipe: recipeReq)
            recipeController.addShareableRecipe(recipe: recipe)
            return recipe
        } catch {
            print("Failed to create shareable recipe: \(error)")
            showErrorPrompt = true
            return nil
        }
    }
}
