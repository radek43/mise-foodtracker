//
//  User.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/1/22.
//


struct Token: Codable {
    let token: String
}


struct User: Codable {
    let email: String
    let name: String
}

extension User {
    static let dummyData: [User] = [
        User(email: "john.doe@email.com", name: "John Doe")
    ]
}
