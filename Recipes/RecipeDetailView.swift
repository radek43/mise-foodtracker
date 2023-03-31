//
//  RecipeDetailView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI
import Kingfisher

struct RecipeDetailView: View {
    // MARK: - PROPERTIES
    var recipe: Recipe
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color(.gray))
                            .aspectRatio(4/4, contentMode: .fit)
                        if let image = recipe.image {
                            KFImage(URL(string: image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .layoutPriority(-1)
                        }
                    }
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .padding()

                    VStack(spacing: 30) {
                        Text(recipe.title)
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                        VStack(alignment: .leading, spacing: 30) {
                            if !recipe.description.isEmpty {
                                Text(recipe.description)
                            }
                            Divider()
                            // Detalii valori nutritionale
                            if !recipe.ingredients.isEmpty {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Ingrediente:")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text(recipe.ingredients.replacingOccurrences(of: "•", with: "\n •"))
                                }
                            }
                        }
                    }
                    .frame(maxWidth: 612)
                    .padding(.horizontal)
                    .toolbar {
                        Button {
                            print("reteta inregistrata in jurnal")
                        } label: {
                            HStack {
                                Text("Adauga la jurnal")
                                Image(systemName: "text.badge.plus")
                            }
                        }
                    }
                }
            }
        }
    }
}
// MARK: - PREVIEW
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeDetailView(recipe: recipePreviewData[0])
            RecipeDetailView(recipe: recipePreviewData[0])
                .preferredColorScheme(.dark)
        }
//      .environmentObject(AuthViewModel())
    }
}
