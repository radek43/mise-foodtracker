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
    let recipe: RecipeList
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ZStack {
                    Rectangle()
                        .fill(Color(.gray))
                    
                    if let imageUrl = recipe.image {
                        VStack {
                            WebImage(url: URL(string: imageUrl))
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
                .clipped()
                .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))

                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Group {
                            Text(recipe.title)
                                .font(.callout)
                                .fontWeight(.medium)
                            .foregroundColor(.primary) +
                            Text("  \(recipe.calories, specifier: "%.f")kCal")
                                .font(.footnote)
                                .foregroundColor(Color.secondary)
                        }
                        Group {
                            Text("•\(recipe.protein, specifier: "%.1f")g proteină ")
                                .font(.caption)
                                .foregroundColor(Color.secondary) +
                            Text("•\(recipe.calories, specifier: "%.1f")g grăsimi ")
                                .font(.caption)
                                .foregroundColor(Color.secondary) +
                            Text("•\(recipe.calories, specifier: "%.1f")g carbohidrați")
                                .font(.caption)
                                .foregroundColor(Color.secondary)
                        }
                    }
                }
                .padding(.horizontal, 6)
            }

        }
        .frame(maxWidth: 580)
        .frame(height: 350)
    }
}


// MARK: - PREVIEW
struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                RecipeCard(recipe: recipePreviewData[1])
                    .padding()
            }
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                RecipeCard(recipe: recipePreviewData[1])
                    .padding()
                .preferredColorScheme(.dark)
            }
        }
    }
}
