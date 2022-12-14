//
//  RecipeCard.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeCard: View {

    // MARK: - PROPERTIES
    var recipe: Recipe
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                WebImage(url: URL(string: recipe.image))
                    .resizable()
                    .aspectRatio(3/4, contentMode: .fill)
                    .clipped()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 12, x: 0, y: 10)
            
            Spacer()
            
            Text(recipe.name)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.primary)
            
            Text("200 kCal")
                .font(.caption)
                .foregroundColor(Color.secondary)
        }
    }
}

// MARK: - PREVIEW
struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.dummyData[0])
    }
}
