//
//  miseFoodTrackerApp.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.04.2022.
//

import SwiftUI


@main
struct miseFoodTrackerApp: App {
    // MARK: - PROPERTIES
    //    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    //    @StateObject var viewModel = AuthViewModel()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
