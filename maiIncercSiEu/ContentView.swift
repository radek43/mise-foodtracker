//
//  ContentView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/9/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - BODY
    
    var body: some View {
        if viewModel.userSession == nil {
            // no user logged in
            LoginView()
        } else {
            // user logged in
            ZStack {
                TabbarView()
                GeometryReader { reader in
                    Color("ColorBackground")
                        .frame(height: reader.safeAreaInsets.top, alignment: .top)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
