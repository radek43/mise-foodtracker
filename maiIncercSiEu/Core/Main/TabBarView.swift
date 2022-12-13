//
//  TabBarView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI

// MARK: - TabbarView
struct TabbarView: View {
    
    // MARK: - PROPERTIES
    
    @State private var selection = 0
    
    // MARK: - BODY
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    if selection == 0 {Image("house.fill")}
                    else {Image("house")}
                    Text("Meniu")
                }
                .tag(0)
            ActivityProgressView()
                .tabItem {
                    if selection == 1 {Image("chart.bar.fill")}
                    else {Image("chart.bar")}
                    Text("Progres")
                }
                .tag(1)
            RecipesView()
                .tabItem {
                    if selection == 2 {Image("book.fill")}
                    else {Image("book")}
                    Text("Retete")
                }
                .tag(2)
            FitnessView(excersises: Excercise.dummyData)
                .tabItem {
                    if selection == 3 {Image("dumbbell.fill").imageScale(.large)}
                    else {Image("dumbbell").imageScale(.large)}
                    Text("Sport")
                }
                .tag(3)
            CommunityView()
                .tabItem {
                    if selection == 4 {Image("person.2.fill")}
                    else {Image("person.2")}
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
