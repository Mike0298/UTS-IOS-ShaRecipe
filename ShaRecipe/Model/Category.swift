//
//  Category.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case soup = "Suop"
    case sald = "Salad"
    case main = "Main"
    case side = "Side"
    case snack = "Snack"
    case drink = "Drink"
    case dessert = "Dessert"
}
