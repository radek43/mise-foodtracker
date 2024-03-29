//
//  ProfileView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 15.12.2022.
//

import SwiftUI
import KeyboardToolbars


struct ProfileView: View {
    // MARK: - PROPERTIES
    @StateObject var settingsViewModel = SettingsViewModel()
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var logViewModel: LogViewModel
    
    @State private var gender: Int
    @State private var name: String
    @State private var date: Date
    @State private var activity: Int
    
    @State private var showDeleteConfirmation = false
    
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
                    
                    Button {
                        showDeleteConfirmation.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Ștergere jurnal")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                    .alert(isPresented:$showDeleteConfirmation) {
                        Alert(
                            title: Text("Ești sigur că vrei să ștergi toate jurnalele create?"),
                            message: Text("Această acțiune este permanentă"),
                            primaryButton: .destructive(Text("Șterge")) {
                                logViewModel.deleteLogs {
                                    NavigationUtil.popToRootView()
                                }
                            },
                            secondaryButton: .cancel(Text("Renunță"))
                        )
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
                Button("Modifică") {
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
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            NavigationView {
                ProfileView(user: userPreviewData)
            }
            NavigationView {
                ProfileView(user: userPreviewData)
                    .preferredColorScheme(.dark)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(viewModel)
    }
}
