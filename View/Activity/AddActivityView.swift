//
//  AddActivityListView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 15.04.2023.
//

import SwiftUI

struct AddActivityListView: View {
    // MARK: - PROPERTIES
    @StateObject var viewModel = AddActivityListViewModel()
    
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
struct AddActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddActivityListView()
            }
            NavigationView {
                AddActivityListView()
            }
            .preferredColorScheme(.dark)
        }
    }
}
