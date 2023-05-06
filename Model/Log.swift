//
//  FoodLog.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.04.2023.
//

import Foundation
import SwiftUI

struct MealLog: Identifiable, Codable {
    var id: String = UUID().uuidString
    var mealtype: Int
    var title: String
    var servingSize: Float
    var calories: Float
    var protein: Float
    var carbs: Float
    var fibers: Float
    var fat: Float
}

struct ActivityLog: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var calories: Float
}

struct Log: Identifiable, Codable {
    var id: Date
    var food: [MealLog]
    var activity: [ActivityLog]
    var weight: Float
    var water: Float
}
