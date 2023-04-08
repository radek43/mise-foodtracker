//
//  RecipesView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct RecipesView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var recipeListViewModel = RecipeListViewModel()
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.currentUser != nil {
            NavigationView {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView(showsIndicators: false) {
                        RefreshControl(coordinateSpace: .named("RefreshControl")) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                recipeListViewModel.fetchRecipeList()
                            }
                        }
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
                                ForEach(recipeListViewModel.recipeList) { recipe in
                                    NavigationLink {
                                        RecipeDetailView(recipeDetailViewModel: RecipeDetailViewModel(withrecipeId: recipe.id))
                                    } label: {
                                        RecipeCard(title: recipe.title, image: recipe.image ?? "", calories: recipe.calories)
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
                    .coordinateSpace(name: "RefreshControl")
                    .navigationBarItems(
                        trailing:
                            NavigationLink {
                                AddNewRecipe(recipeViewModel: recipeListViewModel)
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
        let recipeViewModel = RecipeListViewModel()
        recipeViewModel.recipeList = recipePreviewData
        return Group {
            RecipesView(recipeListViewModel: recipeViewModel)
            RecipesView(recipeListViewModel: recipeViewModel)
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
