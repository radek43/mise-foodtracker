//
//  OnboardMeasurementsView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 26.04.2023.
//

import SwiftUI
import KeyboardToolbars

struct OnboardMeasurementsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var settingsViewModel = SettingsViewModel()
    
    @Binding var shouldShowOnboarding: Bool
    
    @State private var userWeight = ""
    @State private var userHeight = ""
    @State private var gender = 0
    @State private var date = Date()
    @State private var activity = 0
    
    let genders = ["Bărbat", "Femeie"]
    let activityLevel = ["Sedentar (exercițiu puțin sau deloc)", "Usor activ (exercitii usoare/sport 1-3 zile/saptamana)", "Moderat activ (exercitare moderată/sport 3-5 zile/săptămână)", "Foarte activ (exerciții grele/sport 6-7 zile pe săptămână)", "Extra activ (exercițiu/sport foarte greu și o muncă fizică)"]
    
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.currentUser != nil {
            NavigationView {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center) {
                        // Header card
                        HeaderView(title1: "", title2: "Înainte de a începe..")
                        
                        Text("Te rugăm să introduci următoarele date despre tine:")
                            .font(.subheadline)
                            .foregroundColor(Color.formText)
                            .padding([.leading, .top, .trailing])
                        
                        Form {
                            Section(header: Text("Înălțime(cm)")) {
                                TextField("", text: $userHeight)
                                    .numbersOnly($userHeight, includeDecimal: true, decimalPlaces: 2)
                            }
                            Section(header: Text("Greutate(kg)")) {
                                TextField("", text: $userWeight)
                                    .numbersOnly($userWeight, includeDecimal: true, decimalPlaces: 2)
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
                        .addHideKeyboardButton()
                        
                        NavigationLink {
                            OnboardObjectiveView(shouldShowOnboarding: $shouldShowOnboarding)
                                .onAppear {
                                    Task(priority: .medium) {
                                        try await self.settingsViewModel.updateProfileOnboard(weight: userWeight, height: userHeight, gender: gender, dob: date, activity: activity)
                                        try await self.authViewModel.getUser()
                                    }
                                }
                        } label: {
                            RectangleButton(text: "Continuă")
                        }
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.top)
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .accentColor(Color.white)
        }
    }
}

// MARK: - PREVIEWS
struct OnboardMeasurementsView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        authViewModel.currentUser = userPreviewData
        return Group {
            OnboardMeasurementsView(shouldShowOnboarding: .constant(true))
            OnboardMeasurementsView(shouldShowOnboarding: .constant(true))
                .preferredColorScheme(.dark)
        }
        .environmentObject(authViewModel)
        
    }
}
