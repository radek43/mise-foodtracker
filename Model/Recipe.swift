//
//  Recipe.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 9/3/22.
//

import Foundation
import SwiftUI

// RECIPE CATEGORY
enum Category: String, CaseIterable {
    case supa  = "Supa"
    case ciorba = "Ciorba"
    case mancaruri = "Mancaruri"
    case coctailSiShake = "Cocktail & Shake"
    case salata = "Salata"
    case desert = "Desert"
}


struct RecipeList: Codable, Identifiable {
    let id: Int
    let title: String
    let calories: String
    let image: String?
}


// RECIPE MODEL
struct Recipe: Codable, Identifiable {
    let id: Int
    let title: String
    let calories: String
    let category: String
    let time_minutes: Int
    let protein: String
    let carbs: String
    let fibers: String
    let fat: String
    let description: String
    let ingredients: String
    let image: String?
}

enum RecipeError: Error, LocalizedError {
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
