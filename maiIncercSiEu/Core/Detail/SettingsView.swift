//
//  SettingsView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/21/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView{
            ZStack{
                Text("nimic (deocamdata)")
                    .navigationTitle("Setari")
            }
        
        }.navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
