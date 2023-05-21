//
//  AddRecipeForm.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import SwiftUI

struct AddRecipeForm: View {
    @EnvironmentObject var recipeController: RecipeController
    @State private var shareableCode: String = ""
    
    @State private var navigateToRecipe = false
    
    @State private var fetchedRecipe: ShareableRecipe?
    
    @State private var showErrorPrompt = false
    @State private var showErrorMessage = ""
    
    @State private var isSubmitting = false 
    @State private var isLoading = false
    
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        NavigationView() {
            Form {
                Section(header: Text("Enter shareable code")) {
                    TextField("Shareable code", text: $shareableCode)
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
                        .disabled(isSubmitting || shareableCode.isEmpty) // Disable button based on submission status and form validation
                    }
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showErrorPrompt) {
                Alert(
                    title: Text("Error"),
                    message: Text(showErrorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .disabled(isSubmitting) // Disable the entire form based on submission status
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeForm()
    }
}

extension AddRecipeForm {
    // handle async for the form
    private func submitForm() {
        guard !isSubmitting && !shareableCode.isEmpty else {
            return
        }
        
        isSubmitting = true // Disable the button and form fields
        isLoading = true // Show loading indicator
        
        // reject the code if we already have it in the local array
        if (recipeController.isShareableRecipeExist(shareableCode)) {
            showErrorMessage = "Recipe code \(shareableCode) is already in your library"
            showErrorPrompt = true
            isSubmitting = false // Re-enable the button and form fields
            isLoading = false // Hide loading indicator
            return
        }
        
        Task {
            do {
                fetchedRecipe = try await getShareableRecipe()
                if fetchedRecipe != nil {
                    showErrorPrompt = false
                    navigateToRecipe = true
                }
            } catch {
                print("Failed to fetch shareable recipe: \(error)")
                showErrorMessage = "Cannot find recipe code \(shareableCode)"
                showErrorPrompt = true
            }
            
            isSubmitting = false // Re-enable the button and form fields
            isLoading = false // Hide loading indicator
        }
    }
    
    // prepare data and do the API request.
    // then get data to show on the UI, also ammend the new recipe into local recipe array
    private func getShareableRecipe() async throws -> ShareableRecipe {
        let recipe = try await recipeController.fetchShareableRecipe(code: shareableCode)
        recipeController.addShareableRecipe(recipe: recipe)
        return recipe
    }
}
