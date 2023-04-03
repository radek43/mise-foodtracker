//
//  SettingsScreen.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 29.03.2023.
//

import Foundation
import SwiftUI
import Kingfisher


struct SettingsScreen: View {
    // MARK: - PROPERTIES
    let name: String
    let is_staff: Bool
    let logoutAction: () -> Void
    
    @State private var doesTrackActivity = false
    
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
                                    Text(name)
                                        .font(.title3)
                                        .foregroundColor(Color.primary)
                                    
                                    if is_staff == true {
                                        Text("Editor")
                                            .font(.footnote)
                                            .foregroundColor(Color.primary)
                                    }
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
                            logoutAction()
                        } label: {
                            SettingsRow(iconDefault: "lock", firstText: "Delogare", color: .secondary)
                        }
                    }
                } //: Form
                .listStyle(GroupedListStyle())
                
            } //: VStack
            .frame(maxWidth: 580)
            .navigationTitle("Setari")
            .navigationBarTitleDisplayMode(.inline)
            
        }//: ZStack
        
    } //: Body
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SettingsScreen(
                    name: "Radu Bila",
                    is_staff: false,
                    logoutAction: { }
                )
            }
            NavigationView {
                SettingsScreen(
                    name: "Radu Bila",
                    is_staff: false,
                    logoutAction: { }
                )
                .preferredColorScheme(.dark)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
