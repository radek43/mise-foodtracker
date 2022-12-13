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
