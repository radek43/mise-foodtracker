//
//  RecipeList.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI
import SwiftUISegues

struct RecipeList: View {
    
    // MARK: - PROPERTIES
    
    var recipes: [Recipe]
    
    // MARK: - BODY
    
    var body: some View {
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                    }
                }
            }.padding(.bottom)

        }.padding(.horizontal)
    }
}

// MARK: - PREVIEW

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            RecipeList(recipes: Recipe.all)
        }
    }
}
