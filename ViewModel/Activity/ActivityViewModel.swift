//
//  ActivityViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 13.04.2023.
//

import Foundation


class ActivityViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var activities = [Activity]()
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    
    // MARK: - METHODS
    @MainActor
    func fetchActivities() async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/activity/activities/") else {
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
            guard let activities = try? JSONDecoder().decode([Activity].self, from: data) else {
                throw RecipeError.invalidData
            }
            self.activities = activities
        } catch {
            self.error = error
        }
    }
    
    func loadActivities() {
        Task(priority: .medium) {
            try await fetchActivities()
        }
    }
}
