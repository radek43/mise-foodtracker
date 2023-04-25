//
//  TabBar.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 11.04.2022.
//

import SwiftUI

struct TabBar: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var tabSelection = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.mono)
    }
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView(tabSelection: $tabSelection)
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
