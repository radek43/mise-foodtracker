//
//  AuthViewModel.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/26/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(String(describing: self.userSession))")
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: Register with email \(email)")
    }
}
