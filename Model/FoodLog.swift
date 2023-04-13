//
//  FoodLog.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.04.2023.
//

import Foundation
import SwiftUI

struct Meals {
    let mealType: String
    let meals: [Meal]
}

struct Meal {
    let title: String
    let calories: String
    let protein: String
    let carbs: String
    let fibers: String
    let fat: String
    let quantity: Int
}

struct FoodLog {
    let date: String
    let meals: String
    let liquids: String
    let activity: [Activity]
}

