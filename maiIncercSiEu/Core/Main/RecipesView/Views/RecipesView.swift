//
//  RecipesView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct RecipesView: View {
    
    // MARK: - PROPERTIES
    
    @ObservedObject var viewModel = RecipeViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    //var recipes: [Recipe]

    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        SearchBar(text: $viewModel.searchText)
                            .padding(.bottom, 3)
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                            ForEach(viewModel.searchableRecipes) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                    RecipeCard(recipe: recipe)
                                }
                            }
                        }
                        .padding(.bottom)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .toolbar {
                    if authViewModel.currentUser?.userType != nil { // functionalitati de admin
                        HStack {
                            NavigationLink {
                                AddRecipeView() // de modificat
                            } label: {
                                Image(systemName: "plus.circle")
                            }
                        }
                    
                    }
                }
                .navigationTitle("Retete")
                .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            }
        }
    }
}

// MARK: - PREVIEW

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
            .environmentObject(AuthViewModel())
    }
}
