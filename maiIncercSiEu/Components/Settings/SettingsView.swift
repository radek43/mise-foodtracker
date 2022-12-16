//
//  SettingsView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/21/22.
//

import SwiftUI
import Kingfisher

struct SettingsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var doesTrackActivity = false
    @State private var isShowingSettingsScreen: Bool = false

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Form {
                Section {
                    NavigationLink(destination: ProfileSettingsView()) {
                        HStack(alignment: .center) {
                            Image(systemName: "person.crop.circle") // placeholder poza de profil
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.secondary)
                                .padding(.trailing, 5)
                            VStack(alignment: .leading) {
                                Text("George Popescu")
                                    .font(.title3)
                                    .foregroundColor(Color.primary)
                                Text("Utilizator simplu")
                                    .font(.footnote)
                                    .foregroundColor(Color.primary)
                            }
                        }
                    }
                }
                
                Section {
                    Button {
                        print("Buton obiective apasat")
                    } label: {
                        SettingsRow(iconDefault: "target", firstText: "Obiective", color: .green)
                    }
                    Button {
                        print("Buton masuratori apasat")
                    } label: {
                        SettingsRow(iconDefault: "ruler", firstText: "Masuratori", color: Color(hue: 0.096, saturation: 0.962, brightness: 0.941))
                    }
                    Button {
                        print("Buton notificari apasat")
                    } label: {
                        SettingsRow(iconDefault: "bell.badge", firstText: "Notificari", color: .red)
                    }
                    Toggle(isOn: $doesTrackActivity) {
                        SettingsRow(iconAsset: "figure.run", firstText: "Inregistrare activitate", color: .blue, hasChevron: false)
                    }
                    Button {
                        authViewModel.signOut()
                    } label: {
                        SettingsRow(iconDefault: "lock", firstText: "Delogare", color: .secondary, hasChevron: false)
                    }
                }
            } //: Form
            .listStyle(GroupedListStyle())
            
            Text("Made in Romania🇷🇴")
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
        TabBar()
            .environmentObject(AuthViewModel())
    }
}
