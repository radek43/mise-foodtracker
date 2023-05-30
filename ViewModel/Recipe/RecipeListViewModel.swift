//
//  RecipeViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 04.04.2023.
//

import Foundation
import SwiftUI

class RecipeListViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var recipes = [RecipeList]()
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    
    // MARK: - METHODS
    @MainActor
    func fetchRecipes() async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/recipe/recipes/") else {
            throw RecipeError.invalidURL
        }
        
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
        
        do {
            let (data, response) = try await session.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw RecipeError.serverError
            }
            guard let recipes = try? JSONDecoder().decode([RecipeList].self, from: data) else {
                throw RecipeError.invalidData
            }
            self.recipes = recipes
        } catch {
            self.error = error
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await fetchRecipes()
        }
    }
}
