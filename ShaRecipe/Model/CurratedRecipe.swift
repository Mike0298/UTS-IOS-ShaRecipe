//
//  CurratedRecipe.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import Foundation

struct CuratedRecipe: Identifiable {
    var id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let direction: String
    let category: Category.RawValue
}

struct CuratedRecipeRes: Decodable {
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let direction: String
    let category: Category.RawValue
}
