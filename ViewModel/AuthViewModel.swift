//
//  AuthViewModel.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 08.03.2023.
//

import Foundation


class AuthViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var currentUser: User?
    @Published var isLoggedIn = false
    private var keychainService = KeychainService()
    let defaults = UserDefaults.standard
    
    init() {
        // check if user is already logged in
        self.fetchUser()
    }
    
    // MARK: - METHODS
    func fetchUser() {
        do {
            guard let email = defaults.string(forKey: "userEmail") else {
                isLoggedIn = false
                return
            }
            
            // get token from keychain
            guard (try self.keychainService.get(service: "mise-foodtracker", account: email)) != nil else {
                print("failed to read password")
                isLoggedIn = false
                return
            }
            
        } catch {
            print("keychainError:\(error)")
        }
        isLoggedIn = true
    }
    
    func postCredentials(email: String, password: String) {
        let tokenUrl = "http://127.0.0.1:8000/api/user/token/"
        
        guard
            let url = URL(string: tokenUrl)
        else {
            print("DEBUG: API is not available")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body: [String: Any] = ["email": email, "password": password]
        
        do {
            let finalData = try JSONSerialization.data(withJSONObject: body)
            request.httpBody = finalData
        } catch (let error) {
            print(error)
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            do {
                if let data = data { // if auth success
                    let result = try JSONDecoder().decode(Token.self, from: data)
                    print(result)

                    do { // save token in keychain
                        try self.keychainService.save(service: "mise-foodtracker", account: email, password: result.token.data(using: .utf8) ?? Data())
                    } catch {
                        print("keychainError:\(error)")
                    }
                    
                    // set email in userDefaults
                    self.defaults.set(email, forKey: "userEmail")
                    
                } else {
                    print("DEBUG: No data returned from API")
                }
            } catch (let error) {
                print("API:\(error)")
            }
            self.fetchUser()
        }.resume() 
    }

    func signOut() {
        guard let email = defaults.string(forKey: "userEmail") else { return }
        
        // delete from token from keychain
        guard (try? self.keychainService.remove(service: "mise-foodtracker", account: email)) != nil else {
            print("failed to remove keychain data")
            return
        }
        defaults.removeObject(forKey: "userEmail")
        isLoggedIn = false
    }
    
}
