//
//  EditActivityView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 16.04.2023.
//

import SwiftUI

struct EditActivityView: View {
    // MARK: - PROPERTIES
    @StateObject var activityEditViewModel = ActivityEditViewModel()
    
    @State private var activityTitle: String
    @State private var met: String
    
    let activityId: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    init(activity: Activity) {
        _activityTitle = State(initialValue: activity.title)
        _met = State(initialValue: activity.met)
        self.activityId = activity.id
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Form {
                // ACTIVITY TITLE
                Section(header: Text("Titlu activitate:")) {
                    TextField("Alergare ușoară", text: $activityTitle)
                }
                // MET
                Section(header: Text("MET:")) {
                    TextField("2.5", text: $met)
                        .numbersOnly($met, includeDecimal: true)
                }
            } //: END FORM
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
                        try await self.activityEditViewModel.updateActivity(id: activityId, title: activityTitle, met: met)
                    }
                }
            }
            .onReceive(activityEditViewModel.$didUpdateActivity, perform: { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            })
        } //: END ZSTACK
    }
}

// MARK: - PREVIEW
struct EditActivityView_Previews: PreviewProvider {
    static var previews: some View {
        EditActivityView(activity: previewActivityData[0])
    }
}