//
//  User.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 9/1/22.
//

import SwiftUI

// TOKEN MODEL
struct Token: Codable {
    let token: String
}

// USER MODEL
struct User: Codable {
    let fullname: String
    let name: String
    let email: String
    let is_staff: Bool
}

// EXTENSIONS
extension User {
    static let dummyData: [User] = [
        User(fullname: "John Doe", name: "john.doe", email: "john.doe@email.com", is_staff: false)
    ]
}
