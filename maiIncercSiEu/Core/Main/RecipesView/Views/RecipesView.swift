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
    //var recipes: [Recipe]

    // MARK: - BODY
    
    var body: some View {
        
        NavigationView{
            ZStack{
                ScrollView{
                    Title(numeTitlu: "Retete")
                    
                    VStack{
                        SearchBar(text: $viewModel.searchText)
                            .padding(.bottom, 3)
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                            ForEach(viewModel.searchableRecipes) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                    RecipeCard(recipe: recipe)
                                }
                            }
                        }.padding(.bottom)

                    }.padding(.horizontal)
                    
                }
                .navigationTitle("Retete")
                .navigationBarHidden(true)
                .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            }
        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
