//
//  LaunchScreen.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 05.04.2023.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var showMainView = false
    @State private var hasTimeElapsed = false
    
    var body: some View {
        Group {
            if showMainView && hasTimeElapsed {
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
            Task {
               await delayView()
            }
            withAnimation(.easeInOut) {
                showMainView = true
            }
        }
    }
    
    private func delayView() async {
        // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        hasTimeElapsed = true
    }
}

//struct LaunchScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LaunchScreen()
//            LaunchScreen()
//                .preferredColorScheme(.dark)
//        }
//    }
//}
