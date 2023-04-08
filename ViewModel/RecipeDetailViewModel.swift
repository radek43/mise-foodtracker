//
//  RecipeDetailViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.04.2023.
//

import Foundation
import SwiftUI

class RecipeDetailViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var recipe: Recipe?
    private let service = RecipeService()
    let recipeId: Int
    
    init(withrecipeId recipeId: Int) {
        self.recipeId = recipeId
    }
    
    // MARK: - METHODS
    func fetchRecipeDetail() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        service.fetchRecipeDetail(email: user.email, id: recipeId) { result in
            switch result {
                case .success(let data):
                    guard let recipe = try? JSONDecoder().decode(Recipe.self, from: data!) else { return }
                    print("fetchRecipeDetail: Succes fetching recipes detail with id \(self.recipeId)")
                    DispatchQueue.main.async {
                        self.recipe = recipe
                    }
                case .failure(let error):
                    print("fetchRecipes: \(error.localizedDescription)")
            }
        }
    }
}
