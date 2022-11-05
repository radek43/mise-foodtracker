//
//  TabBarView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI

struct TabbarView: View {
    
    // MARK: - PROPERTIES
    
    init() { UITabBar.appearance().backgroundColor = UIColor.white }
    
    @State private var selection = 0
    
    // MARK: - BODY
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    selection == 0 ? Image("homeFill") : Image("homeOutline")
                    Text("Meniu")
                }
                .tag(0)
            ActivityProgressView()
                .tabItem {
                    selection == 1 ? Image("progressFill") : Image("progressOutline")
                    Text("Progres")
                }
                .tag(1)
            RecipesView()
                .tabItem {
                    selection == 2 ? Image("recipesFill") : Image("recipesOutline")
                    Text("Retete")
                }
                .tag(2)
            FitnessView(excersises: Excercise.dummyData)
                .tabItem {
                    selection == 3 ? Image("fitnessFill") : Image("fitnessOutline")
                    Text("Sport")
                }
                .tag(3)
            CommunityView()
                .tabItem {
                    selection == 4 ? Image("communityFill") : Image("communityOutline")
                    Text("Comunitate")
                }
                .tag(4)
        }.imageScale(.large)
    }
}

// MARK: - PREVIEW

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
            .environmentObject(AuthViewModel())
    }
}
