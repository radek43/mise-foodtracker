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
        VStack {
                WebImage(url: URL(string: recipe.image))
                    .resizable()
                .aspectRatio(CGSize(width: 3, height: 4), contentMode: .fill)

        }
        //.frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 12, x: 0, y: 10)
        
    }
}

// MARK: - PREVIEW

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.dummyData[0])
    }
}
