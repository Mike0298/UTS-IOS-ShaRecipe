//
//  ShaRecipeService.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import Foundation

class ShaRecipeService {
    private let serviceEndPoint = "https://sharecipe.onrender.com/api"
    
    func fetchCurated() async throws -> [CuratedRecipeRes] {
        let urlString = "\(serviceEndPoint)/curated"
        return try await performGetCuratedRequest(urlString: urlString)
    }
    
    func createShareable(recipe: CreateShareableReq) async throws -> CreateShareableRes {
        let urlString = "\(serviceEndPoint)/shareable"
        return try await performCreateShareableRequest(urlString: urlString, recipe: recipe)
    }
    
    func getShareable(code: String) async throws -> GetShareableRes {
        let urlString = "\(serviceEndPoint)/shareable/\(code)"
        return try await performGetShareableRequest(urlString: urlString)
    }
    
    func performCreateShareableRequest(urlString: String, recipe: CreateShareableReq) async throws -> CreateShareableRes {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(recipe)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let result = try decoder.decode(CreateShareableRes.self, from: data)
        
        return result
    }
    
    func performGetShareableRequest(urlString: String) async throws -> GetShareableRes {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(GetShareableRes.self, from: data)
        
        return result
    }
    
    func performGetCuratedRequest(urlString: String) async throws -> [CuratedRecipeRes] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode([CuratedRecipeRes].self, from: data)
        
        return result
    }
    
}
