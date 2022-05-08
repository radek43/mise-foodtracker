//
//  TabBarView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI

struct TabbarView: View {
    //init() {
    //        UITabBar.appearance().backgroundColor = UIColor.white
    //    }
    var body: some View {
        TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Meniu Principal")
                    }
            
                ActivityProgressView()
                    .tabItem {
                        
                        Image(systemName: "chart.bar")
                        Text("Progres")
                    }
                RecipesView()
                    .tabItem {
                        
                        Image(systemName: "book")
                        Text("Retete")
                    }
                FitnessView()
                    .tabItem {
                        Image("fitnessIcon")
                        Text("Sport")
                    }
                CommunityView()
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("Comunitate")
                    }

            
            
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
