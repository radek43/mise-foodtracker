//
//  LaunchView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 05.04.2023.
//

import SwiftUI


struct LaunchView: View {
    // MARK: - PROPERTIES
    @State private var showMainView = false
    @State private var hasTimeElapsed = false
    
    // MARK: - BODY
    var body: some View {
        Group {
            if hasTimeElapsed && showMainView   {
                ContentView()
            } else {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    Image("launchScreenIcon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 36))
                }
            }
        }
        .onAppear {
            Task {
                await delayView()
                withAnimation(.easeInOut(duration: 1.5)) {
                    showMainView = true
                }
            }
        }
    }
    
    private func delayView() async {
        // Delay of 2 seconds (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        hasTimeElapsed = true
    }
}
