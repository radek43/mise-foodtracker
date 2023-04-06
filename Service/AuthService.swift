//
//  AuthService.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 27.03.2023.
//

import Foundation
import SwiftUI

// MARK: - ERROR ENUMS
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}


public class AuthServices {
    // MARK: - PROPERTIES
    public static var requestDomain = ""
    static var keychainService = KeychainService()
    
    // MARK: - METHODS
    static func login(email: String, password: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void) {
        // LOGIN ENDPOINT
        let urlString = "http://127.0.0.1:8000/api/user/token/"
        
        // LOGIN REQUEST
        makeRequest(urlString: urlString, reqBody: ["email": email, "password": password]) { result in
            switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(_):
                    completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func register(email: String, username: String, fullname: String, password: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void) {
        // REGISTER ENDPOINT
        let urlString = "http://127.0.0.1:8000/api/user/create/"
        
        // REGISTER REQUEST
        makeRequest(urlString: urlString, reqBody: ["email": email, "name": username, "fullname": fullname, "password": password]) { result in
            switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(_):
                    completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func makeRequest(urlString: String, reqBody: [String: Any], authorization: String? = nil, completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
        // CHECK IF URL EXISTS
        guard let url = URL(string: urlString) else {
            print("makeRequest: API is not available")
            return
        }
        
        // REQUEST PROPERTIES
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if let authorization = authorization {
            request.addValue("Token \(authorization)", forHTTPHeaderField: "Authorization")
        }
        
        // CREATE REQUEST
        let task = URLSession.shared.dataTask(with: request) { data, res, err in
            guard err == nil else { return }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success(data))
            
            do {
                if try JSONSerialization.jsonObject(with: data, options: .mutableContainers) is [String: Any] {}
                
            } catch let error {
                completion(.failure(.decodingError))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func fetchUser(email: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void) {
        var token = ""
        
        // GET TOKEN FROM KEYCHAIN
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
            

            if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] { print(json) }

        }
        task.resume()
    }
}
