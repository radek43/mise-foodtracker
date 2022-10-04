//
//  RecipeViewModel.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/1/22.
//

import Firebase
import FirebaseFirestoreSwift

class RecipeViewModel: ObservableObject {
    @Published var recipesArray = [Recipe]()
    
    init() {
        fetchRecipes { recipes in
            self.recipesArray = recipes
            
            print("DEBUG: Recipe \(recipes)")
        }
        
    }
    
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

