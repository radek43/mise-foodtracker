//
//  RecipeDetailViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.04.2023.
//

import Foundation
import SwiftUI

class RecipeDetailViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var recipe: Recipe?
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    let recipeId: Int
    
    init(withrecipeId recipeId: Int) {
        self.recipeId = recipeId
    }
    
    // MARK: - METHODS
    @MainActor
    func fetchRecipe() async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/recipe/recipes/\(self.recipeId)/") else {
            throw RecipeError.invalidURL
        }
        
        // Get token from Keychain
        var token = ""
        
        do {
            guard let keychainResult = (try self.keychainService.get(service: "mise-foodtracker", account: user.email)) else {
                print("KeychainService: Failed to read token.")
                return
            }
            token = String(decoding: keychainResult, as: UTF8.self)
        } catch {
            print("fetchUser:\(error)")
        }
        
        // Set the URLRequest parameters
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        // Send a GET request to the URL and parse the response
        do {
            let (data, response) = try await session.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw RecipeError.serverError
            }
            guard let recipe = try? JSONDecoder().decode(Recipe.self, from: data) else {
                throw RecipeError.invalidData
            }
            self.recipe = recipe
            
        } catch {
            self.error = error
        }
    }
    
    func deleteRecipe() async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/recipe/recipes/\(self.recipeId)/") else {
            throw RecipeError.invalidURL
        }
        
        // Get token from Keychain
        var token = ""
        
        do {
            guard let keychainResult = (try self.keychainService.get(service: "mise-foodtracker", account: user.email)) else {
                print("KeychainService: Failed to read token.")
                return
            }
            token = String(decoding: keychainResult, as: UTF8.self)
        } catch {
            print("fetchUser:\(error)")
        }
        
        // Set the URLRequest parameters
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        // Send a DELETE request to the URL and parse the response
        do {
            let (_, response) = try await session.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 204 else {
                throw RecipeError.serverError
            }
        } catch {
            self.error = error
        }
    }
}
