//
//  LogViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 11.05.2023.
//

import Foundation
import SwiftUI

class LogViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var logs: [Log] = []
    @Published var error: Error?
    @Published var didUpdateUserWeight = false
    
    private var keychainService = KeychainService()
    
    init() {
        loadLogs()
    }
    
    // MARK: - FUNCTIONS
    func addDishToLog(date: Date, dish: DishLog) {
        if let index = logs.firstIndex(where: { $0.dateTime == date }) {
            logs[index].foods.append(dish)
            print("dish appended")
            print(logs)
        } else {
            logs.append(Log(dateTime: date, foods: [dish]))
            print("dish added to new log")
            print(logs)
        }
    }
    
    func addActivityToLog(date: Date, activity: ActivityLog) {
        if let index = logs.firstIndex(where: { $0.dateTime == date }) {
            logs[index].activities.append(activity)
            print("activity appended")
            print(logs)
        } else {
            logs.append(Log(dateTime: date, activities: [activity]))
            print("activity added to new log")
            print(logs)
        }
    }
    
    func addWaterToLog(date: Date, water: Double) {
        if let index = logs.firstIndex(where: { $0.dateTime == date }) {
            logs[index].water += water
            print("water appended")
            print(logs)
        } else {
            logs.append(Log(dateTime: date, water: water))
            print("water added to new log")
            print(logs)
        }
    }
    
    func addWeightToLog(date: Date, weight: Double) {
        if let index = logs.firstIndex(where: { $0.dateTime == date }) {
            logs[index].weight = weight
            print("weight updated")
            print(logs)
        } else {
            logs.append(Log(dateTime: date, weight: weight))
            print("weight added to new log")
            print(logs)
        }
    }
    
    @MainActor
    func updateUserWeight(weight: String) async throws {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/me/") else {
            throw RecipeError.invalidURL
        }
        
        // Add the payload to the http request data
        let params = [
            "weight": weight
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
            self.didUpdateUserWeight = true
        } catch {
            self.error = error
        }
    }
    
    func deleteLog(indexSet: IndexSet) {
        
    }
    func loadLogs() {
//        logs = Log.sampleLogs
    }
    func saveLog() {
        print("DEBUG: Saving logs to file system..")
    }
    
}
