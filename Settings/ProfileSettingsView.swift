//
//  ProfileSettingsView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 12/15/22.
//

import SwiftUI
import KeyboardToolbars


struct ProfileSettingsView: View {
    // MARK: - PROPERTIES
    @StateObject var settingsViewModel = SettingsViewModel()
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var gender: Int
    @State private var name: String
    @State private var date: Date
    @State private var activity: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    let genders = ["Bărbat", "Femeie"]
    let activityLevel = ["Sedentar (exercițiu puțin sau deloc)", "Usor activ (exercitii usoare/sport 1-3 zile/saptamana)", "Moderat activ (exercitare moderată/sport 3-5 zile/săptămână)", "Foarte activ (exerciții grele/sport 6-7 zile pe săptămână)", "Extra activ (exercițiu/sport foarte greu și o muncă fizică)"]
    
    
    init(user: User) {
        _gender = State(initialValue: user.gender)
        _name = State(initialValue: user.fullname)
        _date = State(initialValue: user.formattedDob)
        _activity = State(initialValue: user.activity_factor)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 0) {
                Form {
                    Section(header: Text("Nume")) {
                        TextField("", text: $name)
                    }
                    Section(header: Text("Sex")) {
                        Picker(selection: $gender, label: EmptyView()) {
                            ForEach(0..<genders.count, id: \.self) { index in
                                Text(genders[index])
                                    .foregroundColor(Color.primary)
                            }
                        }
                        .scaledToFit()
                        .labelsHidden()
                        .padding(.horizontal, -8)
                    }
                    Section(header: Text("Data nașterii")) {
                            DatePicker("Data:", selection: $date, in: ...Date(), displayedComponents: .date)
                            .accentColor(.primary)
                    }
                    Section(header: Text("Nivel Activitate")) {
                        Picker(selection: $activity, label: EmptyView()) {
                            ForEach(0..<activityLevel.count, id: \.self) { index in
                                Text(activityLevel[index])
                                    .foregroundColor(Color.primary)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .scaledToFit()
                        .labelsHidden()
                        .padding(.horizontal, -8)
                    }
                }
            }
            .frame(maxWidth: 580)
            .navigationTitle("Setări Profil")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    Task(priority: .medium) {
                        try await self.settingsViewModel.updateProfile(gender: gender, fullname: name, dob: date, activity: activity)
                    }
                }
            }
            .onReceive(settingsViewModel.$didUpdateProfile, perform: { success in
                if success {
                    Task {
                        try await authViewModel.getUser()
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}


// MARK: - PREVIEW
struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            NavigationView {
                ProfileSettingsView(user: userPreviewData)
            }
            NavigationView {
                ProfileSettingsView(user: userPreviewData)
                    .preferredColorScheme(.dark)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(viewModel)
    }
}
