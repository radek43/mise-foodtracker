//
//  AuthViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.03.2023.
//

import Foundation


class AuthViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var currentUser: User?
    @Published var isLoggedIn = false
    
    private var keychainService = KeychainService()
    private let service = UserService()
    
    init() {
        // CHECK IF USER IS ALREADY LOGGED IN
        self.fetchUser()
    }
    
    static let shared = AuthViewModel()
    
    // MARK: - METHODS
    func register(email: String, username: String, fullname: String, password: String) {
        AuthServices.register(email: email, username: username, fullname: fullname, password: password) { result in
            switch result {
                case .success(let data):
                    guard (try? JSONDecoder().decode(User.self, from: data!)) != nil else { return }
                    DispatchQueue.main.async {
                        self.fetchUser()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func login(email: String, password: String) {
        AuthServices.login(email: email, password: password) { result in
            switch result {
                case .success(let data):
                    guard let response = try? JSONDecoder().decode(Token.self, from: data!) else {
                        print("AuthServices-Login: No response from API")
                        return
                    }
                    do { // save token in keychain
                        UserDefaults.standard.set(String(email), forKey: "userEmail")
                        try self.keychainService.save(service: "mise-foodtracker", account: email, password: response.token.data(using: .utf8) ?? Data())
                    } catch {
                        print("KeychainServiceError:\(error)")
                    }
                    DispatchQueue.main.async {
                        self.isLoggedIn = true
                        self.fetchUser()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func fetchUser() {
        guard let email = UserDefaults.standard.string(forKey: "userEmail") else { return }
        
        service.fetchUser(email: email) { result in
            switch result {
                case .success(let data):
                    guard let user = try? JSONDecoder().decode(User.self, from: data!) else { return }
                    print("fetchUser: Succes fetching user")
                    DispatchQueue.main.async {
                        UserDefaults.standard.set(user.email, forKey: "userEmail")
                        self.isLoggedIn = true
                        self.currentUser = user
                    }
                    
                case .failure(let error):
                    print("AuthViewModel.fetchUser: \(error.localizedDescription)")
            }
        }
    }
    
    func signOut() {
        guard let email = UserDefaults.standard.string(forKey: "userEmail") else { return }
        
        // delete from token from keychain
        guard (try? self.keychainService.remove(service: "mise-foodtracker", account: email)) != nil else {
            print("KeychainService: Failed to remove keychain data")
            return
        }
        UserDefaults.standard.removeObject(forKey: "userEmail")
        
        DispatchQueue.main.async {
            self.isLoggedIn = false
        }
    }
}
