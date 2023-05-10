//
//  Log.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.04.2023.
//

import Foundation
import SwiftUI

enum DishCategory: String, CaseIterable {
    case breakfast  = "Mic Dejun"
    case lunch = "Prânz"
    case dinner = "Cină"
    case snack = "Gustări"
}

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
    var calories: Double
}

struct Log: Identifiable, Codable {
    var id: Date = Date()
    var foods: [DishLog] = []
    var activities: [ActivityLog] = []
    var weight: Double = 0
    var water: Double = 0

    var totalCalories: Double {
        var sum: Double = 0
        for food in foods {
            sum += food.calories
        }
        return sum
    }
    
    var totalActivityCalories: Double {
        var sum: Double = 0
        for activity in activities {
            sum += activity.calories
        }
        return sum
    }
    
    var totalProtein: Double {
        var sum: Double = 0
        for food in foods {
            sum += food.protein
        }
        return sum
    }
    
    var totalCarbs: Double {
        var sum: Double = 0
        for food in foods {
            sum += food.carbs
        }
        return sum
    }
    
    var totalFat: Double {
        var sum: Double = 0
        for food in foods {
            sum += food.fat
        }
        return sum
    }
}
