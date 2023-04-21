//
//  User.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 9/1/22.
//

import SwiftUI

enum UserError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return ""
            case .serverError:
                return "S-a produs o eroare la partea de server. Va rugam incercati mai tarziu"
            case .invalidData:
                return "A aparut o eroare. Va rugam incercati mai tarziu."
            case .unknown(let error):
                return error.localizedDescription
        }
    }
}

// TOKEN MODEL
struct Token: Codable {
    let token: String
}

// USER MODEL
struct User: Codable {
    let email: String
    let name: String
    let fullname: String
    let is_staff: Bool
    let calorie_goal: String
    let weight: String
    let height: String
    let gender: String
}

// EXTENSIONS
extension User {
    static let dummyData: [User] = [
        User(email: "John Doe", name: "john.doe", fullname: "john.doe@email.com", is_staff: false, calorie_goal: "2854", weight: "84", height: "187", gender: "Masculin")
    ]
}

