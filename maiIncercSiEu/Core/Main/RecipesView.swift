//
//  RecipesView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct RecipesView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    Title(numeTitlu: "Retete")
                    RecipeList()
                }
                .navigationTitle("Retete")
                .navigationBarHidden(true)
            }
        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
