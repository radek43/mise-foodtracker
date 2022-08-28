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
        VStack(alignment: .center, spacing: 0){
            Form {
                Button {
                    // func delogare()
                } label: {
                    Text("Delogare")
                }

            } //: Form
            .listStyle(GroupedListStyle())
            
            
            
            Text("Copyright © 2022 All rights reserved. maiIncercSiEu")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .padding(.top, 6)
                .padding(.bottom, 8)
                .foregroundColor(Color.secondary)
        } //: Vstack
        .navigationBarTitle("Setari", displayMode: .inline)
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        
    } //: Body
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
