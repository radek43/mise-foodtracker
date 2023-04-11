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
    let excersises: [Excersise]
}

struct Excersise: Identifiable {
    var id: Int
    let title: String
    let met: String
}

extension Excersise {
    static let dummyData: [Excersise] = [
        Excersise(id: 1, title: "title", met: "2.4")
    ]
}
