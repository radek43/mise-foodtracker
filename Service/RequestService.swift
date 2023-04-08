//
//  RequestService.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 31.03.2023.
//

import Foundation

public class RequestService {
    // MARK: - PROPERTIES
    public static var requestDomain = ""
    static var keychainService = KeychainService()
    
    // MARK: - FUNCTIONS
    public static func postRecipe(email: String, title: String, category: String, time_minutes: Int, description: String, ingredients: String, calories: Decimal, protein: Decimal, carbs: Decimal, fibers: Decimal, fat: Decimal, completion: @escaping (_ result: [String: Any]?) -> Void) {
        
        // Add the payload to the http request data
        let params = [
            "title": title,
            "calories": calories,
            "category": category,
            "time_minutes": time_minutes,
            "protein": protein,
            "carbs": carbs,
            "fibers": fibers,
            "fat": fat,
            "description": description,
            "ingredients": ingredients
        ] as [String : Any]
        
        var token = ""
        
        // Get token from KeyChain
        do {
            guard let keychainResult = (try self.keychainService.get(service: "mise-foodtracker", account: email)) else {
                print("KeychainService: Failed to read token.")
                return
            }
            token = String(decoding: keychainResult, as: UTF8.self)
        } catch {
            print("fetchUser:\(error)")
        }
        
        // Set the URLRequest to POST and to the specified URL
        let url = URL(string: requestDomain)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error {
            print("postRecipe: \(error)")
        }
        
        // Send a POST request to the URL, with the data we created earlier
        let task = URLSession.shared.dataTask(with: request) { data, result, error in
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .fragmentsAllowed]) as? [String: Any] {
                    completion(json)
                }
            } catch let error {
                print("fetchUser.dataTask: \(error)")
            }
        }
        task.resume()
    }    
}
