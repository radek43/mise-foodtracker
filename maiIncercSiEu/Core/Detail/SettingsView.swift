//
//  SettingsView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/21/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var authViewModel: AuthViewModel

    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Form {
                Button {
                    authViewModel.signOut()
                } label: {
                    Text("Delogare")
                }
            } //: Form
            .listStyle(GroupedListStyle())
            
            Text("Work in progress")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .padding(.top, 6)
                .padding(.bottom, 8)
                .foregroundColor(Color.secondary)
            
        } //: VStack
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
