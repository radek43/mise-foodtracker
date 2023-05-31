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
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 0) {
                if notificationManager.isGranted {
                    Form {
                        Section {
                            Toggle(isOn: $notificationManager.isBreakfastNotificationEnabled) {
                                HStack {
                                    Text("Mic Dejun")
                                    Spacer()
                                    if notificationManager.isBreakfastNotificationEnabled {
                                        DatePicker("", selection: $notificationManager.breakfastTime, displayedComponents: .hourAndMinute)
                                            .pickerStyle(.wheel)
                                    }
                                }
                            }
                            .disabled(!notificationManager.isGranted)
                            .onChange(of: notificationManager.isBreakfastNotificationEnabled) { enabled in
                                if enabled {
                                    notificationManager.scheduleBreakfastNotification()
                                } else {
                                    notificationManager.cancelBreakfastNotification()
                                }
                            }
                            
                            Toggle(isOn: $notificationManager.isLunchNotificationEnabled) {
                                HStack {
                                    Text("Prânz")
                                    Spacer()
                                    if notificationManager.isLunchNotificationEnabled {
                                        DatePicker("", selection: $notificationManager.lunchTime, displayedComponents: .hourAndMinute)
                                            .pickerStyle(.wheel)
                                    }
                                }
                            }
                            .disabled(!notificationManager.isGranted)
                            .onChange(of: notificationManager.isLunchNotificationEnabled) { enabled in
                                if enabled {
                                    notificationManager.scheduleLunchNotification()
                                } else {
                                    notificationManager.cancelLunchNotification()
                                }
                            }
                            
                            Toggle(isOn: $notificationManager.isDinnerNotificationEnabled) {
                                HStack {
                                    Text("Cină")
                                    Spacer()
                                    if notificationManager.isDinnerNotificationEnabled {
                                        DatePicker("", selection: $notificationManager.dinnerTime, displayedComponents: .hourAndMinute)
                                            .pickerStyle(.wheel)
                                    }
                                }
                            }
                            .disabled(!notificationManager.isGranted)
                            .onChange(of: notificationManager.isDinnerNotificationEnabled) { enabled in
                                if enabled {
                                    notificationManager.scheduleDinnerNotification()
                                } else {
                                    notificationManager.cancelDinnerNotification()
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
