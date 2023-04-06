//
//  RecipeCard.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI
import Kingfisher

struct RecipeCard: View {
    // MARK: - PROPERTIES
    var recipe: Recipe
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(.gray))
                        .aspectRatio(3/4, contentMode: .fit)
                    
                    if let image = recipe.image {
                        KFImage(URL(string: image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .layoutPriority(-1)
                    }
                }
                .clipped()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 10)
            
            Text(recipe.title + "\n")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .lineLimit(2)
            
            Text("\(recipe.calories) kCal" as String)
                .font(.caption)
                .foregroundColor(Color.secondary)
        } //: END MAIN VSTACK
    }
}


// MARK: - PREVIEW
struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeCard(recipe: recipePreviewData[1])
            RecipeCard(recipe: recipePreviewData[1])
                .preferredColorScheme(.dark)
        }
        
    }
}
