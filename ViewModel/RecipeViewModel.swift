//
//  RecipeViewModel.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/1/22.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

// DE MODIFICAT FITNESSCARD-UL PENTRU A FI COMPATIBILA IMAGINEA

class RecipeViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var recipesArray = [Recipe]()
    @Published var searchText = ""
    
    var searchableRecipes: [Recipe] {
        if searchText.isEmpty {
            return recipesArray
        } else {
            let Query = searchText
            return recipesArray.filter({
                $0.name.contains(Query) ||
                $0.name.lowercased().contains(Query) ||
                $0.name.range(of: searchText, options: [.diacriticInsensitive, .caseInsensitive]) != nil
            })
        }
    }
    
    init() {
        fetchRecipes { recipes in
            self.recipesArray = recipes
        }
    }
    
    // MARK: - FUNCTIONS
    func fetchRecipes(completion: @escaping([Recipe]) -> Void) {
        var recipesArray = [Recipe]()

        Firestore.firestore().collection("recipes")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }

                documents.forEach { document in
                    guard let recipe = try? document.data(as: Recipe.self) else { return }
                    recipesArray.append(recipe)
                }

                completion(recipesArray)
            }
    }
}

