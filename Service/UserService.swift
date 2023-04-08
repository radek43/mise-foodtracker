//
//  UserService.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 06.04.2023.
//

import Foundation

struct UserService {
    private var keychainService = KeychainService()
    
    func fetchUser(email: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void) {
        var token = ""
        
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
        
        // USER ENDPOINT
        let urlString = "http://127.0.0.1:8000/api/user/me/"
        
        // CHECK IF URL EXISTS
        guard let url = URL(string: urlString) else {
            print("fetchUser: API is not available")
            return
        }
        
        // REQUEST PROPERTIES
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        // CREATE REQUEST
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: ", error)
                return
                
            }
            guard let data = data else {
                completion(.failure(.invalidCredentials))
                return
            }

            completion(.success(data))
            
            if (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) != nil {
                
            }
        }
        task.resume()
    }
    
    
}


