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
    @ObservedObject var recipeDetailViewModel: RecipeDetailViewModel
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            if let recipe = recipeDetailViewModel.recipe {
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
                    }
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .padding()
                    
                    // RECIPE DETAILS
                    VStack(spacing: 30) {
                        Text(recipe.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Informații nutriționale:")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Divider()
                            VStack(alignment: .leading) {
                                Text("• Calorii: \(recipe.calories)g")
                                Text("• Proteine: \(recipe.protein)g")
                                Text("• Lipide: \(recipe.fat)g")
                                Text("• Carbohidrați: \(recipe.carbs)g")
                                Text("• Fibre: \(recipe.fibers)g")
                            }
                            
                            Divider()
                            VStack(alignment: .leading) {
                                Text("Timp de preparare: \(recipe.time_minutes) minute")
                                    .font(.footnote)
                                    .foregroundColor(Color.secondary)
                                Text("*Informații nutriționale pentru o porție de 100gr")
                                    .font(.footnote)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                        .background(Color.card)
                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Ingrediente:")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Divider()
                            Text(recipe.ingredients)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()
                        .background(Color.card)
                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                        .padding(.horizontal)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Mod de preparare:")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Divider()
                            Text(recipe.description)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()
                        .background(Color.card)
                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                        
                    } //: END DETAILS VSTACK
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
        .onAppear {
            self.recipeDetailViewModel.fetchRecipeDetail()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - PREVIEW
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecipeDetailViewModel(withrecipeId: 1)
        viewModel.recipe = recipeDetailPreviewData
        return Group {
            NavigationView {
                RecipeDetailView(recipeDetailViewModel: viewModel)
            }
            NavigationView {
                RecipeDetailView(recipeDetailViewModel: viewModel)
            }
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
