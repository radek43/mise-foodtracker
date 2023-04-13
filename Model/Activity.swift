//
//  Activity.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 13.04.2023.
//

import Foundation
import SwiftUI

struct Activity: Codable, Identifiable {
    let id: Int
    let title: String
    let met: String
}

enum ActivityError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return ""
            case .serverError:
                return "S-a produs o eroare la partea de server. Va rugam incercati mai tarziu"
            case .invalidData:
                return "A aparut o eroare. Va rugam incercati mai tarziu."
            case .unknown(let error):
                return error.localizedDescription
        }
    }
}
