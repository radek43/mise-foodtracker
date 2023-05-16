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
    
    func addLog(log: Log) {
        
    }
    func updateLog(log: Log) {
        
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
