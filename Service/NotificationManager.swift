//
//  NotificationManager.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 30.05.2023.
//

import Foundation
import NotificationCenter

@MainActor
class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    @Published var isGranted = false
    @Published var isBreakfastNotificationEnabled = false
    @Published var isLunchNotificationEnabled = false
    @Published var isDinnerNotificationEnabled = false
    @Published var breakfastTime = Date() {
        didSet {
            if isBreakfastNotificationEnabled {
                cancelBreakfastNotification()
                scheduleBreakfastNotification()
                saveNotificationTimes()
            }
        }
    }
    @Published var lunchTime = Date() {
        didSet {
            if isLunchNotificationEnabled {
                cancelLunchNotification()
                scheduleLunchNotification()
                saveNotificationTimes()
            }
        }
    }
    
    @Published var dinnerTime = Date() {
        didSet {
            if isDinnerNotificationEnabled {
                cancelDinnerNotification()
                scheduleDinnerNotification()
                saveNotificationTimes()
            }
        }
    }
    
    private let userDefaults = UserDefaults.standard
    private let breakfastTimeKey = "BreakfastTime"
    private let lunchTimeKey = "LunchTime"
    private let dinnerTimeKey = "DinnerTime"
    
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override init() {
        super.init()
        notificationCenter.delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.sound, .banner]
    }
    
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
    
    func saveNotificationTimes() {
        userDefaults.set(breakfastTime, forKey: breakfastTimeKey)
        userDefaults.set(lunchTime, forKey: lunchTimeKey)
        userDefaults.set(dinnerTime, forKey: dinnerTimeKey)
    }
    
    func loadNotificationTimes() {
        if let savedBreakfastTime = userDefaults.object(forKey: breakfastTimeKey) as? Date {
            breakfastTime = savedBreakfastTime
        }
        
        if let savedLunchTime = userDefaults.object(forKey: lunchTimeKey) as? Date {
            lunchTime = savedLunchTime
        }
        
        if let savedDinnerTime = userDefaults.object(forKey: dinnerTimeKey) as? Date {
            dinnerTime = savedDinnerTime
        }
    }
    
    func scheduleDailyNotification(body: String, time: Date) {
        let content = UNMutableNotificationContent()
        content.body = body
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling daily notification: \(error)")
            } else {
                print("Daily notification scheduled successfully.")
            }
        }
    }
    
    func cancelNotification(identifier: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
    
    func scheduleBreakfastNotification() {
        scheduleDailyNotification(body: "Începe ziua în forță! Pregătește-ți un mic dejun sănătos și adaugă-l la jurnal.", time: breakfastTime)
    }
    
    func scheduleLunchNotification() {
        scheduleDailyNotification(body: "Este timpul să servești prânzul! Nu uita să îl adaugi la jurnal.", time: lunchTime)
    }
    
    func scheduleDinnerNotification() {
        scheduleDailyNotification(body: "Încheie-ți ziua într-o notă pozitivă cu o cină sănătoasă! Consecvența este cheia, așa că nu uita să adaugi cina la jurnal.", time: dinnerTime)
    }
    
    
    func cancelBreakfastNotification() {
        cancelNotification(identifier: "breakfastNotification")
    }
    
    func cancelLunchNotification() {
        cancelNotification(identifier: "lunchNotification")
    }
    
    func cancelDinnerNotification() {
        cancelNotification(identifier: "dinnerNotification")
    }
    
    
}
