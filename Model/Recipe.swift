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
