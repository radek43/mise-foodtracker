//
//  TabBar.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI

struct TabBar: View {
    // MARK: - PROPERTIES
    @State private var tabSelection = 0
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView {
                HomeView()
            }
            .tabItem {
                if tabSelection == 0 {Image("house.fill")}
                else {Image("house")}
                Text("Meniu")
            }
            .tag(0)
            NavigationView {
                ActivityProgressView()
            }
            .tabItem {
                if tabSelection == 1 {Image("chart.bar.fill")}
                else {Image("chart.bar")}
                Text("Progres")
            }
            .tag(1)
            NavigationView {
                RecipesView()
            }
            .tabItem {
                if tabSelection == 2 {Image("book.fill")}
                else {Image("book")}
                Text("Retete")
            }
            .tag(2)
            NavigationView {
                FitnessView(excersises: Excercise.dummyData)
            }
            .tabItem {
                if tabSelection == 3 {Image("dumbbell.fill").imageScale(.large)}
                else {Image("dumbbell").imageScale(.large)}
                Text("Sport")
            }
            .tag(3)
            NavigationView {
                ForumView()
            }
            .tabItem {
                if tabSelection == 4 {Image("person.2.fill")}
                else {Image("person.2")}
                Text("Comunitate")
            }
            .tag(4)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(AuthViewModel())
    }
}
