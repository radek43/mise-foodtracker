//
//  DishListViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 05.05.2023.
//

import Foundation


class DishViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var dishes = [FoodList]()
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    
    // MARK: - METHODS
    @MainActor
    func fetchDishes() async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/food/foods/") else {
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
        
        // Send a GET request to the URL, with the data we created earlier
        do {
            let (data, response) = try await session.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw RecipeError.serverError
            }
            guard let dishes = try? JSONDecoder().decode([FoodList].self, from: data) else {
                throw RecipeError.invalidData
            }
            self.dishes = dishes
        } catch {
            self.error = error
        }
    }
    
    func loadDishes() {
        Task(priority: .medium) {
            try await fetchDishes()
        }
    }
}
