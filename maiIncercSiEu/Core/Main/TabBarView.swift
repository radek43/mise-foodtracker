//
//  TabBarView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI

struct TabbarView: View {
    
    // MARK: - PROPERTIES
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white

    }
    
    // MARK: - BODY
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("homeIcon")
                    Text("Meniu")
                }
            ActivityProgressView()
                .tabItem {
                    Image("progressIcon")
                    Text("Progres")
                }
            RecipesView()
                .tabItem {
                    Image("recipesIcon")
                    Text("Retete")
                }
            FitnessView(excersises: Excercise.dummyData)
                .tabItem {
                    Image("fitnessIcon")
                    Text("Sport")
                }
            CommunityView()
                .tabItem {
                    Image("communityIcon")
                    Text("Comunitate")
                }
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
