//
//  Log.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.04.2023.
//

import Foundation
import SwiftUI

struct DishLog: Identifiable, Codable {
    var id: String = UUID().uuidString
    var mealtype: Int
    var title: String
    var servingSize: Double
    var calories: Double
    var protein: Double
    var carbs: Double
    var fibers: Double
    var fat: Double
}

struct ActivityLog: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var calories: Float
}

struct Log: Identifiable, Codable {
    var id: Date
    var food: [DishLog]
    var activity: [ActivityLog]
    var weight: Float
    var water: Float
}
