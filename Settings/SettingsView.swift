//
//  SettingsView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.03.2023.
//

import Foundation
import SwiftUI


struct SettingsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var settingsViewModel = SettingsViewModel()
    
    @State private var doesTrackActivity = false
    
    // MARK: - BODY
    var body: some View {
        if let user = authViewModel.currentUser {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                Form {
                    Section {
                        NavigationLink(destination: ProfileSettingsView(user: user)) {
                            HStack(alignment: .center) {
                                Image(systemName: "person.crop.circle") // placeholder poza de profil
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color.secondary)
                                    .padding([.top, .bottom, .trailing], 5)
                                VStack(alignment: .leading) {
                                    Text(user.fullname)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.primary)
                                    
                                    HStack(alignment: .center, spacing: 0.0) {
                                        if user.is_staff == true {
                                            Text("Editor, ")
                                                .font(.footnote)
                                        }
                                        Text("\(user.age) ani, \(user.activityMeta)")
                                            .font(.footnote)
                                    }
                                }
                            }
                        }
                    }
                    Section {
                        NavigationLink {
                            ObjectiveView(user: user)
                        } label: {
                            SettingsRow(iconDefault: "target", firstText: "Obiectiv", color: .green)
                        }
                        NavigationLink {
                            MeasurementsSettings(user: user)
                        } label: {
                            SettingsRow(iconDefault: "ruler", firstText: "Măsurători",
                                        color: Color(hue: 0.096, saturation: 0.962, brightness: 0.941))
                        }
                        NavigationLink {
                            NotificationsSettings()
                        } label: {
                            SettingsRow(iconDefault: "bell.badge", firstText: "Notificări", color: .red)
                        }
                        Toggle(isOn: $doesTrackActivity) {
                            SettingsRow(iconAsset: "figure.run", firstText: "Inregistrare activitate", color: .blue)
                        }
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SettingsRow(iconDefault: "lock", firstText: "Delogare", color: .secondary)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .frame(maxWidth: 580)
                .navigationTitle("Setări")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            NavigationView {
                SettingsView()
            }
            NavigationView {
                SettingsView()
                    .preferredColorScheme(.dark)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(viewModel)
    }
}
