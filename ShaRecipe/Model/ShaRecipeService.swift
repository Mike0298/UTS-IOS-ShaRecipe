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
    
    // the shareable code will be in the url params instead of HTTP request body
    func getShareable(code: String) async throws -> GetShareableRes {
        let urlString = "\(serviceEndPoint)/shareable/\(code)"
        return try await performGetShareableRequest(urlString: urlString)
    }
    
    // send the recipe to the server and retrieve the code from the server
    func performCreateShareableRequest(urlString: String, recipe: CreateShareableReq) async throws -> CreateShareableRes {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // encode data for POST request and put it into HTTP request body
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(recipe)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        // decode data for POST respond
        let decoder = JSONDecoder()
        let result = try decoder.decode(CreateShareableRes.self, from: data)
        
        return result
    }
    
    // retrieve the shareable recipe from the server
    func performGetShareableRequest(urlString: String) async throws -> GetShareableRes {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        // decode data for POST respond
        let decoder = JSONDecoder()
        let result = try decoder.decode(GetShareableRes.self, from: data)
        
        return result
    }
    
    // retrieve all curated recipe from the server
    func performGetCuratedRequest(urlString: String) async throws -> [CuratedRecipeRes] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        // decode data for POST respond
        let decoder = JSONDecoder()
        let result = try decoder.decode([CuratedRecipeRes].self, from: data)
        
        return result
    }
    
}
