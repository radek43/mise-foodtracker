//
//  TabBarView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 11.04.2022.
//

import SwiftUI

struct TabBarView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var tabSelection = 0
    
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding = true
    
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
            
            UserProgressView()
                .tabItem {
                    if tabSelection == 1 { Image("chart.bar.fill") }
                    else { Image("chart.bar") }
                    Text("Progres")
                }
                .tag(1)
            
            RecipeListView()
                .tabItem {
                    if tabSelection == 2 { Image("book.fill") }
                    else { Image("book") }
                    Text("Rețete")
                }
                .tag(2)
            ActivityListView()
                .tabItem {
                    if tabSelection == 3 { Image("dumbbell.fill").imageScale(.large) }
                    else { Image("dumbbell").imageScale(.large) }
                    Text("Activitate")
                }
                .tag(3)
        }
        .fullScreenCover(isPresented: $shouldShowOnboarding) {
            OnboardMeasurementsView(shouldShowOnboarding: $shouldShowOnboarding)
        }
    }
}


// MARK: - PREVIEW
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            TabBarView()
            TabBarView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
