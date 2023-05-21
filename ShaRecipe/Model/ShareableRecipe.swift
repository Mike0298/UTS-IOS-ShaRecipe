//
//  ShareableRecipe.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import Foundation

// struct for UI, need to be code able for UserDefault
struct ShareableRecipe: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let ingredients: String
    let direction: String
    let category: Category.RawValue
    let code: String
}

// struct for API GET respond (get recipe)
struct GetShareableRes: Decodable {
    let name: String
    let description: String
    let ingredients: String
    let direction: String
    let category: Category.RawValue
    let code: String
}

// struct for API POST request (create recipe)
struct CreateShareableReq: Encodable {
    let name: String
    let description: String
    let ingredients: String
    let direction: String
    let category: Category.RawValue
}

// struct for API POST respond (create recipe)
struct CreateShareableRes: Decodable {
    let code: String
}

