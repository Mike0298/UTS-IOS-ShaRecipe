//
//  ShareableRecipe.swift
//  ShaRecipe
//
//  Created by Mike on 13/5/2023.
//

import Foundation

struct ShareableRecipe: Identifiable, Decodable {
    var id = UUID()
    let name: String
    let description: String
    let ingredients: String
    let direction: String
    let category: Category.RawValue
    let code: String
}
