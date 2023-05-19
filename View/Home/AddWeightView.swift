//
//  AddWeightView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 19.05.2023.
//

import SwiftUI
import KeyboardToolbars

struct AddWeightView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var logViewModel: LogViewModel
    
    @State private var userWeight: String
    
    @Environment(\.presentationMode) var presentationMode
    
    init(userWeight: String) {
        _userWeight = State(initialValue: userWeight)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Form {
                Section(header: Text("Greutate(Kg):")) {
                    TextField("", text: $userWeight)
                        .numbersOnly($userWeight, includeDecimal: true, decimalPlaces: 2)
                }
            }
            .frame(maxWidth: 580)
            .navigationTitle("Greutate")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Adaugă") {
                    Task(priority: .medium) {
                        try await self.logViewModel.updateUserWeight(weight: userWeight)
                    }
                    logViewModel.addWeightToLog(date: Date().stripTime(), weight: Double(userWeight) ?? 0)
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct AddWeightView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            NavigationView {
                AddWeightView(userWeight: "20")
            }
            NavigationView {
                AddWeightView(userWeight: "20")
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(viewModel)
        }
    }
}
