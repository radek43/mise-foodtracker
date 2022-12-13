//
//  RecipeView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailView: View {
    
    // MARK: - PROPERTIES
    
    var recipe: Recipe
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView {
            VStack {
                WebImage(url: URL(string: recipe.image))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
                    .padding([.top, .leading, .trailing])
                
                VStack(spacing: 30) {
                    Text(recipe.name)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    //Divider()
                    VStack(alignment: .leading, spacing: 30) {
                        if !recipe.description.isEmpty {
                            Text(recipe.description)
                        }
                        Divider()
                        
                        // Detalii valori nutritionale
                        
                        if !recipe.ingredients.isEmpty {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Ingrediente:")
                                    .font(.headline)
                                
                                Text(recipe.ingredients.replacingOccurrences(of: "•", with: "\n •"))
                            }
                        }
                        Divider()
                        if !recipe.directions.isEmpty {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Mod Preparare:")
                                    .font(.headline)
                                Text(recipe.directions.replacingOccurrences(of: "•", with: "\n •"))
                            }
                        }
                        Divider()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - PREVIEW

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.dummyData[0])
    }
}
