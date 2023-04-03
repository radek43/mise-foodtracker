//
//  miseFoodTrackerApp.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.04.22.
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
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
