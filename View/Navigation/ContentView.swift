//
//  ContentView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.04.2022.
//

import SwiftUI


struct ContentView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @ObservedObject var networkManager = NetworkManager()
    
    private var keychainService = KeychainService()
    
    // MARK: - BODY
    var body: some View {
        if networkManager.isConnected {
            if authViewModel.isLoggedIn == false {  //  User is not logged in
                LoginView()
            } else {  //  User is logged in
                TabBarView()
            }
        } else {
            NoInternetView()
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
