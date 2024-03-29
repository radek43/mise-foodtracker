//
//  Extensions.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 23.03.2023.
//

import Foundation
import SwiftUI


extension Color {
    static let accent = Color("AccentColor")
    static let button = Color("ButtonColor")
    static let card = Color("CardBackground")
    static let background = Color("ColorBackground")
    static let formText = Color("SectionText")
    static let mono = Color("BlackAndWhite")
    static let navigation = Color("NavigationBackground")
    static let progress = Color("ProgressViewColor")
}

// Override NavigationBar Color
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        let standard = UINavigationBarAppearance()
        UINavigationBar.appearance().barTintColor = UIColor(Color.navigation)
        standard.configureWithOpaqueBackground()
        standard.backgroundColor = UIColor(Color.navigation)
        navigationBar.standardAppearance = standard
    }
}

// Override alert color
extension UIAlertController {
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let alertControllerView = view.superview?.superview {
            alertControllerView.tintColor = UIColor(Color.accent)
        }
    }
}

// Override TabBar Color
extension View {
    func tabViewStyle(backgroundColor: UIColor? = nil,
                      itemColor: UIColor? = nil,
                      selectedItemColor: UIColor? = nil,
                      badgeColor: UIColor? = nil) -> some View {
        onAppear {
            let itemAppearance = UITabBarItemAppearance()
            if let uiItemColor = itemColor {
                itemAppearance.normal.iconColor = uiItemColor
                itemAppearance.normal.titleTextAttributes = [
                    .foregroundColor: uiItemColor
                ]
            }
            if let uiSelectedItemColor = selectedItemColor {
                itemAppearance.selected.iconColor = uiSelectedItemColor
                itemAppearance.selected.titleTextAttributes = [
                    .foregroundColor: uiSelectedItemColor
                ]
            }
            if let uiBadgeColor = badgeColor {
                itemAppearance.normal.badgeBackgroundColor = uiBadgeColor
                itemAppearance.selected.badgeBackgroundColor = uiBadgeColor
            }
            
            let appearance = UITabBarAppearance()
            if let uiBackgroundColor = backgroundColor {
                appearance.backgroundColor = uiBackgroundColor
            }
            
            appearance.stackedLayoutAppearance = itemAppearance
            appearance.inlineLayoutAppearance = itemAppearance
            appearance.compactInlineLayoutAppearance = itemAppearance
            
            UITabBar.appearance().standardAppearance = appearance
        }
    }
    
    func getScreenBounds() -> CGRect{
        return UIScreen.main.bounds
    }
}

// Type definitions for devices
extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}

extension Date {
    func formatDate() -> String {
            let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d")
        return dateFormatter.string(from: self)
    }
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? Date()
    }
    
    func stripTime() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }
    
}

extension Float {
    func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Double {
    // Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension UINavigationBar {
    static func changeAppearance(clear: Bool) {
        let appearance = UINavigationBarAppearance()
        
        if clear {
            appearance.configureWithTransparentBackground()
        } else {
            appearance.configureWithDefaultBackground()
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

extension Array {
    mutating func remove(where condition: (Element) -> Bool) -> Element? {
        guard let index = firstIndex(where: condition) else {
            return nil
        }

        return remove(at: index)
    }
}

extension String {
    func isValid(regexPattern: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexPattern)
        if predicate.evaluate(with: self) == true {
            return true
        } else {
            return false
        }
    }
}
