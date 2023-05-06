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
    let calories: String
}

struct Food: Codable, Identifiable {
    let id: Int
    let title: String
    let calories: String
    let carbs: String
    let fibers: String
    let fat: String
    let protein: String
    let estimates: String
}
