//
//  RecipeEditViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 14.04.2023.
//

import Foundation
import SwiftUI

class RecipeEditViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var didUpdateRecipe = false
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    
    // MARK: - METHODS
    @MainActor
    func updateRecipe(id: Int, title: String, category: String, time_minutes: Int, description: String, ingredients: String, calories: String, protein: String, carbs: String, fibers: String, fat: String, image: UIImage?) async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/recipe/recipes/\(id)/") else {
            throw RecipeError.invalidURL
        }
        
        // Add the payload to the request data
        let params = [
            "id": id,
            "title": title,
            "calories": calories,
            "category": category,
            "time_minutes": time_minutes,
            "protein": protein,
            "carbs": carbs,
            "fibers": fibers,
            "fat": fat,
            "description": description,
            "ingredients": ingredients
        ] as [String : Any]
        
        var token = ""
        
        // Get token from Keychain
        do {
            guard let keychainResult = (try self.keychainService.get(service: "mise-foodtracker", account: user.email)) else {
                print("KeychainService: Failed to read token.")
                return
            }
            token = String(decoding: keychainResult, as: UTF8.self)
        } catch {
            print("fetchUser:\(error)")
        }
        
        // Set the URLRequest to PUT and to the specified URL
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error {
            print("postRecipe: \(error)")
        }
        
        // Send a PUT request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw RecipeError.serverError
            }
            if let result = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .fragmentsAllowed]) as? [String: Any] {
                if let image = image {
                    if let id = result["id"] {
                        ImageUploader.uploadImage(email: user.email, paramName: "image", fileName: "image.jpeg", image: image, urlPath: "/api/recipe/recipes/\(id)/upload-image/")
                    }
                }
            }
            self.didUpdateRecipe = true
        } catch {
            self.error = error
        }
    }
}
