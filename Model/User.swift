//
//  User.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/1/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    let userType: Int?
}

extension User {
    static let dummyData: [User] = [
        User(username: "john.doe", fullname: "John Dow", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/maiincercsieu.appspot.com/o/profile_image%2F4522A4C8-42DE-416C-AD8D-192BE9351009?alt=media&token=53f04e2f-5f9f-4e7c-9f47-eabb5ad29168", email: "john.doe@email.com", userType: 1)
    ]
}
