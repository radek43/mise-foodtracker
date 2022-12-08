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
                    if selection == 0 {
                        Image("homeFill")
                            .imageScale(.large)
                    } else {
                        Image("homeOutline")
                            .imageScale(.large)
                    }
                    Text("Meniu")
                }
                .tag(0)
            ActivityProgressView()
                .tabItem {
                    if selection == 1 {
                        Image("progressFill")
                            .imageScale(.large)
                    } else {
                        Image("progressOutline")
                            .imageScale(.large)
                    }
                    Text("Progres")
                }
                .tag(1)
            RecipesView()
                .tabItem {
                    if selection == 2 {
                        Image("recipesFill")
                            .imageScale(.large)
                    } else {
                        Image("recipesOutline")
                            .imageScale(.large)
                    }
                    Text("Retete")
                }
                .tag(2)
            FitnessView(excersises: Excercise.dummyData)
                .tabItem {
                    if selection == 3 {
                        Image("fitnessOutline")
                            .imageScale(.large)
                    } else {
                        Image("fitnessOutline")
                            .imageScale(.large)
                    }
                    Text("Sport")
                }
                .tag(3)
            CommunityView()
                .tabItem {
                    if selection == 4 {
                        Image("communityFill")
                            .imageScale(.large)
                    } else {
                        Image("communityOutline")
                            .imageScale(.large)
                    }
                    Text("Comunitate")
                }
                .tag(4)
        }
    }
}

// MARK: - PREVIEW

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
            .environmentObject(AuthViewModel())
    }
}
