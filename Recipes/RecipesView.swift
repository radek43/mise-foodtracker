//
//  RecipesView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct RecipesView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var viewModel: AuthViewModel
    
    @ObservedObject var recipeViewModel = RecipeViewModel()
    
    // MARK: - BODY
    var body: some View {
        if viewModel.currentUser != nil {
            NavigationView {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView(showsIndicators: false) {
                        VStack {
                            // SEARCH BAR
                            HStack(alignment: .center) {
                                SearchBar(placeholderText: "Gaseste-ți inspirația",text: .constant(""))
                                    .padding(.bottom, 3)
                                Button {
                                    print("buton setari retete apasat")
                                } label: {
                                    Image(systemName: "slider.horizontal.3")
                                        .imageScale(.large)
                                }
                            }
                            .padding(.top)
                            .padding(.bottom, 5.0)
                            
                            // RECIPE GRID
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)], spacing: 15) {
                                ForEach(recipeViewModel.recipes) { recipe in
                                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                        RecipeCard(recipe: recipe)
                                            .frame(maxWidth: 580)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .id(UUID())
                            .padding(.bottom)
                            
                            Spacer()
                        }
                        .frame(maxWidth: 580)
                        .padding(.horizontal)
                    } //: END SCROLL VIEW
                    .navigationBarItems(
                        trailing:
                            NavigationLink {
                                AddNewRecipe()
                            } label: {
                                Image(systemName: "note.text.badge.plus")
                            }
                    )
                    .navigationTitle("Rețete")
                }
            } //: END ZSTACK
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

// MARK: - PREVIEW
struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        let recipeViewModel = RecipeViewModel()
        recipeViewModel.recipes = recipePreviewData
        return Group {
            RecipesView(recipeViewModel: recipeViewModel)
            RecipesView(recipeViewModel: recipeViewModel)
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
