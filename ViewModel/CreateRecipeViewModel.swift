//
//  CreateRecipeViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 31.03.2023.
//

import Foundation
import SwiftUI


class CreateRecipeViewModel: ObservableObject {
    func uploadRecipe(title: String, time_minutes: Int, category: String, description: String, ingredients: String,
                      calories: String, protein: String, carbs: String, fibers: String, fat: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        RequestService.requestDomain = "http://127.0.0.1:8000/api/recipe/recipes/"
        RequestService.postRecipe(email: user.email, title: title, category: category, time_minutes: time_minutes,
                                  description: description, ingredients: ingredients, calories: Decimal(string: calories)!, protein: Decimal(string: protein)!,
                                  carbs: Decimal(string: carbs)!, fibers: Decimal(string: fibers)!, fat: Decimal(string: fat)!) { result in
            print(result)
        }
    }
}
