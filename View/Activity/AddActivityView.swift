//
//  AddActivityView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 15.04.2023.
//

import SwiftUI

struct AddActivityView: View {
    // MARK: - PROPERTIES
    @StateObject var viewModel = AddActivityViewModel()
    
    @State private var activityTitle = ""
    @State private var met = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Form {
                // Title
                Section(header: Text("Titlu activitate:")) {
                    TextField("Alergare ușoară", text: $activityTitle)
                }
                // MET
                Section(header: Text("MET:")) {
                    TextField("2.5", text: $met)
                        .numbersOnly($met, includeDecimal: true, decimalPlaces: 2)
                }
            }
            .frame(maxWidth: 580)
            .navigationTitle("Adaugă o activitate nouă")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    Task(priority: .medium) {
                        try await viewModel.postActivity(title: activityTitle, met: met)
                    }
                }
            }
            .onReceive(viewModel.$didUploadActivity, perform: { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

// MARK: - PREVIEW
struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddActivityView()
            }
            NavigationView {
                AddActivityView()
            }
            .preferredColorScheme(.dark)
        }
    }
}
