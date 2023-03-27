//
//  SettingsView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.03.2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct SettingsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var ViewModel: AuthViewModel
    @State private var doesTrackActivity = false
    @State private var isShowingSettingsScreen: Bool = false

    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
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
                        NavigationLink {
                            // ObjectiveView()
                        } label: {
                            SettingsRow(iconDefault: "target", firstText: "Obiective", color: .green)
                        }
                        NavigationLink {
                            MeasurementsSettings()
                        } label: {
                            SettingsRow(iconDefault: "ruler", firstText: "Masuratori",
                                        color: Color(hue: 0.096, saturation: 0.962, brightness: 0.941))
                        }
                        NavigationLink {
                            NotificationsSettings()
                        } label: {
                            SettingsRow(iconDefault: "bell.badge", firstText: "Notificari", color: .red)
                        }
                        Toggle(isOn: $doesTrackActivity) {
                            SettingsRow(iconAsset: "figure.run", firstText: "Inregistrare activitate", color: .blue)
                        }
                        Button {
                            ViewModel.signOut()
                        } label: {
                            SettingsRow(iconDefault: "lock", firstText: "Delogare", color: .secondary)
                        }
                    }
                } //: Form
                .listStyle(GroupedListStyle())
                
            } //: VStack
            .frame(maxWidth: 612)
            .navigationBarTitle("Setari", displayMode: .inline)
        }//: ZStack
    } //: Body
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
            Group {
                NavigationView {
                    SettingsView()
                }
                .navigationViewStyle(StackNavigationViewStyle())
                NavigationView {
                    SettingsView()
                        .preferredColorScheme(.dark)
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
//          .environmentObject(AuthViewModel())
        
    }
}
