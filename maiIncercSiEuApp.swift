//
//  maiIncercSiEuApp.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/9/22.
//

import SwiftUI
import Firebase

@main
struct maiIncercSiEuApp: App {
    
    // MARK: - PROPERTIES
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    // MARK: - BODY
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
