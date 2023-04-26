//
//  SettingsViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 19.04.2023.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var didUpdateMeasurements = false
    @Published var didUpdateObjective = false
    @Published var didUpdateProfile = false
    @Published var didUpdateProfileOnboard = false
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    
    // MARK: - METHODS
    @MainActor
    func updateMeasurements(weight: String, height: String) async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/me/") else {
            throw RecipeError.invalidURL
        }
        
        // Add the payload to the http request data
        let params = [
            "weight": weight,
            "height": height
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
        
        // Set the URLRequest to PATCH and to the specified URL
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error {
            print("postRecipe: \(error)")
        }
        
        // Send a PATCH request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw RecipeError.serverError
            }
            if try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .fragmentsAllowed]) is [String: Any] {}
            self.didUpdateMeasurements = true
        } catch {
            self.error = error
        }
    }

    @MainActor
    func updateObjective(calorieGoal: String) async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/me/") else {
            throw RecipeError.invalidURL
        }
        
        // Add the payload to the http request data
        let params = [
            "calorie_goal": calorieGoal,
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
        
        // Set the URLRequest to PATCH and to the specified URL
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error {
            print("postRecipe: \(error)")
        }
        
        // Send a PATCH request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw RecipeError.serverError
            }
            if try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .fragmentsAllowed]) is [String: Any] {}
            self.didUpdateObjective = true
        } catch {
            self.error = error
        }
    }
    
    @MainActor
    func updateProfile(gender: Int, fullname: String, dob: Date, activity: Int) async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/me/") else {
            throw RecipeError.invalidURL
        }
        
        let formattedDob = formatDateToString(date: dob)
        
        // Add the payload to the http request data
        let params = [
            "gender": gender,
            "fullname": fullname,
            "dob": formattedDob,
            "activity_factor": activity
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
        
        // Set the URLRequest to PATCH and to the specified URL
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error {
            print("postRecipe: \(error)")
        }
        
        // Send a PATCH request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw RecipeError.serverError
            }
            if try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .fragmentsAllowed]) is [String: Any] {}
            self.didUpdateProfile = true
        } catch {
            self.error = error
        }
    }
    
    @MainActor
    func updateProfileOnboard(weight: String, height: String, gender: Int ,dob: Date, activity: Int) async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/me/") else {
            throw RecipeError.invalidURL
        }
        
        let formattedDob = formatDateToString(date: dob)
        
        // Add the payload to the http request data
        let params = [
            "gender": gender,
            "weight": weight,
            "height": height,
            "dob": formattedDob,
            "activity_factor": activity
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
        
        // Set the URLRequest to PATCH and to the specified URL
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error {
            print("postRecipe: \(error)")
        }
        
        // Send a PATCH request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw RecipeError.serverError
            }
            if try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .fragmentsAllowed]) is [String: Any] {}
//            self.didUpdateProfile = true
        } catch {
            self.error = error
        }
    }
    
    
    // Converts a Date var to a String
    func formatDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
