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

    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        HStack(alignment: .center, spacing: 3.0) {
                            SearchBar(placeholderText: "Gaseste-ți inspirația",text: $viewModel.searchText)
                                .padding(.bottom, 3)
                            Button {
                                print("buton setari retete apasat")
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                                    .imageScale(.large)
                            }
                        }
                        .padding(.bottom, 5.0)
                        
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
                    if authViewModel.currentUser?.userType == 1 { // functionalitati de admin
                        HStack {
                            NavigationLink {
                                AddNewRecipe() // de modificat
                            } label: {
                                Image(systemName: "note.text.badge.plus")
                            }
                        }
                    }
                }
                .navigationTitle("Rețete")
                .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
            .environmentObject(AuthViewModel())
    }
}
