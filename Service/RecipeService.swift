//
//  RecipeService.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.04.2023.
//

import Foundation


struct RecipeService {
    private var keychainService = KeychainService()
    
    func fetchRecipeList(email: String, completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
        // Get token from KeyChain
        var token = ""
        
        do {
            guard let keychainResult = (try self.keychainService.get(service: "mise-foodtracker", account: email)) else {
                print("KeychainService: Failed to read token.")
                return
            }
            token = String(decoding: keychainResult, as: UTF8.self)
        } catch {
            print("fetchUser:\(error)")
        }
        
        // Set the URLRequest parameters
        let url = URL(string: "http://127.0.0.1:8000/api/recipe/recipes/")!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        // Send a GET request to the URL and parse the response
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.noData))
                return
            }
            guard let data = data else {
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    func fetchRecipeDetail(email: String, id: Int, completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
        // Get token from KeyChain
        var token = ""
        
        do {
            guard let keychainResult = (try self.keychainService.get(service: "mise-foodtracker", account: email)) else {
                print("KeychainService: Failed to read token.")
                return
            }
            token = String(decoding: keychainResult, as: UTF8.self)
        } catch {
            print("fetchUser:\(error)")
        }
        
        // Set the URLRequest parameters
        let urlString = "http://127.0.0.1:8000/api/recipe/recipes/\(id)/"
        let url = URL(string: urlString)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        // Send a GET request to the URL and parse the response
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.noData))
                return
            }
            guard let data = data else {
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
