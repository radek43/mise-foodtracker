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
    
    private var keychainService = KeychainService()
    
    init() {
        print(FileManager.docDirURL.path)
        if FileManager().docExist(docName: fileName) {
            loadLogs()
        }
    }
    
    // MARK: - FUNCTIONS
    func addDishToLog(date: Date, dish: DishLog, completion: () -> Void) {
        // create or add new dishes to log
        var confirmed = false
        
        // check if a log with selected date is already created
        if let index = logs.firstIndex(where: { $0.dateTime == date }) {
            logs[index].foods.append(dish)
            saveLog()
            print("DEBUG: Dish appended")
            print(logs)
            confirmed = true
        } else {
            logs.append(Log(dateTime: date, foods: [dish]))
            saveLog()
            print("DEBUG: Dish added to new log")
            print(logs)
            confirmed = true
        }
        
        // dismiss view after log is updated
        if confirmed == true {
            completion()
        }
    }
    
    func addActivityToLog(date: Date, activity: ActivityLog, completion: () -> Void) {
        // create or add new activities to log
        var confirmed = false
        
        // check if a log with selected date is already created
        if let index = logs.firstIndex(where: { $0.dateTime == date }) {
            logs[index].activities.append(activity)
            saveLog()
            print("DEBUG: Activity appended")
            print(logs)
            confirmed = true
        } else {
            logs.append(Log(dateTime: date, activities: [activity]))
            saveLog()
            print("DEBUG: Activity added to new log")
            print(logs)
            confirmed = true
        }
        
        // dismiss view after log is updated
        if confirmed == true {
            completion()
        }
    }
    
    func addWaterToLog(date: Date, water: Double, completion: () -> Void) {
        // create or add water to log
        var confirmed = false
        
        // check if a log with selected date is already created
        if let index = logs.firstIndex(where: { $0.dateTime == date }) {
            logs[index].water += water
            saveLog()
            print("DEBUG: Water appended")
            print(logs)
            confirmed = true
        } else {
            logs.append(Log(dateTime: date, water: water))
            saveLog()
            print("DEBUG: Water added to new log")
            print(logs)
            confirmed = true
        }
        
        // dismiss view after log is updated
        if confirmed == true {
            completion()
        }
    }
    
    func addWeightToLog(date: Date, weight: Double, completion: () -> Void) {
        // create or add weight to log
        var confirmed = false
        
        // check if a log with selected date is already created
        if let index = logs.firstIndex(where: { $0.dateTime == date }) {
            logs[index].weight = weight
            saveLog()
            print("DEBUG: Weight updated")
            print(logs)
            confirmed = true
        } else {
            logs.append(Log(dateTime: date, weight: weight))
            saveLog()
            print("DEBUG: Weight added to new log")
            print(logs)
            confirmed = true
        }
        
        // dismiss view after log is updated
        if confirmed == true {
            completion()
        }
    }
    
    @MainActor
    func updateUserWeight(weight: String) async throws {
        // update added weight from log to db
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
        } catch {
            self.error = error
        }
    }
    
    func lastWeekCalories() -> [Double] {
        // calculate total daily calories from the last 7 days
        var result: [Double] = []
        
        let calendar = Calendar.current
        let lastWeek = calendar.date(byAdding: .day, value: -7, to: Date().stripTime())!
        
        // filter logs by each day, add all found dishes and append to array
        for i in 0..<7 {
            let date = calendar.date(byAdding: .day, value: i, to: lastWeek)!
            let filteredLogs = logs.filter { calendar.isDate($0.dateTime, inSameDayAs: date) }
            let sumCalories = filteredLogs.reduce(0.0) { $0 + $1.foods.reduce(0.0) { $0 + $1.calories } }
            result.append(sumCalories)
        }
        return result
    }
    
    func containsFood() -> Bool {
        // check if a dish exists in a log
        for log in logs {
            for food in log.foods {
                if !food.title.isEmpty && food.calories > 0 {
                    return true
                }
            }
        }
        return false
    }
    
    func lastWeekFoods() -> [(dish: String, count: Double)] {
        // calculate the times a dish is eaten in the last 7 days
        let calendar = Calendar.current
        let lastWeek = calendar.date(byAdding: .day, value: -7, to: Date().stripTime())!
        
        // filter logs
        let logsFromLastWeek = logs.filter { $0.dateTime >= lastWeek }
        
        var foodCounts: [String: Double] = [:]
        
        // iterate over filtered logs
        for log in logsFromLastWeek {
            for food in log.foods {
                foodCounts[food.title, default: 0] += food.calories
            }
        }
        
        // sort descending
        let sortedFoods = foodCounts.sorted { $0.value > $1.value }

        return sortedFoods.map { ($0.key, $0.value) }
    }
    
    func deleteLog(indexSet: IndexSet) {
        // TODO: Delete logs
    }
    
    func loadLogs() {
        // load logs from documents
        FileManager().readDocument(docName: fileName) { result in
            switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        logs = try decoder.decode([Log].self, from: data)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func saveLog() {
        // save log to documents
        print("DEBUG: Saving logs to file system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(logs)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
