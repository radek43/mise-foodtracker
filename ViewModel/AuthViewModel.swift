//
//  AuthViewModel.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 08.03.2023.
//

import Foundation

class AuthViewModels: ObservableObject {
    // MARK: - Properties
    @Published var email = ""
    @Published var password = ""

    // MARK: -

    @Published var hasError = false

    @Published var isSigningIn = false

    // MARK: -

    var canSignIn: Bool {
        !email.isEmpty && !password.isEmpty
    }

    // MARK: - Public API
    
    func signIn() {
        guard !email.isEmpty && !password.isEmpty else {
            return
        }

        var request = URLRequest(url: URL(string: "http://http://127.0.0.1:8000/api/user/token")!)
        
        request.httpMethod = "POST"
        
        let authData = (email + ":" + password).data(using: .utf8)!.base64EncodedString()
    
    }

    
}
