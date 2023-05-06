//
//  RecipesView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct RecipesView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var recipeListViewModel = RecipeListViewModel()
    
    @State private var showAlert = false

    // MARK: - BODY
    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationView {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView(showsIndicators: false) {
                        RefreshControl(coordinateSpace: .named("RefreshControl")) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                recipeListViewModel.loadData()
                            }
                        }
                        VStack {
                            // Search bar
                            HStack(alignment: .center, spacing: 5.0) {
                                SearchBar(placeholderText: "Gaseste-ți inspirația",text: .constant(""))
                                Button {
                                    print("buton setari retete apasat")
                                } label: {
                                    Image(systemName: "slider.horizontal.3")
                                        .imageScale(.large)
                                        .padding(10)
                                        .background(Color.card)
                                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                }
                            }
                            .padding(.top)
                            .padding(.bottom, 5.0)
                            
                            // Recipe grid
                            VStack(spacing: 15.0) {
                                ForEach(recipeListViewModel.recipes) { recipe in
                                    NavigationLink {
                                        RecipeDetailView(recipeDetailViewModel: RecipeDetailViewModel(withrecipeId: recipe.id))
                                    } label: {
                                        RecipeCard(recipe: recipe)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .onReceive(recipeListViewModel.$error, perform: { error in
                                if error != nil {
                                    showAlert.toggle()
                                }
                            })
                            .alert(isPresented: $showAlert, content: {
                                Alert(title: Text("Eroare"), message: Text(recipeListViewModel.error?.localizedDescription ?? ""))
                            })
                            .padding(.bottom)
                            
                            Spacer()
                        }
                        .frame(maxWidth: 580)
                        .padding(.horizontal)
                    }
                    .coordinateSpace(name: "RefreshControl")
                    .navigationBarItems( leading: user.is_staff == true ?
                            NavigationLink {
                                AddNewRecipe(recipeViewModel: recipeListViewModel)
                            } label: {
                                Image(systemName: "square.and.pencil")
                            }
                        : nil
                    )
                    .navigationTitle("Rețete")
                }
                .onAppear {
                    recipeListViewModel.loadData()
                }
            }
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
        recipeViewModel.recipes = recipePreviewData
        return Group {
            RecipesView(recipeListViewModel: recipeViewModel)
            RecipesView(recipeListViewModel: recipeViewModel)
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
