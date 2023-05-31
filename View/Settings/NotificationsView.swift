//
//  MeasurementsView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 19.12.2022.
//

import SwiftUI


struct NotificationsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var notificationManager: NotificationManager
    @Environment(\.scenePhase) var scenePhase
    
    @State private var breakfastNotifications = false
    @State private var lunchNotifications = false
    @State private var dinnerNotifications = false
    @State private var snackNotifications = false
    @State private var currentDate = Date()
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 0) {
                if notificationManager.isGranted {
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
                } else {
                    Button {
                        notificationManager.openSettings()
                    } label: {
                        Text("Activează notificările")
                    }
                }
                

            }
            .frame(maxWidth: 580)
            .navigationTitle("Notificări")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Modifică") {
                    print("Buton salvare apasat")
                }
            }
        }
        .onAppear {
            Task {
                try? await notificationManager.requestAuthorization()
            }
        }
        .onChange(of: scenePhase) { newValue in
            if newValue == .active {
                Task {
                    await notificationManager.getCurrentSettings()
                }
            }
        }
    }
}


// MARK: - PREVIEW
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationsView()
            NotificationsView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(NotificationManager())
    }
}
