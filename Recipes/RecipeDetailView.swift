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
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack {
                            Text("Timp de preparare: \(recipe.time_minutes) minute")
                                .font(.callout)
                                .foregroundColor(Color.secondary)
                            Spacer()
                        }
                        Divider()
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Informații nutriționale:")
                                .font(.title2)
                                .fontWeight(.semibold)
                            VStack(alignment: .leading) {
                                Text("• Calorii: \(recipe.calories, specifier: "%.1f")g")
                                Text("• Proteine: \(recipe.protein, specifier: "%.1f")g")
                                Text("• Lipide: \(recipe.fat, specifier: "%.1f")g")
                                Text("• Carbohidrați: \(recipe.carbs, specifier: "%.1f")g")
                                Text("• Fibre: \(recipe.fibers, specifier: "%.1f")g")
                            }
                            Text("*Informații nutriționale pentru o porție de 100gr")
                                .font(.footnote)
                                .foregroundColor(Color.secondary)
                            Divider()
                            if !recipe.ingredients.isEmpty {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Ingrediente:")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text(recipe.ingredients)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            Divider()
                            if !recipe.description.isEmpty {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Mod de preparare:")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text(recipe.description)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.bottom, 30)
                            }
                        }
                    } //: END DETAILS VSTACK
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
                RecipeDetailView(recipe: recipePreviewData[1])
            }
            NavigationView {
                RecipeDetailView(recipe: recipePreviewData[1])
            }
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        // .environmentObject(AuthViewModel())
    }
}
