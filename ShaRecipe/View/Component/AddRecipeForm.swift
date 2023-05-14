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
                            ShaRecipeView(recipe: fetchedRecipe!)
                                .navigationBarBackButtonHidden(true)
                        }
                    } label: {
                        Button {
                            submitForm()
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .disabled(shareableCode.isEmpty)
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
    private func submitForm() {
        if (recipeController.isShareableRecipeExist(shareableCode)) {
            showErrorMessage = "Recipe code \(shareableCode) is already in your library"
            showErrorPrompt = true
            return
        }
        
        Task {
            fetchedRecipe = await getShareableRecipe()
            if fetchedRecipe != nil {
                showErrorPrompt = false
                navigateToRecipe = true
            }
        }
    }
    
    private func getShareableRecipe() async -> ShareableRecipe? {
        do {
            let recipe = try await recipeController.fetchShareableRecipe(code: shareableCode)
            recipeController.addShareableRecipe(recipe: recipe)
            return recipe
        } catch {
            print("Failed to fetch shareable recipe: \(error)")
            showErrorMessage = "Cannot find recipe code \(shareableCode)"
            showErrorPrompt = true
            return nil
        }
    }
}
