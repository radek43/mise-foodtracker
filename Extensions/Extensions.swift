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
    static let post = Color("PostDetailColor")
    static let accentLight = Color("AccentLight")
    static let formText = Color("SectionText")
    static let mono = Color("BlackAndWhite")
}

// Override NavigationBar Color
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor(Color.background)
        standard.shadowColor = UIColor(Color.background)
        navigationBar.standardAppearance = standard
        navigationBar.compactAppearance = standard
        navigationBar.scrollEdgeAppearance = standard
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

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
