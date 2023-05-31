//
//  NotificationManager.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 30.05.2023.
//

import Foundation
import NotificationCenter

@MainActor
class NotificationManager: ObservableObject {
    @Published var isGranted = false

    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = (currentSettings.authorizationStatus == .authorized)
        print(isGranted)
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
}
