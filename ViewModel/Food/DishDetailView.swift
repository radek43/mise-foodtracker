//
//  DishDetailView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 05.05.2023.
//

import Foundation
import SwiftUI


class DishDetailViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var dish: Food?
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    let dishId: Int
    
    init(withDishId dishId: Int) {
        self.dishId = dishId
    }
    
    // MARK: - METHODS
    @MainActor
    func fetchDish() async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/food/foods/\(self.dishId)/") else {
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
            guard let dish = try? JSONDecoder().decode(Food.self, from: data) else {
                throw RecipeError.invalidData
            }
            self.dish = dish
            
        } catch {
            self.error = error
        }
    }
    
    func deleteDish() async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/activity/activities/\(self.dishId)/") else {
            throw RecipeError.invalidURL
        }
        
        // Get token from KeyChain
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
