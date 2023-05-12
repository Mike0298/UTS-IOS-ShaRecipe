//
//  ShaRecipeService.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import Foundation

class ShaRecipeService {
    private let serviceEndPoint = "https://sharecipe.onrender.com/api"
    
    func fetchCurated() async throws -> [CuratedRecipe] {
        let urlString = "\(serviceEndPoint)/curated"
        return try await performRequest(urlString: urlString)
    }

    func performRequest(urlString: String) async throws -> [CuratedRecipe] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        var curatedRecipes: [CuratedRecipe] = []
        
        for item in json ?? [] {
            if let name = item["name"] as? String,
               let image = item["image"] as? String,
               let description = item["description"] as? String,
               let ingredients = item["ingredients"] as? String,
               let direction = item["direction"] as? String,
               let category = item["category"] as? String {
                
                let curatedRecipe = CuratedRecipe(name: name, image: image, description: description, ingredients: ingredients, direction: direction, category: category)
                curatedRecipes.append(curatedRecipe)
            }
        }
        
        return curatedRecipes
    }
    
}
