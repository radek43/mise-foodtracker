//
//  CreateRecipeViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 06.04.2023.
//
import Foundation
import SwiftUI

class CreateRecipeViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var didUploadRecipe = false
    
    // MARK: - METHODS
    func uploadRecipe(title: String, time_minutes: Int, category: String, description: String, ingredients: String,
                      calories: String, protein: String, carbs: String, fibers: String, fat: String, image: UIImage?) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        RequestService.requestDomain = "http://127.0.0.1:8000/api/recipe/recipes/"
        RequestService.postRecipe(email: user.email, title: title, category: category, time_minutes: time_minutes,
                                  description: description, ingredients: ingredients, calories: Decimal(string: calories)!, protein: Decimal(string: protein)!,
                                  carbs: Decimal(string: carbs)!, fibers: Decimal(string: fibers)!, fat: Decimal(string: fat)!) { result in
            self.didUploadRecipe = true
            if let image = image {
                if let id = result!["id"] {
                    ImageUploader.uploadImage1(email: user.email, paramName: "image", fileName: "image.png", image: image, urlPath: "/api/recipe/recipes/\(id)/upload-image/")
                }
            }
        }
    }
}
