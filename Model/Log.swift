//
//  Log.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.04.2023.
//

import Foundation
import SwiftUI

enum DishCategory: Int, CaseIterable {
    case breakfast  = 1
    case lunch = 2
    case dinner = 3
    case snack = 4
}

// Meal type integers:
//   - 1: Breakfast
//   - 2: Lunch
//   - 3: Dinner
//   - 4: Snacks
struct DishLog: Identifiable, Codable, Hashable {
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
    var duration: Double
    var met: Double
    var weight: Double
}

struct Log: Identifiable, Codable {
    // MARK: - PROPERTIES
    var id: String = UUID().uuidString
    var dateTime: Date
    var foods: [DishLog] = []
    var activities: [ActivityLog] = []
    var weight: Double = 0
    var water: Double = 0
    
    // MARK: - COMPUTED PROPERTIES
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
    
    var totalBreakfast: Double {
        var sum: Double = 0
        for food in foods {
            if food.mealtype == 1 {
                sum += food.calories
            }
        }
        return sum
    }
    
    var totalLunch: Double {
        var sum: Double = 0
        for food in foods {
            if food.mealtype == 2 {
                sum += food.calories
            }
        }
        return sum
    }
    
    var totalDinner: Double {
        var sum: Double = 0
        for food in foods {
            if food.mealtype == 3 {
                sum += food.calories
            }
        }
        return sum
    }
    
    var totalSnacks: Double {
        var sum: Double = 0
        for food in foods {
            if food.mealtype == 4 {
                sum += food.calories
            }
        }
        return sum
    }
}
