//
//  RecipeList.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI
import SwiftUISegues

struct RecipeList: View {
    
    // All the routes that lead from this view to the next ones
    enum Route: Hashable {
        case pushTest, modalTest, popoverTest
    }
    
    // Triggers segues when its values are changes
    @State private var route: Route? = nil
    
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
                Button(action: {
                    route = .popoverTest})
                {
                RecipeCard()
                    
                }.segue(.popover(.rect(.bounds), .top), tag: .popoverTest, selection: $route) {
                    RecipeView()
                }
                RecipeCard()
                RecipeCard()
                RecipeCard()
                RecipeCard()
                RecipeCard()
                RecipeCard()
                RecipeCard()
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
