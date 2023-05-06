//
//  AddFoodViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 04.05.2023.
//

import Foundation
import SwiftUI


class AddFoodViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var didUploadFood = false
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    
    // MARK: - METHODS
    @MainActor
    func postFood(title: String, calories: String, carbs: String, fibers: String, fat: String, protein: String, estimates: String) async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/food/foods/") else {
            throw RecipeError.invalidURL
        }
        
        // Add the payload to the HTTP request data
        let params = [
            "title": title,
            "calories": calories,
            "carbs": carbs,
            "fibers": fibers,
            "fat": fat,
            "protein": protein,
            "estimates": estimates
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
        
        // Set the URLRequest to POST and to the specified URL
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error {
            print("postRecipe: \(error)")
        }
        
        // Send a POST request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 201 else {
                throw RecipeError.serverError
            }
            if try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .fragmentsAllowed]) is [String: Any] {
                
            }
            self.didUploadFood = true
        } catch {
            self.error = error
        }
    }
}
