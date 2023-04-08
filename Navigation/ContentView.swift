//
//  ContentView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/9/22.
//

import SwiftUI


struct ContentView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private var keychainService = KeychainService()
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.isLoggedIn == false {  //  NO USER LOGGED IN
            LoginView()
        } else {  //  USER LOGGED IN
            TabBar()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .preferredColorScheme(.dark)
        }
    }
}

// MARK: - GLOBAL VARIABLES
let screen = UIScreen.main.bounds
