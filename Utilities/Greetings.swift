//
//  Greetings.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 02.04.2023.
//

import SwiftUI


func Greetings() -> String {
    // MARK: - PROPERTIES
    let hour = Calendar.current.component(.hour, from: Date())
    
    let NEW_DAY = 0
    let NOON = 12
    let SUNSET = 18
    let MIDNIGHT = 24
    
    var greetingText = "Salut" // Default greeting text
    
    // MARK: - SWITCH
    switch hour {
        case NEW_DAY..<NOON:
            greetingText = "Bună dimineața"
        case NOON..<SUNSET:
            greetingText = "Bine ai venit"
        case SUNSET..<MIDNIGHT:
            greetingText = "Bună seara"
        default:
            _ = "Salut"
    }
    
    return greetingText
}
