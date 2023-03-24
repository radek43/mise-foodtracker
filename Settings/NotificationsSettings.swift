//
//  MeasurementsSettings.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 12/19/22.
//

import SwiftUI

struct NotificationsSettings: View {
    // MARK: - PROPERTIES
    @State private var breakfastNotifications = false
    @State private var lunchNotifications = false
    @State private var dinnerNotifications = false
    @State private var snackNotifications = false
    @State private var currentDate = Date()
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Form {
                Section {
                    Toggle(isOn: $breakfastNotifications) {
                        HStack {
                            Text("Mic Dejun")
                            Spacer()
                            if breakfastNotifications {
                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                                    .pickerStyle(.wheel)
                            } else {
                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                                    .pickerStyle(.wheel)
                                    .disabled(true)
                            }
                        }
                    }
                    Toggle(isOn: $lunchNotifications) {
                        HStack {
                            Text("Pranz")
                            Spacer()
                            if lunchNotifications {
                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                                    .pickerStyle(.wheel)
                            } else {
                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                                    .pickerStyle(.wheel)
                                    .disabled(true)
                            }
                        }
                    }
                    Toggle(isOn: $dinnerNotifications) {
                        HStack {
                            Text("Cina")
                            Spacer()
                            if dinnerNotifications {
                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                                    .pickerStyle(.wheel)
                            } else {
                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                                    .pickerStyle(.wheel)
                                    .disabled(true)
                            }
                        }
                    }
                    Toggle(isOn: $snackNotifications) {
                        HStack {
                            Text("Gustare")
                            Spacer()
                            if snackNotifications {
                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                                    .pickerStyle(.wheel)
                            } else {
                                DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                                    .pickerStyle(.wheel)
                                    .disabled(true)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Notificari")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Salveaza") {
                print("Buton salvare apasat")
            }
        }
    }
}

// MARK: - PREVIEW
struct NotificationsSettings_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationsSettings()
            NotificationsSettings()
                .preferredColorScheme(.dark)
        }
    }
}
