//
//  LogViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 11.05.2023.
//

import Foundation

class LogViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var logs: [Log] = []
    
    init() {
        loadLogs()
    }
    
    // MARK: - FUNCTIONS
    func addLog(log: Log) {
        
    }
    func updateLog(log: Log) {
        
    }
    func deleteLog(indexSet: IndexSet) {
        
    }
    func loadLogs() {
        logs = Log.sampleLogs
    }
    func saveLog() {
        print("DEBUG: Saving logs to file system..")
    }
    
}
