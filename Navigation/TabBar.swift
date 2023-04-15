//
//  TabBar.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI

struct TabBar: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var tabSelection = 0
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.mono)
        UITabBar.appearance().backgroundColor = UIColor(Color.mono)
    }
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    if tabSelection == 0 { Image("house.fill") }
                    else { Image("house") }
                    Text("Meniu")
                }
                .tag(0)
            
            ActivityProgressView()
                .tabItem {
                    if tabSelection == 1 { Image("chart.bar.fill") }
                    else { Image("chart.bar") }
                    Text("Progres")
                }
                .tag(1)
            
            RecipesView()
                .tabItem {
                    if tabSelection == 2 { Image("book.fill") }
                    else { Image("book") }
                    Text("Retete")
                }
                .tag(2)
            ActivityView()
                .tabItem {
                    if tabSelection == 3 { Image("dumbbell.fill").imageScale(.large) }
                    else { Image("dumbbell").imageScale(.large) }
                    Text("Sport")
                }
                .tag(3)
            
//            ForumView()
//                .tabItem {
//                    if tabSelection == 4 { Image("person.2.fill") }
//                    else { Image("person.2") }
//                    Text("Comunitate")
//                }
//                .tag(4)
        }
    }
}


// MARK: - PREVIEW
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            TabBar()
            TabBar()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
