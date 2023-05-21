//
//  CurratedRecipe.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import Foundation

// struct for UI
struct CuratedRecipe: Identifiable {
    var id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let direction: String
    let category: Category.RawValue
}

// struct for API GET respond
struct CuratedRecipeRes: Decodable {
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let direction: String
    let category: Category.RawValue
}
