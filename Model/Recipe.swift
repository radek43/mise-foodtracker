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

// RECIPE MODEL
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
