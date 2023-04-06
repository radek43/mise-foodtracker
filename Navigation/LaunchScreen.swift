//
//  LaunchScreen.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 05.04.2023.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var showMainView = false
    
    var body: some View {
        Group {
            if showMainView {
                ContentView()
            } else {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    Image("launchScreenIcon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius:  36))
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 2)) {
                showMainView = true
            }
        }
    }
}
