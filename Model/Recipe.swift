//
//  Recipe.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 03.09.2022.
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
    let category: String
    let calories: Double
    let protein: Double
    let carbs: Double
    let fat: Double
    let image: String?
}


// RECIPE MODEL
struct Recipe: Codable, Identifiable {
    let id: Int
    let title: String
    let category: String
    let calories: Double
    let protein: Double
    let carbs: Double
    let fat: Double
    let image: String?
    let fibers: Double
    let time_minutes: Int
    let description: String
    let ingredients: String
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
