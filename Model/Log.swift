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
    
    // MARK: - SAMPLE DATA
    static var sampleLogs: [Log] = [
        Log(dateTime: Date.from(year: 2023, month: 5, day: 6),
            foods: [
            DishLog(mealtype: 1,
                    title: "Cartofi prajiti",
                    servingSize: 100,
                    calories: 150,
                    protein: 14,
                    carbs: 31,
                    fibers: 0,
                    fat: 25),
            DishLog(mealtype: 1,
                    title: "Ciorbă de cartofi",
                    servingSize: 100,
                    calories: 350,
                    protein: 44,
                    carbs: 23,
                    fibers: 0,
                    fat: 11),
            DishLog(mealtype: 1,
                    title: "Cereale cu lapte",
                    servingSize: 100,
                    calories: 420,
                    protein: 32,
                    carbs: 47,
                    fibers: 0,
                    fat: 15)
        ],
            activities: [
                ActivityLog(title: "Alergare", calories: 48),
                ActivityLog(title: "Haltere", calories: 23),
                ActivityLog(title: "Plimbare", calories: 12)
            ],
            weight: 50,
            water: 6),
        
        Log(dateTime: Date.from(year: 2023, month: 5, day: 7), foods: [
            DishLog(mealtype: 1,
                    title: "Pepene roșu",
                    servingSize: 100,
                    calories: 250,
                    protein: 64,
                    carbs: 13,
                    fibers: 0,
                    fat: 21),
            DishLog(mealtype: 1,
                    title: "Căpșuni",
                    servingSize: 100,
                    calories: 250,
                    protein: 14,
                    carbs: 12,
                    fibers: 0,
                    fat: 28),
            DishLog(mealtype: 1,
                    title: "Alune",
                    servingSize: 100,
                    calories: 250,
                    protein: 24,
                    carbs: 23,
                    fibers: 0,
                    fat: 25)
        ],
            activities: [
                ActivityLog(title: "Plimbare", calories: 140),
                ActivityLog(title: "Alergare", calories: 140),
                ActivityLog(title: "Somn", calories: 140)
            ],
            weight: 78,
            water: 3),
        Log(dateTime: Date.from(year: 2023, month: 5, day: 8), foods: [
            DishLog(mealtype: 1,
                    title: "Halva",
                    servingSize: 100,
                    calories: 250,
                    protein: 74,
                    carbs: 23,
                    fibers: 0,
                    fat: 21),
            DishLog(mealtype: 1,
                    title: "Ciocolată",
                    servingSize: 100,
                    calories: 250,
                    protein: 36,
                    carbs: 63,
                    fibers: 0,
                    fat: 18),
            DishLog(mealtype: 1,
                    title: "Bere",
                    servingSize: 100,
                    calories: 50,
                    protein: 4,
                    carbs: 13,
                    fibers: 0,
                    fat: 45)
        ],
            activities: [
                ActivityLog(title: "Somn", calories: 140),
                ActivityLog(title: "ALergare", calories: 140),
                ActivityLog(title: "Haltere", calories: 140)
            ],
            weight: 20,
            water: 1),
    ]
}
