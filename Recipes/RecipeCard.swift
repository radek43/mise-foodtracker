//
//  RecipeCard.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 16.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct RecipeCard: View {
    // MARK: - PROPERTIES
    var title: String
    var imageString: String
    var calories: String
    
    // MARK: - STRUCTS
    struct BodyView: View {
        @State var url: String
        
        var body: some View {
            VStack {
                WebImage(url: URL(string: url))
                    .onSuccess { image, data, cacheType in
                    }
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .layoutPriority(-1)
            }
        }
    }
    
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(.gray))
                        .aspectRatio(3/4, contentMode: .fit)
                    
                    if let imageString = imageString {
                        BodyView(url: imageString)    
                    }
                }
                .clipped()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 10)
            
            Text(title + "\n")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .lineLimit(2)
            
            Text("\(calories) kCal" as String)
                .font(.caption)
                .foregroundColor(Color.secondary)
        }
    }
}


// MARK: - PREVIEW
struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeCard(title: recipePreviewData[1].title, imageString: recipePreviewData[1].image!, calories: recipePreviewData[1].calories)
            RecipeCard(title: recipePreviewData[1].title, imageString: recipePreviewData[1].image!, calories: recipePreviewData[1].calories)
                .preferredColorScheme(.dark)
        }
    }
}
