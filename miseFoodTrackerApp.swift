//
//  miseFoodTrackerApp.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.04.2022.
//

import SwiftUI


@main
struct miseFoodTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(AuthViewModel.shared)
                .environmentObject(LogViewModel())
        }
    }
}
