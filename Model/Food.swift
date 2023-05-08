//
//  Food.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 04.05.2023.
//

import Foundation


struct FoodList: Codable, Identifiable {
    let id: Int
    let title: String
    let calories: Double
}

struct Food: Codable, Identifiable {
    let id: Int
    let title: String
    let calories: Double
    let carbs: Double
    let fibers: Double
    let fat: Double
    let protein: Double
    let estimates: String
}
