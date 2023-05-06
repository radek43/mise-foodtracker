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
    @Published var error: Error?
    
    private var keychainService = KeychainService()
    
    init() {
        // Check if the user is already logged in
        self.taskGetUser()
    }
    
    static let shared = AuthViewModel()
    
    // MARK: - METHODS
    @MainActor
    func signIn(email: String, password: String) async throws {
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/token/") else {
            throw UserError.invalidURL
        }
        
        // Add the payload to the http request data
        let payload = [
            "email": email,
            "password": password
        ] as [String: Any]
        
        // Add request properties
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Send a POST request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw UserError.serverError
            }
            
            if try JSONSerialization.jsonObject(with: data, options: .mutableContainers) is [String: Any] {}
            
            guard let tokenObject = try? JSONDecoder().decode(Token.self, from: data) else {
                throw UserError.invalidData
            }
            // Save user data
            UserDefaults.standard.set(String(email), forKey: "userEmail")
            try self.keychainService.save(service: "mise-foodtracker", account: email, password: tokenObject.token.data(using: .utf8) ?? Data())
            
            try await getUser()
            
        } catch {
            self.error = error
        }
    }
    
    
    @MainActor
    func signUp(email: String, username: String, fullname: String, password: String) async throws {
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/create/") else {
            throw UserError.invalidURL
        }
        
        // Add the payload to the http request data
        let payload = [
            "email": email,
            "name": username,
            "fullname": fullname,
            "password": password
        ] as [String: Any]
        
        // Request properties
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Send a POST request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 201 else {
                throw UserError.serverError
            }
            
            if try JSONSerialization.jsonObject(with: data, options: .mutableContainers) is [String: Any] {}
            
            guard let user = try? JSONDecoder().decode(User.self, from: data) else {
                throw UserError.invalidData
            }
            
            try await getToken(email: email , password: password)
            
            self.isLoggedIn = true
            self.currentUser = user
            
        } catch {
            self.error = error
        }
    }
    
    func signOut() {
        guard let email = UserDefaults.standard.string(forKey: "userEmail") else { return }
        
        // Delete token from keychain
        guard (try? self.keychainService.remove(service: "mise-foodtracker", account: email)) != nil else {
            print("KeychainService: Failed to remove keychain data")
            return
        }
        UserDefaults.standard.removeObject(forKey: "userEmail")
        
        DispatchQueue.main.async {
            self.isLoggedIn = false
        }
    }
    
    func getToken(email: String, password: String) async throws {
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/token/") else {
            throw UserError.invalidURL
        }
        
        // Add the payload to the HTTP request data
        let payload = [
            "email": email,
            "password": password
        ] as [String: Any]
        
        // Add request properties
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Send a POST request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw UserError.serverError
            }
            
            if try JSONSerialization.jsonObject(with: data, options: .mutableContainers) is [String: Any] {}
            
            guard let tokenObject = try? JSONDecoder().decode(Token.self, from: data) else {
                throw UserError.invalidData
            }
            // Save user data
            UserDefaults.standard.set(String(email), forKey: "userEmail")
            try self.keychainService.save(service: "mise-foodtracker", account: email, password: tokenObject.token.data(using: .utf8) ?? Data())
            
        } catch {
            self.error = error
        }
    }
    
    @MainActor
    func getUser() async throws {
        var token = ""
        guard let email = UserDefaults.standard.string(forKey: "userEmail") else { return }
        // Get token from keychain
        do {
            guard let keychainResult = (try self.keychainService.get(service: "mise-foodtracker", account: email)) else {
                print("KeychainService: Failed to read token.")
                return
            }
            token = String(decoding: keychainResult, as: UTF8.self)
        } catch {
            print("fetchUser:\(error)")
        }
        
        // Check if URL exists
        guard let url = URL(string: "http://127.0.0.1:8000/api/user/me/") else {
            throw UserError.invalidURL
        }
        
        // Request properties
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        // Send a GET request to the URL, with the data we created earlier
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw UserError.serverError
            }
            
            if try JSONSerialization.jsonObject(with: data, options: .mutableContainers) is [String: Any] {}
            
            guard let user = try? JSONDecoder().decode(User.self, from: data) else {
                throw UserError.invalidData
            }
            self.currentUser = user
            self.isLoggedIn = true
            
        } catch {
            self.error = error
        }
    }
    
    func taskGetUser() {
        Task {
            try await getUser()
        }
    }
}
