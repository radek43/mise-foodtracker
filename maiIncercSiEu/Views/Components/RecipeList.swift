//
//  RecipeList.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI

struct RecipeList: View {
    var body: some View {
        VStack{
            HStack {
                Text("X Retete")
                    .font(.headline)
                    .fontWeight(.medium)
                .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
                NavigationLink(destination: RecipeView()) {
                    RecipeCard()
                }
            }.padding(.top)
            
        }.padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            RecipeList()
        }
    }
}
