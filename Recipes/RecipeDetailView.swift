//
//  RecipeDetailView.swift
//  mise-foodtracker
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
                    // RECIPE IMAGE
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
                    
                    // RECIPE DETAILS
                    VStack(spacing: 30) {
                        Text(recipe.title)
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                        VStack(alignment: .leading, spacing: 30) {
                            if !recipe.description.isEmpty {
                                Text(recipe.description)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            Divider()
                            // Detalii valori nutritionale
                            if !recipe.ingredients.isEmpty {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Ingrediente:")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text(recipe.ingredients)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .toolbar {
                        Button {
                            print("DEBUG: Recipe logged")
                        } label: {
                            HStack {
                                Text("Adaugă la jurnal")
                                Image(systemName: "text.badge.plus")
                            }
                        }
                    }
                } //: END MAIN VSTACK
                .frame(maxWidth: 580)
            } //: END SCROLL VIEW
        } //: END ZSTACK
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - PREVIEW
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RecipeDetailView(recipe: recipePreviewData[0])
            }
            NavigationView {
                RecipeDetailView(recipe: recipePreviewData[0])
            }
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        // .environmentObject(AuthViewModel())
    }
}
