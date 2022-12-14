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
        VStack(alignment: .center, spacing: 0) {
            Form {
                Button {
                    print("Buton cont apasat")
                } label: {
                    SettingsRow(icon: "person.crop.circle", firstText: "Administrare Cont", color: .blue)
                }
                Button {
                    print("Buton obiective apasat")
                } label: {
                    SettingsRow(icon: "target", firstText: "Obiective", color: .green)
                }
                Button {
                    print("Buton masuratori apasat")
                } label: {
                    SettingsRow(icon: "ruler", firstText: "Masuratori", color: Color(hue: 0.096, saturation: 0.962, brightness: 0.941))
                }
                Button {
                    print("Buton notificari apasat")
                } label: {
                    SettingsRow(icon: "bell.badge", firstText: "Notificari", color: .red)
                }
                Button {
                    authViewModel.signOut()
                } label: {
                    SettingsRow(icon: "lock", firstText: "Delogare", color: .secondary)
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
