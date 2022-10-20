//
//  Post.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/20/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let continutPostare: String
    let likes: Int
    let timestamp: Timestamp
    let titluPostare: String
    let uid: String
    
    var user: User?
}

extension Post {
    static let dummyData: [Post] = [
        Post(continutPostare: "Postarea mea frumoasa",
             likes: 2,
             timestamp: Timestamp(seconds: 2, nanoseconds: 1),
             titluPostare: "Titlul Postarii mele lungi si frumoase la care mi-ar placea sa fie frumos aliniat textul dar ma tem ca nu va fi asa",
             uid: "2jk3hg32kj4hgwkd238y"),
        Post(continutPostare: "A doua mea postare frumoasa",
             likes: 2,
             timestamp: Timestamp(seconds: 3, nanoseconds: 1),
             titluPostare: "A doua mea postare frumoasa",
             uid: "h3g43k2432k4jvh")
        
    ]
}

