//
//  RecipeCard.swift
//  maiIncercSiEu
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
                            
                    KFImage(URL(string: recipe.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .layoutPriority(-1)
                }
                .clipped()   
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 10)
            
            Text(recipe.name)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .lineLimit(2)
            
            Text("200 kCal")
                .font(.caption)
                .foregroundColor(Color.secondary)
        }
        //.frame(width: 160, height: 213)
    }
}

// MARK: - PREVIEW
struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.dummyData[2])
    }
}
