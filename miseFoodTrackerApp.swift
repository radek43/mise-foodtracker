//
//  miseFoodTrackerApp.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.04.2022.
//

import SwiftUI


@main
struct miseFoodTrackerApp: App {
    @StateObject var networkManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(AuthViewModel.shared)
                .environmentObject(LogViewModel())
                .environmentObject(networkManager)
        }
    }
}
