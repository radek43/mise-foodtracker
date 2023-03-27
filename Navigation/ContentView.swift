//
//  ContentView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/9/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private var keychainService = KeychainService()
 
    // MARK: - BODY
    var body: some View {
        if viewModel.isLoggedIn == false {
            // no user logged in
            LoginView()
        } else {
            // user logged in
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
