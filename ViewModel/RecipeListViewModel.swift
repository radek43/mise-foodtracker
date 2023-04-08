//
//  RecipeViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 04.04.2023.
//

import Foundation
import SwiftUI

class RecipeListViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var recipeList: [RecipeList] = []
    private let service = RecipeService()
    
    init() {
        self.fetchRecipeList()
    }
    
    // MARK: - METHODS
    func fetchRecipeList() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        service.fetchRecipeList(email: user.email) { result in
            switch result {
                case .success(let data):
                    guard let recipes = try? JSONDecoder().decode([RecipeList].self, from: data!) else { return }
                    print("fetchRecipes: Succes fetching recipes list")
                    DispatchQueue.main.async {
                        self.recipeList = recipes
                    }
                case .failure(let error):
                    print("fetchRecipes: \(error.localizedDescription)")
            }
        }
    }
}
