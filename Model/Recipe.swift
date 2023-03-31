//
//  Recipe.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/3/22.
//

import Foundation

enum Category: String {
    case supa  = "Supa"
    case ciorba = "Ciorba"
    case mancaruri = "Mancaruri"
    case coctailSiShake = "Cocktail & Shake"
    case salata = "Salata"
    case desert = "Desert"
}

struct Recipe: Codable, Identifiable {
    let id: Int
    let title: String
    let category: Category.RawValue
    let time_minutes: Int
    let calories: Double
    let protein: Double
    let carbs: Double
    let fibers: Double
    let fat: Double
    let description: String
    let ingredients: String
    let image: String?
    
}
