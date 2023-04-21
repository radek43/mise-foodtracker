//
//  MeasurementsSettings.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 12/19/22.
//

import SwiftUI
import Combine


struct MeasurementsSettings: View {
    // MARK: - PROPERTIES
    @StateObject var settingsViewModel = SettingsViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var userWeight: String
    @State private var userHeight: String
    
    @Environment(\.presentationMode) var presentationMode
    
    init(user: User) {
        _userWeight = State(initialValue: user.weight)
        _userHeight = State(initialValue: user.height)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Form {
                // ACTIVITY TITLE
                Section(header: Text("Greutate(Kg):")) {
                    TextField("", text: $userWeight)
                        .numbersOnly($userWeight, includeDecimal: true, decimalPlaces: 2)
                }
                // MET
                Section(header: Text("Înălțime(cm):")) {
                    TextField("", text: $userHeight)
                        .numbersOnly($userHeight, includeDecimal: true, decimalPlaces: 2)
                }
            } //: END FORM
            .frame(maxWidth: 580)
            .navigationTitle("Editare măsurători")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    Task(priority: .medium) {
                        try await self.settingsViewModel.updateMeasurements(weight: userWeight, height: userHeight)
                    }
                }
            }
            .onReceive(settingsViewModel.$didUpdateMeasurements, perform: { success in
                if success {
                    Task {
                        try await authViewModel.getUser()
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            })
        } //: END ZSTACK
    }
}


// MARK: - PREVIEW
struct MeasurementsSettings_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            NavigationView {
                MeasurementsSettings(user: userPreviewData)
            }
            NavigationView {
                MeasurementsSettings(user: userPreviewData)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(viewModel)
    }
}
